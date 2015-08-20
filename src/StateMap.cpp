/* ===============================================================
 * State mapping component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "StateMap.hpp"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Transforms/Utils/Cloning.h"

using namespace llvm;

std::pair<Function*, Function*> StateMap::getFunctions() {
    return std::pair<Function*, Function*>(F1, F2);
}

std::pair<LivenessAnalysis&, LivenessAnalysis&> StateMap::getLivenessResults() {
    return std::pair<LivenessAnalysis&, LivenessAnalysis&>(F1LivenessAnalysis, F2LivenessAnalysis);
}

std::pair<Function*, StateMap*> StateMap::generateIdentityMapping(Function *F) {
    ValueToValueMapTy VMap;
    Function* copy = CloneFunction(F, VMap, false);
    StateMap* M = new StateMap(F, copy, VMap, false); // reverseMap = false

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

std::vector<Value*>& StateMap::getValuesToSetForDestFunction(StateMap::BlockPair &pair) {
    BasicBlock* destBB = pair.second;

    std::map<BasicBlock*, std::vector<Value*>>::iterator it = cacheForValuesToSetForBlocks.find(destBB);
    if (it == cacheForValuesToSetForBlocks.end()) {
        std::vector<Value*> *v;
        if (destBB->getParent() == F1) {
            v = getValuesToSetForBlock(*destBB, F1LivenessAnalysis.getLiveInValues(destBB));
        } else {
            v = getValuesToSetForBlock(*destBB, F2LivenessAnalysis.getLiveInValues(destBB));
        }
        cacheForValuesToSetForBlocks.insert(std::pair<BasicBlock*, std::vector<Value*>>(destBB, std::move(*v)));
        return cacheForValuesToSetForBlocks[destBB]; // TODO can I do this better?
    } else {
        return it->second;
    }
}

std::vector<Value*> StateMap::getValuesToFetchFromSrcFunction(StateMap::BlockPair &pair) {
    std::vector<Value*> valuesToFetch;

    BlockPairInfo* bpInfo = nullptr;
    BlockPairStateMap::iterator BPSMIt = blockPairStateMap.find(pair);
    if (BPSMIt != blockPairStateMap.end()) {
        bpInfo = &(BPSMIt->second);

        // fetch arguments for global compensation code (if any)
        if (bpInfo->globalCompCode != nullptr) {
            for (CompCodeArgs::iterator it = bpInfo->globalCompCode->args->begin(),
                    end = bpInfo->globalCompCode->args->end(); it != end; ++it) {
                valuesToFetch.push_back(*it);
            }
        }
    }

    std::vector<Value*>& valuesToSetAtDest = getValuesToSetForDestFunction(pair);
    for (Value* valueToSet: valuesToSetAtDest) {
        // check for defaultOneToOneMap first
        OneToOneValueMap::iterator oneToOneIt = defaultOneToOneMap->find(valueToSet);
        if (oneToOneIt != defaultOneToOneMap->end()) {
            valuesToFetch.push_back(oneToOneIt->second);
            continue;
        } else if (bpInfo != nullptr) {
            // check for oneToOneValue or compensation code specific for this pair
            ValueInfoMap::iterator VIMIt = bpInfo->valueInfoMap.find(valueToSet);
            if (VIMIt != bpInfo->valueInfoMap.end()) {
                ValueInfo* VI = VIMIt->second;
                if (VI->isOneToOneValue()) {
                    valuesToFetch.push_back(VI->oneToOneValue);
                } else {
                    for (CompCodeArgs::iterator it = VI->compCode->args->begin(),
                        end = VI->compCode->args->end(); it != end; ++it) {
                        valuesToFetch.push_back(*it);
                    }
                }
                continue;
            }
        }

        char errorMsg[256];
        sprintf(errorMsg, "Could not find mapping information for Value %s", valueToSet->getName().str().c_str());
        llvm::report_fatal_error(std::string(errorMsg));
    }

    /* The number of duplicates is very likely to be small! So I won't construct a std::set
     * http://stackoverflow.com/questions/1041620/whats-the-most-efficient-way-to-erase-duplicates-and-sort-a-vector
     */
    std::sort(valuesToFetch.begin(), valuesToFetch.end());
    valuesToFetch.erase(std::unique(valuesToFetch.begin(), valuesToFetch.end()), valuesToFetch.end());

    return valuesToFetch;
}

std::pair<BasicBlock*, ValueToValueMapTy*> StateMap::createEntryPointForNewDestFunction(StateMap::BlockPair &pair, BasicBlock* newDestBB,
        std::vector<Value*>& valuesToSetAtDest, ValueToValueMapTy& fetchedValuesToNewDestArgs, LLVMContext &Context) {

    ValueToValueMapTy* updatedValuesToUse = new ValueToValueMapTy();
    BasicBlock* entryPoint = BasicBlock::Create(Context, "OSR_entry");

    BlockPairInfo* bpInfo = nullptr;
    BlockPairStateMap::iterator BPSMIt = blockPairStateMap.find(pair);
    if (BPSMIt != blockPairStateMap.end()) {
        bpInfo = &(BPSMIt->second);

        if (bpInfo->globalCompCode != nullptr) {
            llvm::report_fatal_error("Sorry, global compensation code hasn't been implemented yet!"); // TODO
        }
    }

    // process values to set
    BasicBlock* lastCreatedBB = entryPoint;
    for (Value* dest_v: valuesToSetAtDest) {
        OneToOneValueMap::iterator oneToOneIt = defaultOneToOneMap->find(dest_v);
        if (oneToOneIt != defaultOneToOneMap->end()) {
            Value* src_v = oneToOneIt->second;
            (*updatedValuesToUse)[dest_v] = fetchedValuesToNewDestArgs[src_v];
            continue;
        } else if (bpInfo != nullptr) {
            // check for oneToOneValue or compensation code specific for this pair
            ValueInfoMap::iterator VIMIt = bpInfo->valueInfoMap.find(dest_v);
            if (VIMIt != bpInfo->valueInfoMap.end()) {
                ValueInfo* VI = VIMIt->second;
                if (VI->isOneToOneValue()) {
                    Value* src_v = VI->oneToOneValue;
                    (*updatedValuesToUse)[dest_v] = fetchedValuesToNewDestArgs[src_v];
                    continue;
                } else {
                    llvm::report_fatal_error("Sorry, local compensation code hasn't been implemented yet!"); // TODO
                }
                continue;
            }
        }

        char errorMsg[256];
        sprintf(errorMsg, "Could not find mapping information for Value %s", dest_v->getName().str().c_str());
        llvm::report_fatal_error(std::string(errorMsg));
    }

    // add branch instruction
    BranchInst* brToDest = BranchInst::Create(newDestBB);
    lastCreatedBB->getInstList().push_back(brToDest);

    return std::pair<BasicBlock*, ValueToValueMapTy*>(lastCreatedBB, updatedValuesToUse);
}

Value* StateMap::getCorrespondingOneToOneValue(Value *v) {
    OneToOneValueMap::iterator oneToOneIt = defaultOneToOneMap->find(v);
    if (oneToOneIt != defaultOneToOneMap->end()) {
        return oneToOneIt->second;
    } else {
        return nullptr;
    }
}

BasicBlock* StateMap::getCorrespondingBlock(BasicBlock *B) {
    BlockMap::iterator blockIt = correspondingBlockMap.find(B);
    if (blockIt != correspondingBlockMap.end()) {
        return blockIt->second;
    } else {
        return nullptr;
    }
}

StateMap::ValueInfo* StateMap::getValueInfo(Value* v, StateMap::BlockPair &pair) {
    BlockPairStateMap::iterator BPSMIt = blockPairStateMap.find(pair);
    if (BPSMIt != blockPairStateMap.end()) {
        BlockPairInfo& bpInfo = BPSMIt->second;
        ValueInfoMap::iterator VIMIt = bpInfo.valueInfoMap.find(v);
        if (VIMIt != bpInfo.valueInfoMap.end()) {
            return VIMIt->second;
        }
    }
    return nullptr;
}

void StateMap::registerOneToOneValue(Value* src_v, Value* dest_v, bool bidirectional) {
    defaultOneToOneMap->insert(std::pair<Value*, Value*>(dest_v, src_v));
    if (bidirectional) {
        defaultOneToOneMap->insert(std::pair<Value*, Value*>(src_v, dest_v));
    }
}

void StateMap::registerCorrespondingBlock(BasicBlock* src_b, BasicBlock* dest_b, bool bidirectional) {
    correspondingBlockMap.insert(std::pair<BasicBlock*, BasicBlock*>(src_b, dest_b));
    if (bidirectional) {
        correspondingBlockMap.insert(std::pair<BasicBlock*, BasicBlock*>(dest_b, src_b));
    }
}

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