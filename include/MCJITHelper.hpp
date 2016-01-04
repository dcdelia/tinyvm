/* ===============================================================
 * Helper component for LLVM MCJIT compiler.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_MCJITHELPER_H
#define TINYVM_MCJITHELPER_H

#include "CustomMemoryManager.hpp"
#include "OSRLibrary.hpp"
#include "StackMap.hpp"

#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/JITEventListener.h>
#include <llvm/ExecutionEngine/MCJIT.h>
#include <llvm/ExecutionEngine/SectionMemoryManager.h>
#include <llvm/ExecutionEngine/JITEventListener.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/Object/ObjectFile.h>
#include <llvm/PassManager.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/ValueMapper.h>

#include <string>
#include <map>
#include <vector>

using namespace llvm;

class MCJITHelper {
public:
    MCJITHelper(LLVMContext &C, std::unique_ptr<Module> InitialModule) :
            Context(C), verbose(false), trackAsmCode(false),
            asmFdStream(nullptr), asmFileName("session.asm") {
        if (InitialModule == nullptr) {
            InitialModule = llvm::make_unique<Module>("empty", Context); // TODO we still need it right?
        }

        Modules.push_back(InitialModule.get());

        Listeners.push_back(new StackMapJITEventListener(&StackMaps));
        Listeners.push_back(new SymListener(&CompiledFunAddrTable, &verbose));

        std::unique_ptr<CustomMemoryManager> MemoryManager(new CustomMemoryManager(this));
        MManager = MemoryManager.get();
        std::string ErrStr;

        CodeGenOpt::Level optLevel = CodeGenOpt::Level::Default;

        JIT = EngineBuilder(std::move(InitialModule))
                            .setEngineKind(EngineKind::JIT)
                            .setOptLevel(optLevel)
                            .setErrorStr(&ErrStr)
                            .setMCJITMemoryManager(std::move(MemoryManager))
                            .create();

        for (JITEventListener* L: Listeners) {
            JIT->RegisterJITEventListener(L);
        }
        Builder = new IRBuilder<>(Context);
    }
    ~MCJITHelper();

    // public members
    ExecutionEngine *JIT;
    LLVMContext     &Context;
    bool            verbose;

    // public methods
    void addModule(std::unique_ptr<Module> M);
    std::unique_ptr<Module> createModuleFromFile(const std::string &FileName);
    void* getPointerToNamedFunction(const std::string &Name);
    Function* getFunction(const std::string &Name);
    FunctionPassManager createFPM(Module* M, bool CFGSimplificationOnly = false);
    int (*createAnonFunctionForCall(const std::string &FunctionName, std::vector<int> &Arguments))();
    bool toggleTrackAsm();
    void showTrackedAsm();
    void showModules();
    void showFunctions();
    bool loadDynamicLibrary(const std::string &FileName);
    void registerFunction(Function* F);
    void trackAsmCodeUtil(Module* M);
    std::vector<uint64_t> getCompiledFuncAddr(const std::string &Name);
    AllocaInst* insertOSRCounter(Function* F);
    void generateCounterTriggeredCond(OSRLibrary::OSRCond *cond, AllocaInst* alloca, int count);
    CmpInst* generateAlwaysTrueCond();
    CmpInst* generateAlwaysFalseCond();
    bool canModifyModule(Module* M);
    std::vector<Module*>& getLoadedModules() { return Modules; };

    static std::string& LLVMTypeToString(Type* type);
    static std::string prototypeToString(Function& F);

    /* Code generation for open OSR transitions */
    typedef struct OpenCodeGeneratorInfo {
        MCJITHelper*    TheHelper;
        Value*          profDataVal;
        Function*       clonedFun;
        Instruction*    clonedOSRSrc;
        Value*          clonedProfDataVal;
        std::vector<Value*>* liveValsVecInClone;
    } OpenCodeGeneratorInfo;

    static std::pair<Function*, Value*> genContFunForOpenOSRGenerator(
            Function* F1, OpenCodeGeneratorInfo* extraInfo);
    static void* identityGeneratorForOpenOSR(Function* F1, Instruction* OSRSrc,
            void* extra, void* profDataAddr);
    static void* dynamicInlinerForOpenOSR(Function* F1, Instruction* OSRSrc,
            void* extra, void* profDataAddr);

    typedef std::pair<Function*, std::map<Value*, Value*>> OpenCodeGeneratorPair;
    static std::map<Function*, OpenCodeGeneratorPair> openCodeGeneratorPairMap;

private:
    typedef std::pair<uint64_t, std::string> AddrSymPair;
    IRBuilder<>                     *Builder;
    CustomMemoryManager             *MManager;
    std::vector<Module*>            Modules;
    std::vector<StackMap*>          StackMaps;
    std::vector<JITEventListener*>  Listeners;

    std::vector<AddrSymPair>        CompiledFunAddrTable;
    std::map<std::string, Function*>                ActiveFunctions;
    std::map<std::string, std::vector<Function*>>   PrevFunctions;
    std::map<std::string, std::vector<Function*>>   FunctionPrototypes;
    std::vector<std::pair<std::string, std::vector<std::string>>>  Symbols;

    bool            trackAsmCode;
    raw_ostream     *asmFdStream;
    const char      *asmFileName;

    raw_ostream*    initializeFdStream(const char* fileName);

    // to capture addresses for compiled symbols
    class SymListener : public llvm::JITEventListener {
    public:
        SymListener(std::vector<AddrSymPair>* Table, bool* verboseFlagPtr) :
        Table(Table), verboseFlagPtr(verboseFlagPtr) {}
        virtual void NotifyObjectEmitted(const object::ObjectFile &Obj,
                                const RuntimeDyld::LoadedObjectInfo &L);

    private:
        std::vector<AddrSymPair> *Table;
        bool *verboseFlagPtr;
    };

};

#endif

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