/* ===============================================================
 * Helper component for LLVM MCJIT compiler.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "MCJITHelper.hpp"

#include "llvm/Analysis/Passes.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/JITEventListener.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/PassManager.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <cstdio>
#include <cerrno>
#include <cstring>
#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <vector>

#include <fcntl.h>

#include "OSRLibrary.hpp"
#include "StateMap.hpp"

using namespace llvm;

MCJITHelper::~MCJITHelper() {
    delete JIT;
    delete Builder;
    for (JITEventListener* L: Listeners) delete(L);
}

void MCJITHelper::addModule(std::unique_ptr<Module> M, bool OptimizeModule) {
    Module* M_ptr = M.get();

    M_ptr->setDataLayout(JIT->getDataLayout());

    if (OptimizeModule) {
        FunctionPassManager FPM(M_ptr);

        /* OPTIMIZER PIPELINE */

        // Register info about how the target lays out data structures
        FPM.add(new DataLayoutPass());

        // Provide basic AliasAnalysis support for GVN
        FPM.add(createBasicAliasAnalysisPass());
        // Promote allocas to registers
        FPM.add(createPromoteMemoryToRegisterPass());
        // Do simple peephole & bit-twiddling optimizations
        FPM.add(createInstructionCombiningPass());
        // Reassociate expressions
        FPM.add(createReassociatePass());
        // Eliminate Common SubExpressions
        FPM.add(createGVNPass());
        // Simplify the control flow graph (e.g. delete unreachable blocks)
        FPM.add(createCFGSimplificationPass());

        FPM.doInitialization();

        // apply to each function
        Module::iterator it;
        Module::iterator end = M->end();
        for (it = M->begin(); it != end; ++it) {
            FPM.run(*it);
        }
    }

    // for showing assembly code when generated
    if (trackAsmCode) {
        formatted_raw_ostream formAsmFdStream(*asmFdStream);
        legacy::PassManager PM;
        PM.add(new DataLayoutPass());
        TargetMachine *TM = JIT->getTargetMachine();
        TM->addPassesToEmitFile(PM, formAsmFdStream, TargetMachine::CGFT_AssemblyFile);
        PM.run(*M_ptr);
    }

    Modules.push_back(M_ptr);

    for (Module::iterator it = M_ptr->begin(), end = M_ptr->end(); it != end; ++it) {
        registerFunction(it);
    }

    JIT->addModule(std::move(M));
}

std::unique_ptr<Module> MCJITHelper::createModuleFromFile(const std::string &FileName) {
    // TODO check for file existence
    SMDiagnostic Err;
    std::unique_ptr<Module> M = parseIRFile(FileName, Err, Context); // TODO
    if (!M) {
        Err.print("IR parsing failed: ", errs());
        return nullptr;
    }

    char ModID[256];
    sprintf(ModID, "IR:%s", FileName.c_str());
    M->setModuleIdentifier(ModID);

    return M;
}

void* MCJITHelper::getPointerToNamedFunction(const std::string &Name) {
    void *ptr = JIT->getPointerToNamedFunction(Name, false);
    return ptr;
}

Function* MCJITHelper::getFunction(const std::string &Name) {
    std::map<std::string, Function*>::iterator it = ActiveFunctions.find(Name);
    if (it == ActiveFunctions.end()) {
        std::cerr << "[MCJITHelper] Couldn't locate Function* object for function " << Name
                  << ", I will rely on the ExecutionEngine!" << std::endl;
        return JIT->FindFunctionNamed(Name.c_str());
    } else {
        return it->second;
    }
}

int (*MCJITHelper::createAnonymousFunctionForCall(const std::string &FunctionName, std::vector<int> &Arguments))() {
    static int i = 1;
    char buf[256];

    sprintf(buf, "M-anonymous%s%d", FunctionName.c_str(), i);
    std::unique_ptr<Module> M = llvm::make_unique<Module>(buf, Context);

    // create a prototype for the callee
    std::vector<Type*> CalleeProtoArgs(Arguments.size(), Type::getInt32Ty(Context));
    FunctionType *PFT = FunctionType::get(Type::getInt32Ty(Context), CalleeProtoArgs, false);
    Function *P = Function::Create(PFT, Function::ExternalLinkage, FunctionName, M.get());

    // create an anonymous function to perform the call
    std::string AnonymousFunctionName(buf+2);
    FunctionType *FT = FunctionType::get(Type::getInt32Ty(Context), false);
    Function *F = Function::Create(FT, Function::ExternalLinkage, AnonymousFunctionName, M.get());

    BasicBlock *BB = BasicBlock::Create(getGlobalContext(), "entry", F);
    Builder->SetInsertPoint(BB);

    Function *Callee = P;
    if (Callee == nullptr) {
        std::cerr << "[ERROR] cannot resolve function " << FunctionName.c_str() << std::endl;
        return 0; // TODO
    }
    std::vector<Value*> CalleeArgs;
    for (const int arg: Arguments) {
        CalleeArgs.push_back(ConstantInt::get(Context, APInt(32, arg, true)));
    }

    Value* ret = Builder->CreateCall(Callee, CalleeArgs, "call");
    Builder->CreateRet(ret);

    verifyFunction(*F);

    addModule(std::move(M), false);

    int (*fun)() = (int (*)())JIT->getFunctionAddress(AnonymousFunctionName); // TODO

    ++i; // increment ID (TODO: change the linkage type?)

    return fun;
}

bool MCJITHelper::toggleTrackAsm() {
    if (asmFdStream == nullptr) {
        asmFdStream = initializeFdStream(asmFileName);
    }

    return !(trackAsmCode = !trackAsmCode); // return the old status
}

void MCJITHelper::registerFunction(Function* F) {
    std::string name = F->getName().str();
    if (F->empty()) { // declare
        std::map<std::string, std::vector<Function*>>::iterator it = FunctionPrototypes.find(name);
        if (it == FunctionPrototypes.end()) {
            FunctionPrototypes.insert(std::pair<std::string, std::vector<Function*>>(name, std::vector<Function*>{F}));
        } else {
            it->second.push_back(F);
        }
    } else { // define
        std::map<std::string, Function*>::iterator activeIt = ActiveFunctions.find(name);
        if (activeIt == ActiveFunctions.end()) {
            ActiveFunctions.insert(std::pair<std::string, Function*>(name, F));
        } else {
            // an active symbole exists: replace it and update PrevFunctions
            Function* oldF = activeIt->second;
            activeIt->second = F;
            std::map<std::string, std::vector<Function*>>::iterator it = PrevFunctions.find(name);
            if (it == PrevFunctions.end()) {
                PrevFunctions.insert(std::pair<std::string, std::vector<Function*>>(name, std::vector<Function*>{oldF}));
            } else {
                it->second.push_back(oldF);
            }
        }
    }
}

void MCJITHelper::prototypeToString(Function& F, std::string &sym_str, std::string &type_str, raw_string_ostream &type_rso) {
    if (F.isDeclaration()) {
        sym_str.append("extern ");
    }
    F.getReturnType()->print(type_rso);
    sym_str.append(type_rso.str() + " " + F.getName().str() + "(");
    type_str.clear();

    if (F.arg_size() > 0) {
        for (Function::arg_iterator it = F.arg_begin(), end = F.arg_end(); ; ) {
            Argument &arg = *it;
            arg.getType()->print(type_rso);
            sym_str.append(type_rso.str());
            type_str.clear();
            if (arg.hasName()) {
                sym_str.append(" " + arg.getName().str());
            }
            if (++it != end) {
                sym_str.append(", ");
            } else {
                break;
            }
        }
    }
    sym_str.append(")");
}

void MCJITHelper::showModules() {
    std::string type_str;
    raw_string_ostream type_rso(type_str);

    for (Module* M: Modules) {
        std::cerr << "[Module: " << M->getModuleIdentifier() << "]" << std::endl;
        if (M->empty() && M->global_empty()) {
            std::cerr << "-" << std::endl;
            continue;
        }

        // TODO globals

        for (Module::iterator it = M->begin(), end = M->end(); it != end; ++it) {
            std::string fun_str;
            prototypeToString(*it, fun_str, type_str, type_rso);
            std::cerr << fun_str << std::endl;
        }
    }
}

void MCJITHelper::showFunctions() {
    std::cerr << "[Currently active functions]" << std::endl;
    if (ActiveFunctions.empty()) {
        std::cerr << "No functions are present." << std::endl;
    } else {
        std::string type_str;
        raw_string_ostream type_rso(type_str);
        for (std::map<std::string, Function*>::iterator it = ActiveFunctions.begin(),
                end = ActiveFunctions.end(); it != end; ++it) {
            Function* F = it->second;
            std::string fun_str;
            prototypeToString(*F, fun_str, type_str, type_rso);
            std::cerr << fun_str << " [" << F->getParent()->getModuleIdentifier() << "]" << std::endl;
        }
        if (!PrevFunctions.empty()) {
            std::cerr << std::endl << "[Previously active functions]" << std::endl;
            for (std::map<std::string, std::vector<Function*>>::iterator it = PrevFunctions.begin(),
                    end = PrevFunctions.end(); it != end; ++it) {
                std::cerr << it->first << " defined in:" << std::endl;
                for (Function* F: it->second) {
                    std::cerr << "-> [" << F->getParent()->getModuleIdentifier() << "]" << std::endl;
                }
            }
        }
    }
}

void MCJITHelper::showTrackedAsm() {
    if (asmFdStream == nullptr) {
        std::cerr << "[Warning] Cannot use showTrackedAsm() when raw_fd_ostream has not "
                    "been created yet! Did you forget to enable tracking?" << std::endl;
        return;
    }

    std::string line;
    std::ifstream f(asmFileName);
    if (!f.is_open()) {
        std::cerr << "Cannot open\"" << asmFileName << "\" written by the raw_fd_ostream for ASM: "
                << strerror(errno) << std::endl;
        exit(EXIT_FAILURE);
    }

    while(getline(f, line)) {
        std::cerr << line << std::endl;
    }

    if (f.bad()) {
        std::cerr << "Error while reading file \"" << asmFileName << "\" written by the raw_fd_ostream for ASM: "
                << strerror(errno) << std::endl;
        exit(EXIT_FAILURE);
    }
}

raw_ostream* MCJITHelper::initializeFdStream(const char* fileName) {
    int desc = open(fileName, O_WRONLY | O_CREAT | O_TRUNC, 0644);

    if (desc < 0) {
        std::cerr << "Cannot open \"" << fileName << "\" file for creating a raw_fd_ostream: "
                  << strerror(errno) << std::endl;
        exit(EXIT_FAILURE);
    }

    // setting 2nd arg to true means that desc is closed when fdStream is destroyed
    raw_ostream* fdStream = new raw_fd_ostream(desc, true, false);

    return fdStream;
}

CmpInst* MCJITHelper::generateAlwaysTrueCond() {
    // FCMP_TRUE will always be folded
    ConstantFP* zeroConst = ConstantFP::get(Context, APFloat(0.0));
    //return Builder->CreateFCmp(CmpInst::FCMP_TRUE, zeroConst, zeroConst, "alwaysOSR");
    return new FCmpInst(CmpInst::FCMP_TRUE, zeroConst, zeroConst, "alwaysOSR");
}

ValueToValueMapTy* MCJITHelper::generateIdentityMapping(Function* F) {
    ValueToValueMapTy* VMap = new ValueToValueMapTy();

    // arguments
    for (Function::arg_iterator argIt = F->arg_begin(), argEnd = F->arg_end(); argIt != argEnd; ++argIt) {
        (*VMap)[argIt] = argIt;
    }

    // TODO: metadata (also in the body?)

    for (Function::iterator bbIt = F->begin(), bbEnd = F->end(); bbIt != bbEnd; ++bbIt) {
        // basic blocks
        (*VMap)[bbIt] = bbIt;

        // TODO: BB.hasAddressTaken() ?

        for (BasicBlock::iterator insIt = bbIt->begin(), insEnd = bbIt->end(); insIt != insEnd; ++insIt) {
            // instructions
            (*VMap)[insIt] = insIt;

            /** Code adapted from MapValue() called by RemapInstruction() **/
            // operators
            for (User::op_iterator opIt = insIt->op_begin(), opEnd = insIt->op_end(); opIt != opEnd; ++opIt) {
                Value* v = *opIt;
                ValueToValueMapTy::iterator I = VMap->find(v);
                if (I != VMap->end() && I->second) continue; // value already exists in VMap
                (*VMap)[v] = v;
            }
        }
    }

    return VMap;
}

void* MCJITHelper::identityGeneratorForOpenOSR(OSRLibrary::RawOpenOSRInfo *rawInfo, void* profDataAddr) {

    OSRLibrary::OpenOSRInfo* OSRInfo = (OSRLibrary::OpenOSRInfo*) rawInfo;
    MCJITHelperOSRInfo* extraInfo = (MCJITHelperOSRInfo*)OSRInfo->extra;

    Function* F1 = OSRInfo->f1;
    BasicBlock* B1 = OSRInfo->b1;

    // debug info
    std::cerr << "Value for rawInfo is " << rawInfo << std::endl;
    std::cerr << "Value for profDataAddr is " << profDataAddr << std::endl;
    std::cerr << "Value for f1 is " << F1 << std::endl;
    std::cerr << "Value for b1 is " << B1 << std::endl;
    std::cerr << "Value for extra is " << extraInfo << std::endl;

    std::pair<Function*, StateMap*> identityPair = StateMap::generateIdentityMapping(OSRInfo->f1);

    Function* F2 = identityPair.first;
    extraInfo->f2 = identityPair.first;

    StateMap* M = identityPair.second;
    extraInfo->m = identityPair.second;

    BasicBlock* B2 = M->getCorrespondingBlock(B1);

    LivenessAnalysis l(OSRInfo->f1);
    std::vector<Value*>* valuesToPass = StateMap::getValuesToSetForBlock(*B1, l.getLiveInValues(B1));
    StateMap::BlockPair blockPair(B1, B2);
    std::string OSRDestFunName = (F2->getName().str()).append("DestOSR");
    Function* OSRDestFun = OSRLibrary::generateOSRDestFun(*F1, *F2, blockPair, *valuesToPass, *M, OSRDestFunName);
    delete valuesToPass;

    // compile the generated code
    MCJITHelper *TheHelper = extraInfo->TheHelper;

    std::string modForJITName = "openOSRModuleFor";
    modForJITName.append(OSRDestFunName);
    std::unique_ptr<Module> modForJIT = llvm::make_unique<Module>(modForJITName, TheHelper->Context);
    Module* modForJIT_ptr = modForJIT.get();
    modForJIT_ptr->getFunctionList().push_back(OSRDestFun);

    verifyFunction(*OSRDestFun, &outs()); // use llvm::outs for now

    FunctionPassManager FPM(modForJIT_ptr);
    FPM.add(createCFGSimplificationPass());
    FPM.doInitialization();
    FPM.run(*OSRDestFun);

    TheHelper->addModule(std::move(modForJIT), false);

    return (void*)TheHelper->JIT->getFunctionAddress(OSRDestFunName);
}

/*
 * OSR library for LLVM. Copyright (C) 2015 Daniele Cono D'Elia
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 3 of the License, or (at your option) any
 * later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
*/