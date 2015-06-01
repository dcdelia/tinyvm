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
        typedef void (*DestFunGenerator)(Function* dest, BasicBlock* dest_b, StateMap* m);
        typedef std::pair<Function*, Function*> OSRPair;

        static OSRPair insertFinalizedOSR(Function& F1, BasicBlock& B1, Function& F2,
            BasicBlock& B2, OSRCond& cond, StateMap& M, const Twine& F1NewName="", const Twine& F2NewName="");
        static Function* insertOpenOSR(Function& F, BasicBlock& B, OSRCond& cond,
            DestFunGenerator callback);

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
};

#endif
