#include "Liveness.hpp"
#include "OldStateMap.hpp"

#include <algorithm>
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

LivenessAnalysis& OldStateMap::getLivenessResultsForSrcFunction() {
    return srcLiveValueAnalysis;
}

LivenessAnalysis& OldStateMap::getLivenessResultsForDestFunction() {
    return destLiveValueAnalysis;
}

/* Implements a direct state mapping starting from the results of liveness analysis.
 * Note that also PHI node values at the beginning of the block should be fetched! */
std::vector<Value*> &OldStateMap::getValuesToFetchFromSrcFunction(OldStateMap::BBSrcDestPair &srcDestBlocks) {
    BasicBlock* srcBB = srcDestBlocks.first;
    BasicBlock* destBB = srcDestBlocks.second;

    OldStateMap::ValuesForBlockMap::iterator it = valuesToFetchFromSrc.find(srcBB);
    if (it == valuesToFetchFromSrc.end()) {
        std::vector<Value*> values;

        LivenessAnalysis::LiveValues& liveInAtDestBlock = destLiveValueAnalysis.getLiveInValues(destBB);

        /* In the base implementation of a direct state mapping, I am assuming
        * there is a 1:1 correspondence between liveInAtDestBlock and
        * liveInAtSrcBlock, otherwise the assertion check will fail. */
        for (const Value* cdest_v: liveInAtDestBlock) {
            Value* dest_v = const_cast<Value*>(cdest_v);
            OldStateMap::ValueToValuesMap::const_iterator valIt = reverseVVsMap->find(dest_v);
            assert(valIt != reverseVVsMap->end() && valIt->second.size() == 1);
            values.push_back(valIt->second[0]);
        }

        /* The same 1:1 correspondence has to exist for PHI nodes in the block */
        BasicBlock::const_iterator firstNonPHIInstr = destBB->getFirstNonPHI();
        BasicBlock::const_iterator firstInstr = destBB->begin();
        for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
            Instruction* dest_inst = const_cast<Instruction*>(&*it);
            Value* dest_v = cast<Value>(dest_inst);
            OldStateMap::ValueToValuesMap::const_iterator valIt = reverseVVsMap->find(dest_v);
            assert(valIt != reverseVVsMap->end() && valIt->second.size() == 1);
            if (std::find(values.begin(), values.end(), valIt->second[0]) == values.end()) {
                values.push_back(valIt->second[0]); // avoid duplicates!
            }
        }

        valuesToFetchFromSrc[srcBB] = values;
    }

    return valuesToFetchFromSrc[srcBB];
}

/* Implements a direct state mapping starting from the results of liveness analysis.
 * Note that also PHI node values at the beginning of the block should be fetched! */
std::vector<Value*> &OldStateMap::getValuesToSetForDestFunction(OldStateMap::BBSrcDestPair &srcDestBlocks) {
    BasicBlock* destBB = srcDestBlocks.second;

    // check if this is already been computed
    OldStateMap::ValuesForBlockMap::iterator it = valuesToFetchAtDest.find(destBB);
    if (it == valuesToFetchAtDest.end()) {
        std::vector<Value*> values;

        // add LIVE_IN values
        LivenessAnalysis::LiveValues& liveInAtDestBlock = destLiveValueAnalysis.getLiveInValues(destBB);
        for (const Value* cdest_v: liveInAtDestBlock) {
            values.push_back(const_cast<Value*>(cdest_v));
        }

        // add PHI nodes in the block
        BasicBlock::const_iterator firstNonPHIInstr = destBB->getFirstNonPHI();
        BasicBlock::const_iterator firstInstr = destBB->begin();
        for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
            Instruction* dest_inst = const_cast<Instruction*>(&*it);
            Value* dest_v = cast<Value>(dest_inst);
            if (std::find(values.begin(), values.end(), dest_v) == values.end()) {
                values.push_back(dest_v); // avoid duplicates!
            }
        }

        //valuesToFetchAtDest[destBB] = values;
        valuesToFetchAtDest.insert(std::make_pair(destBB, values));
    }

    return valuesToFetchAtDest[destBB];
}

/* The updatesForDestToOSRDestVMap map guides OSRLibrary to replace uses of values in OSRDestFun:
 * - the key is the original Value* in dest
 * - the value is the corresponding Value* in OSRDestFun (which might also be created here!)
 * */
BasicBlock* OldStateMap::createEntryPointForOSRDestFunction(OldStateMap::BBSrcDestPair &srcDestBlocks, Function *OSRDestFun, ValueToValueMapTy &destToOSRDestVMap, ValueToValueMapTy &updatesForDestToOSRDestVMap, std::vector<Value*> &fetchedValuesAsArgs) {
    std::map<const Value*, Value*> srcValueToOSRDestValueMap;

    BasicBlock* destBB = srcDestBlocks.second;
    BasicBlock* OSRdestBB = cast<BasicBlock>(destToOSRDestVMap[destBB]);

    std::vector<Value*> &valuesToSetForDestFunction = getValuesToSetForDestFunction(srcDestBlocks);
    //LivenessAnalysis::LiveValues& liveInAtDestBlock = destLiveValueAnalysis.getLiveInValues(destBB);

    BasicBlock* entryPoint = BasicBlock::Create(getGlobalContext(), "OSR_entry");

    /* In the implementation of a direct state mapping, I don't have to
     * generate any compensation code, neither global nor local (i.e.,
     * to generate values missing from the incoming state or fix ones
     * available as OSRDestFun's parameters). */
    assert(OSRDestFun->arg_size() == fetchedValuesAsArgs.size());

    std::vector<Value*>::const_iterator destIt = valuesToSetForDestFunction.begin();
    std::vector<Value*>::const_iterator endDestIt = valuesToSetForDestFunction.end();

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

OldStateMap::ValueToValuesMap* OldStateMap::convertValueToValueMapTy(ValueToValueMapTy &Map) {
    OldStateMap::ValueToValuesMap* newMap = new OldStateMap::ValueToValuesMap();

    for (ValueToValueMapTy::const_iterator it = Map.begin(); it != Map.end(); ++it) {
        Value* v = const_cast<Value*>(it->first); // get rid of const :-)
        std::vector<Value*> vec = {it->second};
        newMap->insert(std::pair<Value*, std::vector<Value*>>(v, vec));
    }

    return newMap;
}

OldStateMap::ValueToValuesMap* OldStateMap::flipValueToValuesMap(OldStateMap::ValueToValuesMap *Map) {
    OldStateMap::ValueToValuesMap* revMap = new OldStateMap::ValueToValuesMap();

    for (OldStateMap::ValueToValuesMap::const_iterator it = Map->begin(); it != Map->end(); ++it) {
        Value* v_first = it->first;
        for (Value* v_second: it->second) {
            OldStateMap::ValueToValuesMap::iterator revIt = revMap->find(v_second);
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
