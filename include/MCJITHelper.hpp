/* ===============================================================
 * Helper component for LLVM MCJIT compiler.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_MCJITHELPER_H
#define TINYVM_MCJITHELPER_H

#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/JITEventListener.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <string>
#include <map>
#include <vector>

#include "CustomMemoryManager.hpp"
#include "OSRLibrary.hpp"
#include "StackMap.hpp"

using namespace llvm;

class MCJITHelper {
public:
    typedef struct MCJITHelperOSRInfo {
        MCJITHelper*    TheHelper;
        Function*       f2;
        BasicBlock*     b2;
        StateMap*       m;
    } MCJITHelperOSRInfo;

    MCJITHelper(LLVMContext &C, std::unique_ptr<Module> InitialModule) : Context(C),
                    trackAsmCode(false), asmFdStream(nullptr), asmFileName("session.asm") {
        if (InitialModule == nullptr) {
            InitialModule = llvm::make_unique<Module>("empty", Context); // TODO we still need it right?
        }

        Modules.push_back(InitialModule.get());

        Listeners.push_back(new StackMapJITEventListener(&StackMaps));

        std::unique_ptr<CustomMemoryManager> MemoryManager(new CustomMemoryManager(this));
        MManager = MemoryManager.get();
        std::string ErrStr;
        JIT = EngineBuilder(std::move(InitialModule))
                            .setEngineKind(EngineKind::JIT)
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

    // public methods
    void addModule(std::unique_ptr<Module> M, bool OptimizeModule = false);
    void createAndAddModuleForFunction(Function* F, bool OptimizeFunction = false,
                    bool analyzeCallsToExternalFunctions = false, bool analyzeAccessesToGlobals = false);
    std::unique_ptr<Module> createModuleFromFile(const std::string &FileName);
    void* getPointerToNamedFunction(const std::string &Name);
    Function* getFunction(const std::string &Name);
    FunctionPassManager createFPM(Module* M, bool CFGSimplificationOnly = false);
    int (*createAnonymousFunctionForCall(const std::string &FunctionName, std::vector<int> &Arguments))();
    bool toggleTrackAsm();
    void showTrackedAsm();
    void showModules();
    void showFunctions();
    bool loadDynamicLibrary(const std::string &FileName);
    CmpInst* generateAlwaysTrueCond();
    CmpInst* generateAlwaysFalseCond();
    ValueToValueMapTy* generateIdentityMapping(Function* F);
    static void* identityGeneratorForOpenOSR(OSRLibrary::RawOpenOSRInfo *info, void* profDataAddr);
    void registerFunction(Function* F);
    void trackAsmCodeUtil(Module* M);

private:
    IRBuilder<>                     *Builder;
    CustomMemoryManager             *MManager;
    std::vector<Module*>            Modules;
    std::vector<StackMap*>          StackMaps;
    std::vector<JITEventListener*>  Listeners;
    std::map<std::string, Function*>                ActiveFunctions;
    std::map<std::string, std::vector<Function*>>   PrevFunctions;
    std::map<std::string, std::vector<Function*>>   FunctionPrototypes;
    std::vector<std::pair<std::string, std::vector<std::string>>>  Symbols;
    bool            trackAsmCode;
    raw_ostream     *asmFdStream;
    const char      *asmFileName;

    raw_ostream*    initializeFdStream(const char* fileName);
    void            prototypeToString(Function& F, std::string &sym_str, std::string &type_str, raw_string_ostream &type_rso);
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