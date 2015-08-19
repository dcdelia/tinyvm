/* ===============================================================
 * Main core of the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#ifndef TINYVM_OSRLIBRARY_H
#define TINYVM_OSRLIBRARY_H

#include "StateMap.hpp"

#include <map>

#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

using namespace llvm;

class OSRLibrary {
    public:
        typedef std::vector<Instruction*> OSRCond;
        typedef std::pair<Function*, Function*> OSRPair;

        typedef struct OpenOSRInfo {
            Function*       f1;
            BasicBlock*     b1;
            void*           extra;
        } OpenOSRInfo;

        // to simpify raw IR generation do the casts inside the destFunGenerator (written in C++)
        typedef struct RawOpenOSRInfo {
            void*   f1;
            void*   b1;
            void*   extra;
        } RawOpenOSRInfo;

        typedef void* (*DestFunGenerator)(RawOpenOSRInfo* rawInfo, void* profDataAddr);

        static OSRPair insertFinalizedOSR(
                                    Function& F1,
                                    BasicBlock& B1,
                                    Function& F2,
                                    BasicBlock& B2,
                                    OSRCond& cond,
                                    StateMap& M,
                                    bool updateF1 = false,
                                    const Twine& F1NewName="",
                                    const Twine& F2NewName="");

        static OSRPair insertOpenOSR(
                                OpenOSRInfo& info,
                                OSRCond& cond,
                                Value* profDataVal,
                                DestFunGenerator destFunGenerator,
                                bool updateF1 = false,
                                const Twine& F1NewName="",
                                std::vector<Value*> *valuesToTransfer = nullptr);

        static std::vector<Value*>* defaultValuesToTransferForOpenOSR(Function& F, BasicBlock &B);
        static Function* generateOSRDestFun(Function &F1, Function &F2, StateMap::BlockPair &srcDestBlocks,
                                std::vector<Value*> &valuesToPass, StateMap &M, const Twine& F2NewName);

        static Function* prepareForRedirection(Function& F);
        static void enableRedirection(uint64_t f, uint64_t destination);

    private:
        static void applyAttributesToArguments(Function* NF, Function* F, std::vector<Value*> &valuesToPass);
        static void duplicateBodyIntoNewFunction(Function* F, Function *NF, ValueToValueMapTy& VMap);
        static void fixOperandReferencesFromVMap(Function* NF, Function* F, ValueToValueMapTy &VMap);
        static void replaceUsesWithNewValuesAndUpdatePHINodes(Function* NF, BasicBlock* origDestBlock, std::vector<Value*> &origValuesToSetForDestBlock,
            ValueToValueMapTy &VMap, ValueToValueMapTy &updatesForVMap, SmallVectorImpl<PHINode*> *insertedPHINodes);
        static Function* duplicateFunction(Function* F, const Twine &Name, ValueToValueMapTy &VMap);
        static OSRCond regenerateOSRCond(OSRCond &cond, ValueToValueMapTy &VMap);
        static BasicBlock* generateTriggerOSRBlock(Function* OSRDest, std::vector<Value*> &valuesToPass);
        static BasicBlock* insertOSRCond(Function* F, BasicBlock* B, BasicBlock* OSR_B, OSRCond& cond, const Twine& BBName);
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