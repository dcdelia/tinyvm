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

        typedef struct OpenOSRInfo { /* TODO: pass 5 scalars rather than 1 reference */
            Function*       f1;
            BasicBlock*     b1;
            Function**      f2_pp;
            BasicBlock**    b2_pp;
            StateMap**      m_pp;
        } OpenOSRInfo;

        // to simpify raw IR generation do the casts inside the destFunGenerator (written in C++)
        typedef struct RawOpenOSRInfo {
            void*   f1;
            void*   b1;
            void*   f2_pp;
            void*   b2_pp;
            void*   m_pp;
        } RawOpenOSRInfo;

        typedef void* (*DestFunGenerator)(RawOpenOSRInfo* rawInfo, void* profDataAddr);

        static OSRPair insertFinalizedOSR(Function& F1, BasicBlock& B1, Function& F2,
            BasicBlock& B2, OSRCond& cond, StateMap& M, const Twine& F1NewName="", const Twine& F2NewName="");
        static OSRPair insertOpenOSR(OpenOSRInfo& info, OSRCond& cond, Value* profDataVal,
            DestFunGenerator destFunGenerator, const Twine& F1NewName="", std::vector<Value*> *valuesToTransfer = nullptr);

        static std::vector<Value*>* defaultValuesToTransferForOpenOSR(Function& F, BasicBlock &B);
        static Function* generateOSRDestFun(Function &F1, Function &F2, StateMap::BBSrcDestPair &srcDestBlocks,
                                std::vector<Value*> &valuesToPass, StateMap &M, const Twine& F2NewName);

        static Function* prepareForRedirection(Function& F);
        static void enableRedirection(uint64_t f, uint64_t destination);

    private:

        static FunctionType* generatePrototypeForOSRDest(Function* src, std::vector<Value*> &valuesToPass);
        static void applyAttributesToArguments(Function* NF, Function* F, std::vector<Value*> &valuesToPass);
        static std::map<const Argument*, Value*> getMapForDeadArgs(Function *orig, std::vector<Value*> &valuesToPass);
        static void copyBodyIntoNewFunction(Function* F, Function *NF, ValueToValueMapTy& VMap);
        static void updateOpMappingForClonedBody(Function* NF, Function* F, ValueToValueMapTy &VMap);
        static void updateDestToOSRDestVMapForArguments(Function* dest, ValueToValueMapTy &destToOSRDestVMap,
            std::map<const Argument*, Value*> &deadArgsMap, ValueToValueMapTy &updatesForDestToOSRDestVMap);
        static void replaceUsesWithNewValuesAndUpdatePHINodes(Function* NF, BasicBlock* origDestBlock, std::vector<Value*> &origValuesToSetForDestBlock,
            ValueToValueMapTy &VMap, ValueToValueMapTy &updatesForVMap, SmallVectorImpl<PHINode*> *insertedPHINodes);
        static Function* duplicateFunction(Function* F, const Twine &Name, ValueToValueMapTy &VMap);
        static OSRCond regenerateOSRCond(OSRCond &cond, ValueToValueMapTy &VMap);
        static BasicBlock* generateTriggerOSRBlock(Function* OSRDest, std::vector<Value*> &valuesToPass);
        static BasicBlock* insertOSRCond(Function* F, BasicBlock* B, BasicBlock* OSR_B, OSRCond& cond, const Twine& BBName);

        //static void addValuesToFetchForOpenOSR(OpenOSRInfo& info, std::vector<Value*> &values);
};

#endif
