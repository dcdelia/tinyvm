#include "Liveness.hpp"
#include "StateMap.hpp"

#include <map>
#include <vector>

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

using namespace llvm;

LivenessAnalysis& StateMap::getLivenessResultsForSrcFunction() {
    return srcLiveValueAnalysis;
}

LivenessAnalysis& StateMap::getLivenessResultsForDestFunction() {
    return destLiveValueAnalysis;
}

// Implements a direct state mapping starting from the results of liveness analysis
std::vector<Value*> StateMap::getValuesToFetchFromSrcFunction(StateMap::BBSrcDestPair &srcDestBlocks) {
    LivenessAnalysis::LiveValues& liveInAtSrcBlock = srcLiveValueAnalysis.getLiveInValues(srcDestBlocks.first);
    LivenessAnalysis::LiveValues& liveInAtDestBlock = destLiveValueAnalysis.getLiveInValues(srcDestBlocks.second);

    std::vector<Value*> args;

    /* In the base implementation of a direct state mapping, I am assuming
     * there is a 1:1 correspondence between liveInAtDestBlock and
     * liveInAtSrcBlock, otherwise the assertion check will fail. */

    for (const Value* cdest_v: liveInAtDestBlock) {
        Value* dest_v = const_cast<Value*>(cdest_v);
        StateMap::ValueToValuesMap::const_iterator it = reverseVVsMap->find(dest_v);
        assert(it != reverseVVsMap->end() && it->second.size() == 1);
        args.push_back(it->second[0]);
    }

    return args;
}

/* This overrideDestToOSRDestVMap guides OSRLibrary to replace uses of values in OSRDestFun
 * - the key is the original Value* in dest
 * - the value is the corresponding Value* definition in OSRDestFun
 * */
BasicBlock* StateMap::createEntryPointForOSRDestFunction(StateMap::BBSrcDestPair &srcDestBlocks, Function *OSRDestFun, ValueToValueMapTy &destToOSRDestVMap, ValueToValueMapTy &updatesForDestToOSRDestVMap, std::vector<Value*> &fetchedValuesAsArgs) {
    std::map<const Value*, Value*> srcValueToOSRDestValueMap;

    BasicBlock* destBB = srcDestBlocks.second;
    LivenessAnalysis::LiveValues& liveInAtDestBlock = destLiveValueAnalysis.getLiveInValues(destBB);
    BasicBlock* OSRdestBB = cast<BasicBlock>(destToOSRDestVMap[destBB]);

    BasicBlock* entryPoint = BasicBlock::Create(getGlobalContext(), "OSR_entry");

    /* In the implementation of a direct state mapping, I don't have to
     * generate any compensation code, neither global nor local (i.e.,
     * to generate values missing from the incoming state or fix ones
     * available as OSRDestFun's parameters). */
    assert(OSRDestFun->arg_size() == fetchedValuesAsArgs.size());

    //Function::const_arg_iterator argIt = OSRDestFun->arg_begin();
    //Function::const_arg_iterator endArgIt = OSRDestFun->arg_end();
    LivenessAnalysis::LiveValues::const_iterator destIt = liveInAtDestBlock.begin();
    LivenessAnalysis::LiveValues::const_iterator endDestIt = liveInAtDestBlock.end();

    int index = 0;
    for (const Argument &arg_ref: OSRDestFun->args()) {
        /* I'm assuming that arguments in the prototype of OSRDestFun
         * appear in the same order as in fetchedValuesAsArgs. In fact
         * I don't access the latter here, as it is generated from
         * liveInAtDestBlock in getValuesToFetchFromSrcFunction(). */
        assert(destIt != endDestIt);
        const Value* dest_v = *destIt;
        Argument* arg = &(const_cast<Argument&>(arg_ref));
        Value* OSRDest_v = cast<Value>(arg);
        updatesForDestToOSRDestVMap[dest_v] = OSRDest_v;
        ++destIt;
    }
    assert(destIt == endDestIt);

    // In a direct state mapping I generate the branch instruction only
    BranchInst* brToDest = BranchInst::Create(OSRdestBB);
    entryPoint->getInstList().push_back(brToDest);

    return entryPoint;
}

StateMap::ValueToValuesMap* StateMap::convertValueToValueMapTy(ValueToValueMapTy &Map) {
    StateMap::ValueToValuesMap* newMap = new StateMap::ValueToValuesMap();

    for (ValueToValueMapTy::const_iterator it = Map.begin(); it != Map.end(); ++it) {
        Value* v = const_cast<Value*>(it->first); // get rid of const :-)
        std::vector<Value*> vec = {it->second};
        newMap->insert(std::pair<Value*, std::vector<Value*>>(v, vec));
    }

    return newMap;
}

StateMap::ValueToValuesMap* StateMap::flipValueToValuesMap(StateMap::ValueToValuesMap *Map) {
    StateMap::ValueToValuesMap* revMap = new StateMap::ValueToValuesMap();

    for (StateMap::ValueToValuesMap::const_iterator it = Map->begin(); it != Map->end(); ++it) {
        Value* v_first = it->first;
        for (Value* v_second: it->second) {
            StateMap::ValueToValuesMap::iterator revIt = revMap->find(v_second);
            if (revIt == revMap->end()) {
                // I have to create a vector
                std::vector<Value*> vec;
                vec.push_back(v_first);
                revMap->insert(std::pair<Value*, std::vector<Value*>>(v_second, vec));
            } else {
                // avoid inserting duplicates
                if (std::find(revIt->second.begin(), revIt->second.end(), v_first) == revIt->second.end()) {
                    revIt->second.push_back(v_first);
                }
            }
        }
    }

    return revMap;
}
