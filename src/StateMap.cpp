#include "StateMap.hpp"

#include "llvm/Transforms/Utils/Cloning.h"

std::pair<Function*, Function*> StateMap::getFunctions() {
    return std::pair<Function*, Function*>(F1, F2);
}

std::pair<LivenessAnalysis&, LivenessAnalysis&> StateMap::getLivenessResults() {
    return std::pair<LivenessAnalysis&, LivenessAnalysis&>(F1LivenessAnalysis, F2LivenessAnalysis);
}

std::pair<Function*, StateMap*> StateMap::generateIdentityMapping(Function *F) {
    ValueToValueMapTy VMap;
    Function* copy = CloneFunction(F, VMap, false);
    StateMap* M = new StateMap(F, copy, VMap);

    return std::pair<Function*, StateMap*>(copy, M);
}

std::vector<Value*>* StateMap::getValuesToSetForBlock(BasicBlock &B, LivenessAnalysis::LiveValues& liveInAtBlock) {
    std::vector<Value*> *valuesToPass = new std::vector<Value*>();

    // add LIVE_IN values
    for (const Value* cdest_v: liveInAtBlock) {
        Value* src_v = const_cast<Value*>(cdest_v);
        valuesToPass->push_back(src_v);
    }

    // add PHI nodes in the block
    BasicBlock::const_iterator firstNonPHIInstr = B.getFirstNonPHI();
    BasicBlock::const_iterator firstInstr = B.begin();
    for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
        Instruction* dest_inst = const_cast<Instruction*>(&*it);
        Value* dest_v = cast<Value>(dest_inst);
        if (std::find(valuesToPass->begin(), valuesToPass->end(), dest_v) == valuesToPass->end()) {
            valuesToPass->push_back(dest_v); // avoid duplicates!
        }
    }

    return valuesToPass;
}

std::vector<Value*>* StateMap::getValuesToSetForDestFunction(BlockPair &pair) {
    std::vector<Value*> *values = nullptr;


    return values;
}