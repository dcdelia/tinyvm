/* ===============================================================
 * Main core of the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#ifndef TINYVM_OSRLIBRARY_H
#define TINYVM_OSRLIBRARY_H

#include "Liveness.hpp"
#include "StateMap.hpp"

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Transforms/Utils/ValueMapper.h>

#include <map>

class OSRLibrary {
    public:
        typedef std::vector<llvm::Instruction*> OSRCond;
        typedef std::pair<llvm::Function*, llvm::Function*> OSRPair;

        typedef struct OSRPointConfig {
            bool verbose;
            bool updateF1;
            int branchTakenProb;

            const std::string* nameForNewF1;
            llvm::Module* modForNewF1;
            StateMap** ptrForF1NewToF1Map;

            // resolved OSR only
            const std::string* nameForNewF2;
            llvm::Module* modForNewF2;
            StateMap** ptrForF2NewToF2Map;

            OSRPointConfig(bool verbose = false, bool updateF1 = true,
                    int branchTakenProb = -1,
                    const std::string* nameForNewF1 = nullptr,
                    llvm::Module* modForNewF1 = nullptr,
                    StateMap** ptrForF1NewToF1Map = nullptr,
                    const std::string* nameForNewF2 = nullptr,
                    llvm::Module* modForNewF2 = nullptr,
                    StateMap** ptrForF2NewToF2Map = nullptr) :
                    verbose(verbose), updateF1(updateF1),
                    branchTakenProb(branchTakenProb),
                    nameForNewF1(nameForNewF1), modForNewF1(modForNewF1),
                    ptrForF1NewToF1Map(ptrForF1NewToF1Map),
                    nameForNewF2(nameForNewF2), modForNewF2(modForNewF2),
                    ptrForF2NewToF2Map(ptrForF2NewToF2Map) {
                if (branchTakenProb != -1 && (branchTakenProb > 100 || branchTakenProb < 0)) {
                    llvm::report_fatal_error("OSR probability should be either -1 or an integer number between 0 and 100");
                }
            };
        } OSRPointConfig;


        typedef void* (*DestFunGenerator)(
                                    llvm::Function* F1,
                                    llvm::Instruction* OSRSrc,
                                    void* extra,
                                    void* profDataAddr);

        static OSRPair insertResolvedOSR(
                                    llvm::LLVMContext &Context,
                                    llvm::Function& F1,
                                    llvm::Instruction& OSRSrc,
                                    llvm::Function& F2,
                                    llvm::Instruction& LPad,
                                    OSRCond& cond,
                                    StateMap& M,
                                    OSRPointConfig &config);

        static OSRPair insertOpenOSR(
                                llvm::LLVMContext &Context,
                                llvm::Function &F,
                                llvm::Instruction &OSRSrc,
                                void* extraInfo,
                                OSRCond& cond,
                                llvm::Value* profDataVal,
                                DestFunGenerator destFunGenerator,
                                std::vector<llvm::Value*> *valuesToTransfer,
                                LivenessAnalysis *LA,
                                OSRPointConfig &config);

        static llvm::Function* genContinuationFunc(
                                    llvm::LLVMContext &Context,
                                    llvm::Function &F1,
                                    llvm::Function &F2,
                                    llvm::Instruction &OSRSrc,
                                    llvm::Instruction &LPad,
                                    std::vector<llvm::Value*> &valuesToPass,
                                    StateMap &M,
                                    const std::string* F2NewName,
                                    bool verbose = false,
                                    StateMap** ptrForF2NewToF2Map = nullptr);

        static std::vector<llvm::Value*>* getLiveValsVecAtInstr(
                                            const llvm::Instruction* I,
                                            LivenessAnalysis &LA);

        static bool fixUsesOfFunctionsAndGlobals(llvm::Function* origFun,
                                                 llvm::Function* newFun);

    private:
        static void applyAttributesToArguments(llvm::Function* NF, llvm::Function* F,
            std::vector<llvm::Value*> &valuesToPass, bool skipFirst = false);
        static void duplicateBodyIntoNewFunction(llvm::Function* F, llvm::Function *NF, llvm::ValueToValueMapTy& VMap);
        static void fixOperandReferencesFromVMap(llvm::Function* NF, llvm::Function* F, llvm::ValueToValueMapTy &VMap);
        static void replaceUsesAndFixSSA(llvm::Function* OSRCont, llvm::Instruction* OSRContLPad,
            std::vector<llvm::Value*> &valuesToSetAtOrigLPad, llvm::ValueToValueMapTy &VMap,
            llvm::ValueToValueMapTy &updatesForVMap, llvm::SmallVectorImpl<llvm::PHINode*> *insertedPHINodes,
            bool verbose, StateMap** ptrForF2NewToF2Map);
        static llvm::Function* duplicateFunction(llvm::Function* F, const llvm::Twine &Name, llvm::ValueToValueMapTy &VMap);
        static OSRCond regenerateOSRCond(OSRCond &cond, llvm::ValueToValueMapTy &VMap);
        static llvm::BasicBlock* generateTriggerOSRBlock(llvm::LLVMContext &Context, llvm::Function* OSRDest,
                std::vector<llvm::Value*> &valuesToPass);
        static llvm::BasicBlock* insertOSRCond(llvm::LLVMContext &Context, llvm::Function* F, llvm::Instruction* OSRSrc,
            llvm::BasicBlock* FireOSRBlock, OSRCond& cond, const llvm::Twine& BBName, int branchTakenProb);
        static void printLiveVarInfoForDebug(LivenessAnalysis::LiveValues &liveIn,
            LivenessAnalysis::LiveValues &liveOut, std::vector<llvm::Value*> &valuesToFetch);
        static LivenessAnalysis::LiveValues getLiveValsAtInstr(const llvm::Instruction* I, LivenessAnalysis &LA);
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