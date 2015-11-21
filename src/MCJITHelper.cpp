/* ===============================================================
 * Helper component for LLVM MCJIT compiler.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "MCJITHelper.hpp"
#include "OSRLibrary.hpp"
#include "StateMap.hpp"

#include <llvm/Analysis/Passes.h>
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/JITEventListener.h>
#include <llvm/ExecutionEngine/MCJIT.h>
#include <llvm/ExecutionEngine/SectionMemoryManager.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/PassManager.h>
#include <llvm/Support/DynamicLibrary.h>
#include <llvm/Support/raw_os_ostream.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/FormattedStream.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Transforms/IPO.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Utils/Cloning.h>
#include <llvm/Transforms/Utils/ValueMapper.h>

#undef NDEBUG
#include <cassert>
#include <cstdio>
#include <cerrno>
#include <cstring>
#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <vector>

#include <fcntl.h>

using namespace llvm;

std::map<Function*, MCJITHelper::OpenCodeGeneratorPair> MCJITHelper::openCodeGeneratorPairMap;

MCJITHelper::~MCJITHelper() {
    delete JIT;
    delete Builder;
    for (JITEventListener* L: Listeners) delete(L);
}

FunctionPassManager MCJITHelper::createFPM(Module* M, bool CFGSimplificationOnly) {
    FunctionPassManager FPM(M);

    if (!CFGSimplificationOnly) {
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
    }

    // Simplify the control flow graph (e.g. delete unreachable blocks)
    FPM.add(createCFGSimplificationPass());

    FPM.doInitialization();

    return FPM;
}

void MCJITHelper::trackAsmCodeUtil(Module* M) {
    if (trackAsmCode) {
        // TODO
        #if 0
        formatted_raw_ostream formAsmFdStream(*asmFdStream);
        legacy::PassManager PM;
        PM.add(new DataLayoutPass());
        TargetMachine *TM = JIT->getTargetMachine();
        TM->addPassesToEmitFile(PM, formAsmFdStream, TargetMachine::CGFT_AssemblyFile);
        PM.run(*M);
        #endif
    }
}

void MCJITHelper::addModule(std::unique_ptr<Module> M) {
    Module* M_ptr = M.get();

    M_ptr->setDataLayout(JIT->getDataLayout());

    // for showing assembly code when generated
    trackAsmCodeUtil(M_ptr);

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

    return M;
}

bool MCJITHelper::loadDynamicLibrary(const std::string &FileName) {
    std::string errMsg;
    bool ret = sys::DynamicLibrary::LoadLibraryPermanently(FileName.c_str(), &errMsg);
    if (ret) { // returns false on success - https://llvm.org/bugs/show_bug.cgi?id=3069
        std::cerr << "[MCJITHelper] ERROR - could not load library " << FileName << ":" << std::endl;
        std::cerr << "--> " << errMsg << std::endl;

    }
    return ret;
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

int (*MCJITHelper::createAnonFunctionForCall(const std::string &FunctionName,
        std::vector<int> &Arguments))() {
    static int i = 1;
    char buf[256];

    sprintf(buf, "M-anonymous%s%d", FunctionName.c_str(), i);
    std::unique_ptr<Module> M = llvm::make_unique<Module>(buf, Context);

    // look up function symbol first
    if (getFunction(FunctionName) == nullptr) {
        std::cerr << "ERROR: invalid function symbol for the call" << std::endl;
        return nullptr;
    }

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

    addModule(std::move(M));

    int (*fun)() = (int (*)())JIT->getFunctionAddress(AnonymousFunctionName); // TODO

    ++i; // increment ID (TODO: change the linkage type?)

    return fun;
}

bool MCJITHelper::toggleTrackAsm() {
    #if 0
    if (asmFdStream == nullptr) {
        asmFdStream = initializeFdStream(asmFileName);
    }

    return !(trackAsmCode = !trackAsmCode); // return the old status
    #endif

    return false; // TODO
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

std::string MCJITHelper::prototypeToString(Function& F) {
    std::string sym_str;
    bool isExtern = F.isDeclaration();
    if (isExtern) {
        sym_str.append("extern ");
    }

    sym_str.append(LLVMTypeToString(F.getReturnType()) + " " + F.getName().str() + "(");

    int slotID = 0;
    if (F.arg_size() > 0) {
        for (Function::arg_iterator it = F.arg_begin(), end = F.arg_end(); ; ) {
            Argument &arg = *it;
            sym_str.append(LLVMTypeToString(arg.getType()));
            if (arg.hasName()) {
                sym_str.append(" %" + arg.getName().str());
            } else if (!isExtern) {
                sym_str.append(" %" + std::to_string(slotID++));
            }
            if (++it != end) {
                sym_str.append(", ");
            } else {
                break;
            }
        }
    }
    sym_str.append(")");

    return sym_str;
}

void MCJITHelper::showModules() {
    for (Module* M: Modules) {
        std::cerr << "[Module: " << M->getModuleIdentifier() << "]" << std::endl;
        if (M->empty() && M->global_empty()) {
            std::cerr << "-" << std::endl;
            continue;
        }

        raw_os_ostream errStream(std::cerr);

        for (Module::global_iterator gIt = M->global_begin(), gEnd = M->global_end();
                gIt != gEnd; ++gIt) {
            GlobalVariable &g = *gIt;
            g.print(errStream);
            std::cerr << std::endl;
        }

        for (Module::iterator it = M->begin(), end = M->end(); it != end; ++it) {
            std::cerr << prototypeToString(*it) << std::endl;
        }
    }
}

void MCJITHelper::showFunctions() {
    std::cerr << "[Currently active functions]" << std::endl;
    if (ActiveFunctions.empty()) {
        std::cerr << "No functions are present." << std::endl;
    } else {
        for (std::map<std::string, Function*>::iterator it = ActiveFunctions.begin(),
                end = ActiveFunctions.end(); it != end; ++it) {
            Function* F = it->second;
            std::cerr << prototypeToString(*F) << " [" << F->getParent()->getModuleIdentifier() << "]" << std::endl;
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
    return new FCmpInst(CmpInst::FCMP_TRUE, zeroConst, zeroConst, "alwaysOSR");
}

CmpInst* MCJITHelper::generateAlwaysFalseCond() {
    ConstantFP* zeroConst = ConstantFP::get(Context, APFloat(0.0));
    return new FCmpInst(CmpInst::FCMP_FALSE, zeroConst, zeroConst, "neverOSR");
}

std::string& MCJITHelper::LLVMTypeToString(Type* type) {
    static std::string type_str;
    static llvm::raw_string_ostream type_rso(type_str);
    type_str.clear();
    type->print(type_rso);
    return type_rso.str();
}

std::pair<Function*, Value*> MCJITHelper::genContFunForOpenOSRGenerator(
        Function* F1, OpenCodeGeneratorInfo* extraInfo) {
    MCJITHelper* TheHelper = extraInfo->TheHelper;
    bool verbose = TheHelper->verbose;

    Function* orig = extraInfo->clonedFun;
    Instruction* origLoc = extraInfo->clonedOSRSrc;
    Value* origProfDataVal = extraInfo->clonedProfDataVal;
    std::vector<Value*>* origLiveValsVec = extraInfo->liveValsVecInClone;

    std::pair<Function*, StateMap*> identityPair = StateMap::generateIdentityMapping(orig);

    Function* F2 = identityPair.first;
    StateMap* M = identityPair.second;

    Value* profDataValInF2 = (origProfDataVal)
            ? M->getCorrespondingOneToOneValue(origProfDataVal)
            : nullptr;

    StateMap* M_F2toOSRContFun;

    Instruction* LPad = M->getLandingPad(origLoc);

    std::string OSRDestFunName = (F2->getName().str()).append("to");
    Function* OSRContFun = OSRLibrary::genContinuationFunc(TheHelper->Context,
            *orig, *F2, *origLoc, *LPad, *origLiveValsVec, *M, &OSRDestFunName, verbose, &M_F2toOSRContFun);

    Value* profDataVal = (origProfDataVal)
            ? M_F2toOSRContFun->getCorrespondingOneToOneValue(profDataValInF2)
            : nullptr;
    assert ((origProfDataVal == nullptr || profDataVal != nullptr)
            && "broken state map for continuation function");

    delete F2;
    delete M;
    delete M_F2toOSRContFun;

    return std::pair<Function*, Value*>(OSRContFun, profDataVal);
}


void* MCJITHelper::identityGeneratorForOpenOSR(Function* F1, Instruction* OSRSrc, void* extra, void* profDataAddr) {
    OpenCodeGeneratorInfo* extraInfo = (OpenCodeGeneratorInfo*) extra;
    MCJITHelper* TheHelper = extraInfo->TheHelper;
    bool verbose = TheHelper->verbose;

    if (verbose) {
        std::cerr << "Value for F1 is " << F1 << std::endl;
        std::cerr << "Value for OSRSrc is " << OSRSrc << std::endl;
        std::cerr << "Value for extra is " << extra << std::endl;
        std::cerr << "Value for profDataAddr is " << profDataAddr << std::endl;
    }

    std::pair<Function*, Value*> contPair = genContFunForOpenOSRGenerator(F1,
            extraInfo);
    Function* OSRContFun = contPair.first;
    assert(contPair.second == nullptr && "expected null profDataVal!");
    std::string OSRContFunName = OSRContFun->getName().str();

    // put the generated code into a module
    std::string modForJITName = "OpenOSRClone";
    modForJITName.append(OSRContFunName);
    std::unique_ptr<Module> modForJIT = llvm::make_unique<Module>(modForJITName, TheHelper->Context);
    Module* modForJIT_ptr = modForJIT.get();
    modForJIT_ptr->getFunctionList().push_back(OSRContFun);
    verifyFunction(*OSRContFun, &outs());

    // remove dead code
    FunctionPassManager FPM(modForJIT_ptr);
    FPM.add(createCFGSimplificationPass());
    FPM.doInitialization();
    FPM.run(*OSRContFun);

    // compile code
    TheHelper->addModule(std::move(modForJIT));
    return (void*)TheHelper->JIT->getFunctionAddress(OSRContFunName);
}

void* MCJITHelper::dynamicInlinerForOpenOSR(Function* F1, Instruction* OSRSrc, void* extra, void* profDataAddr) {
    OpenCodeGeneratorInfo* extraInfo = (OpenCodeGeneratorInfo*) extra;
    MCJITHelper* TheHelper = extraInfo->TheHelper;
    bool verbose = TheHelper->verbose;

    if (verbose) {
        std::cerr << "Value for F1 is " << F1 << std::endl;
        std::cerr << "Value for OSRSrc is " << OSRSrc << std::endl;
        std::cerr << "Value for extra is " << extra << std::endl;
        std::cerr << "Value for profDataAddr is " << profDataAddr << std::endl;
    }

    std::pair<Function*, Value*> contPair = genContFunForOpenOSRGenerator(F1,
            extraInfo);
    Function* OSRContFun = contPair.first;
    Value* valToInline = contPair.second;
    std::string OSRContFunName = OSRContFun->getName().str();

    // create a module for generated code
    std::string modForJITName = "OpenOSRDynInline";
    modForJITName.append(OSRContFunName);
    std::unique_ptr<Module> modForJIT = llvm::make_unique<Module>(modForJITName,
            TheHelper->Context);
    Module* modForJIT_ptr = modForJIT.get();

    // determine which function is called
    uint64_t calledFun = (uint64_t)profDataAddr;

    std::cerr << "Address of invoked function: " << calledFun << std::endl;
    Function* funToInline = nullptr;
    for (AddrSymPair &pair: TheHelper->CompiledFunAddrTable) {
        if (pair.first == calledFun) {
            std::string &FunName = pair.second;
            funToInline = TheHelper->getFunction(FunName);
            break;
        }
    }

    Function* myFunToInline = nullptr;
    if (funToInline == nullptr) {
        std::cerr << "Sorry, I could not determine which function was called!" << std::endl;
    } else {
        std::cerr << "Function being inlined: " << funToInline->getName().str() << std::endl;
        ValueToValueMapTy VMap;
        myFunToInline = CloneFunction(funToInline, VMap, false, nullptr);
        myFunToInline->addFnAttr(Attribute::AlwaysInline);
        myFunToInline->setLinkage(Function::LinkageTypes::PrivateLinkage);
        modForJIT_ptr->getFunctionList().push_back(myFunToInline);
        OSRLibrary::fixUsesOfFunctionsAndGlobals(funToInline, myFunToInline);
        for (Value::use_iterator UI = valToInline->use_begin(),
                UE = valToInline->use_end(); UI != UE; ) {
            Use &U = *(UI++);
            if (CallInst* CI = dyn_cast<CallInst>(U.getUser())) {
                if (CI->getParent()->getParent() != OSRContFun) continue;
                if (verbose) {
                    raw_os_ostream errStream(std::cerr);
                    std::cerr << "Updating instruction ";
                    CI->print(errStream);
                    std::cerr << std::endl;
                }
                U.set(myFunToInline);
            }
        }
    }

    modForJIT_ptr->getFunctionList().push_back(OSRContFun);
    verifyFunction(*OSRContFun, &outs());

    // remove dead code & inline when possible
    FunctionPassManager FPM(modForJIT_ptr);
    FPM.add(createCFGSimplificationPass());
    FPM.doInitialization();
    FPM.run(*OSRContFun);

    if (funToInline != nullptr) {
        PassManager PM;
        PM.add(llvm::createAlwaysInlinerPass());
        PM.run(*modForJIT_ptr);
    }

    // compile code
    TheHelper->addModule(std::move(modForJIT));
    return (void*)TheHelper->JIT->getFunctionAddress(OSRContFunName);
}

void MCJITHelper::SymListener::NotifyObjectEmitted(const object::ObjectFile &Obj,
        const RuntimeDyld::LoadedObjectInfo &L) {
    using namespace llvm::object;
    OwningBinary<ObjectFile> DebugObjOwner = L.getObjectForDebug(Obj);
    const ObjectFile &DebugObj = *DebugObjOwner.getBinary();

    bool verbose = *verboseFlagPtr;
    for (symbol_iterator it = DebugObj.symbol_begin(),
            end = DebugObj.symbol_end(); it != end; ++it) {
        object::SymbolRef::Type SymType;
        if (it->getType(SymType)) continue;
        if (SymType == SymbolRef::ST_Function) {
            StringRef  name;
            uint64_t   addr;
            if (it->getName(name)) continue;
            if (it->getAddress(addr)) continue;

            Table->push_back(AddrSymPair(addr, name.str()));
            if (verbose) {
                std::cerr << "Loading native code for function " << name.str()
                          << " at address " << (void*)addr << std::endl;
            }
        }
    }
}

std::vector<uint64_t> MCJITHelper::getCompiledFuncAddr(const std::string &Name) {
    std::vector<uint64_t> result;

    for (AddrSymPair pair: CompiledFunAddrTable) {
        // order: most recently compiled first
        if (Name == pair.second)
            result.push_back(pair.first);
    }

    return result;
}

bool MCJITHelper::canModifyModule(Module* M) {
    for (Module::iterator it = M->begin(), end = M->end(); it != end; ++it) {
        Function* F = it;
        std::vector<uint64_t> addresses = getCompiledFuncAddr(F->getName().str());

        // conservative approach: if the same function symbol has been used in
        // a different compiled module, this method yields a false positive
        if (!addresses.empty()) return false;
    }

    return true;
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