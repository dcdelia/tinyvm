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
#include "llvm/Support/raw_ostream.h" // SMDiagnostic print
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <cstdio>
#include <cerrno>
#include <cstring>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include <fcntl.h>

using namespace llvm;

MCJITHelper::~MCJITHelper() {
    delete JIT;
    delete Builder;
    for (JITEventListener* L: Listeners) delete(L);
}

void MCJITHelper::addModule(std::unique_ptr<Module> M, bool OptimizeModule) {
    Module* M_ptr = M.get();
    //Modules.push_back(M_ptr);

    M_ptr->setDataLayout(JIT->getDataLayout());

    if (OptimizeModule) {
        legacy::FunctionPassManager *FPM = new legacy::FunctionPassManager(M_ptr);

        /* OPTIMIZER PIPELINE */

        // Register info about how the target lays out data structures
        //M_ptr->setDataLayout(JIT->getDataLayout()); // HOISTED
        FPM->add(new DataLayoutPass());

        // Provide basic AliasAnalysis support for GVN
        FPM->add(createBasicAliasAnalysisPass());
        // Promote allocas to registers
        FPM->add(createPromoteMemoryToRegisterPass());
        // Do simple peephole & bit-twiddling optimizations
        FPM->add(createInstructionCombiningPass());
        // Reassociate expressions
        FPM->add(createReassociatePass());
        // Eliminate Common SubExpressions
        FPM->add(createGVNPass());
        // Simplify the control flow graph (e.g. delete unreachable blocks)
        FPM->add(createCFGSimplificationPass());

        FPM->doInitialization();

        // apply to each function
        Module::iterator it;
        Module::iterator end = M->end();
        for (it = M->begin(); it != end; ++it) {
            FPM->run(*it);
        }

        delete FPM; // cannot be reused for different modules
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
    return JIT->FindFunctionNamed(Name.c_str());
    /** BROKEN
    Function* ret = nullptr;
    for (std::vector<Module*>::iterator M_it = Modules.begin(), M_end = Modules.end(); M_it != M_end; ++M_it) {
        Module* M = *M_it;
        for (Module::iterator F_it = M->begin(), F_end = M->end(); F_it != F_end; ++F_it) {
            Function& F = *F_it;
            if (Name == F.getName().str()) {
                ret = &F;
                break; // TODO what about prototypes?
            }
        }
    }

    return ret;
    **/
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
        std::cerr << "[ERROR] cannot resolve function " << FunctionName.c_str() << "\n";
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

void MCJITHelper::showTrackedAsm() {
    if (asmFdStream == nullptr) {
        std::cerr << "Invoking showTrackedAsm() while raw_fd_ostream has not been created yet! Exiting...\n";
        exit(EXIT_FAILURE);
    }

    std::string line;
    std::ifstream f(asmFileName);
    if (!f.is_open()) {
        fprintf(stderr, "Cannot open \"%s\" written by the raw_fd_ostream for ASM: %s. Exiting...\n", asmFileName, strerror(errno));
        exit(EXIT_FAILURE);
    }

    while(getline(f, line)) {
        std::cerr << line << "\n";
    }

    if (f.bad()) {
        fprintf(stderr, "Error while reading file \"%s\" written by the raw_fd_ostream for ASM: %s. Exiting...\n", asmFileName, strerror(errno));
        exit(EXIT_FAILURE);
    }
}

raw_ostream* MCJITHelper::initializeFdStream(const char* fileName) {
    int desc = open(fileName, O_WRONLY | O_CREAT | O_TRUNC, 0644);

    if (desc < 0) {
        fprintf(stderr, "Cannot open \"%s\" file for creating a raw_fd_ostream: %s. Exiting...\n", fileName, strerror(errno));
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
