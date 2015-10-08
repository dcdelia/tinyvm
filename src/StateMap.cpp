/* ===============================================================
 * State mapping component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "OSRLibrary.hpp"
#include "StateMap.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/ValueMap.h>
#include <llvm/Support/ErrorHandling.h>
#include <llvm/Transforms/Utils/Cloning.h>

#undef NDEBUG
#include <cassert>

using namespace llvm;

std::pair<Function*, Function*> StateMap::getFunctions() {
    return std::pair<Function*, Function*>(F1, F2);
}

std::pair<LivenessAnalysis&, LivenessAnalysis&> StateMap::getLivenessResults() {
    return std::pair<LivenessAnalysis&, LivenessAnalysis&>(F1_LA, F2_LA);
}

std::pair<Function*, StateMap*> StateMap::generateIdentityMapping(Function *F) {
    ValueToValueMapTy VMap;
    Function* copy = CloneFunction(F, VMap, false);
    StateMap* M = new StateMap(F, copy, &VMap, true); // bidirectional = true

    return std::pair<Function*, StateMap*>(copy, M);
}

std::vector<Value*>& StateMap::getValuesToSetAtLPad(Instruction* LPad) {
    ValuesToSetCache::iterator it = valuesToSetAtLPadCache.find(LPad);
    if (it != valuesToSetAtLPadCache.end()) return it->second;

    std::vector<Value*>* vec;
    if (LPad->getParent()->getParent() == F1) {
        vec = OSRLibrary::getLiveValsVecAtInstr(LPad, F1_LA);
    } else {
        vec = OSRLibrary::getLiveValsVecAtInstr(LPad, F2_LA);
    }

    std::pair<ValuesToSetCache::iterator, bool> ret = valuesToSetAtLPadCache.
        insert(std::pair<Instruction*, std::vector<Value*>>(LPad, std::move(*vec)));

    return ret.first->second;
}

std::vector<Value*> StateMap::getValuesToFetchAtOSRSrc(Instruction* OSRSrc, Instruction* LPad) {
    std::vector<Value*> valuesToFetch;

    LocPairInfo* lpInfo = nullptr;
    LocPairInfoMap::iterator LPIMIt = locPairInfoMap.find(LocPair(OSRSrc, LPad));
    if (LPIMIt != locPairInfoMap.end()) {
        lpInfo = &(LPIMIt->second);

        // fetch arguments for global compensation code (if any)
        if (lpInfo->globalCompCode != nullptr) {
            for (CompCodeArgs::iterator it = lpInfo->globalCompCode->args->begin(),
                    end = lpInfo->globalCompCode->args->end(); it != end; ++it) {
                valuesToFetch.push_back(*it);
            }
        }
    }

    std::vector<Value*>& valuesToSetAtDest = getValuesToSetAtLPad(LPad);
    for (Value* valueToSet: valuesToSetAtDest) {
        // check for LocPair-specific info
        if (lpInfo != nullptr) {
            // check for oneToOneValue or compensation code specific for this pair
            ValueInfoMap::iterator VIMIt = lpInfo->valueInfoMap.find(valueToSet);
            if (VIMIt != lpInfo->valueInfoMap.end()) {
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

        // fall back to defaultOneToOneMap
        OneToOneValueMap::iterator oneToOneIt = defaultOneToOneMap.find(valueToSet);
        if (oneToOneIt != defaultOneToOneMap.end()) {
            valuesToFetch.push_back(oneToOneIt->second);
            continue;
        }

        valueToSet->dump();
        llvm::report_fatal_error("[getValuesToFetchFromSrcFunction] could not "
                "find mapping information for the Value above");
    }

    // we expect a few duplicates at most, so a vector is fine
    std::sort(valuesToFetch.begin(), valuesToFetch.end());
    valuesToFetch.erase(std::unique(valuesToFetch.begin(), valuesToFetch.end()), valuesToFetch.end());

    return valuesToFetch;

}

std::pair<BasicBlock*, ValueToValueMapTy*> StateMap::genContinuationFunctionEntryPoint(
        LLVMContext &Context, Instruction* OSRSrc, Instruction* LPad,
        Instruction* OSRContLPad, std::vector<Value*>& valuesToSetAtOSRCont,
        ValueToValueMapTy& fetchedValuesToOSRContArgs) {

    ValueToValueMapTy* updatedValuesToUse = new ValueToValueMapTy();
    BasicBlock* entryPoint = BasicBlock::Create(Context, "OSR_entry");
    LocPair pair(OSRSrc, LPad);

    LocPairInfo* lpInfo = nullptr;
    LocPairInfoMap::iterator LPIMIt = locPairInfoMap.find(pair);
    if (LPIMIt != locPairInfoMap.end()) {
        lpInfo = &(LPIMIt->second);
    }

    BasicBlock* lastCreatedBB = entryPoint;

    // process global compensation code
    if (lpInfo != nullptr && lpInfo->globalCompCode != nullptr) {
        assert(lpInfo->globalCompCode->value == nullptr &&
                "value should be null for global compensation code");
        lastCreatedBB = addGlobalCompensationCode(lastCreatedBB,
                lpInfo->globalCompCode, fetchedValuesToOSRContArgs);
    }

    // process values to set
    for (Value* dest_v: valuesToSetAtOSRCont) {
        OneToOneValueMap::iterator oneToOneIt = defaultOneToOneMap.find(dest_v);
        if (oneToOneIt != defaultOneToOneMap.end()) {
            Value* src_v = oneToOneIt->second;
            (*updatedValuesToUse)[dest_v] = fetchedValuesToOSRContArgs[src_v];
            continue;
        } else if (lpInfo != nullptr) {
            // check for oneToOneValue or compensation code specific for this pair
            ValueInfoMap::iterator VIMIt = lpInfo->valueInfoMap.find(dest_v);
            if (VIMIt != lpInfo->valueInfoMap.end()) {
                ValueInfo* VI = VIMIt->second;
                if (VI->isOneToOneValue()) {
                    Value* src_v = VI->oneToOneValue;
                    (*updatedValuesToUse)[dest_v] = fetchedValuesToOSRContArgs[src_v];
                    continue;
                } else {
                    lastCreatedBB = addLocalCompensationCode(lastCreatedBB, dest_v, VI,
                        updatedValuesToUse, fetchedValuesToOSRContArgs);
                }
                continue;
            }
        }

        dest_v->dump();
        llvm::report_fatal_error("[genContinuationFunctionEntryPoint] missing "
                "mapping information for the Value shown above");
    }

    // add branch instruction
    BranchInst* brToDest = BranchInst::Create(OSRContLPad->getParent());
    lastCreatedBB->getInstList().push_back(brToDest);

    return std::pair<BasicBlock*, ValueToValueMapTy*>(lastCreatedBB, updatedValuesToUse);
}

void StateMap::updateRefsToArgs(StateMap::CompCode* compCode, ValueToValueMapTy &VMap) {
    if (compCode->args == nullptr) return;
    for (CompCodeArgs::iterator argIt = compCode->args->begin(),
            argEnd = compCode->args->end(); argIt != argEnd; ++argIt) {
        Value* srcVal = *argIt;
        Value* newVal = VMap[srcVal];
        for (CodeSequence::iterator it = compCode->code->begin(),
                end = compCode->code->end(); it != end; ++it) {
            // perform replacement of operands when required
            if (Instruction* ins = dyn_cast<Instruction>(*it)) {
                for (User::op_iterator opIt = ins->op_begin(), opEnd = ins->op_end();
                        opIt != opEnd; ++opIt) {
                    if (*opIt == srcVal) {
                        // don't break here! operand can be repeated
                        *opIt = newVal;
                    }
                }
            }
        }
    }
}

BasicBlock* StateMap::addGlobalCompensationCode(BasicBlock* curBlock,
        StateMap::CompCode* compCode, ValueToValueMapTy &fetchedValuesToNewDestArgs) {
    updateRefsToArgs(compCode, fetchedValuesToNewDestArgs);

    for(CodeSequence::iterator it = compCode->code->begin(),
            end = compCode->code->end(); it != end; ++it) {
        Value* curVal = *it;
        assert(!isa<BasicBlock>(curVal) && "multiple blocks for compensation "
                "code are not supported yet");
        Instruction* curInst = cast<Instruction>(curVal);
        curBlock->getInstList().push_back(curInst);
    }

    return curBlock;
}

BasicBlock* StateMap::addLocalCompensationCode(BasicBlock* curBlock, Value* dest_v,
        StateMap::ValueInfo* valInfo, ValueToValueMapTy* updatedValuesToUse,
        ValueToValueMapTy& fetchedValuesToNewDestArgs) {
    CompCode* compCode = valInfo->compCode;
    updateRefsToArgs(compCode, fetchedValuesToNewDestArgs);

    for(CodeSequence::iterator it = compCode->code->begin(),
            end = compCode->code->end(); it != end; ++it) {
        Value* curVal = *it;
        assert(!isa<BasicBlock>(curVal) && "multiple blocks for compensation "
                "code are not supported yet");
        Instruction* curInst = cast<Instruction>(curVal);
        curBlock->getInstList().push_back(curInst);
    }

    (*updatedValuesToUse)[dest_v] = compCode->value;

    return curBlock;
}

Value* StateMap::getCorrespondingOneToOneValue(Value *v) {
    OneToOneValueMap::iterator oneToOneIt = defaultOneToOneMap.find(v);
    if (oneToOneIt != defaultOneToOneMap.end()) {
        return oneToOneIt->second;
    }
    return nullptr;
}

Instruction* StateMap::getLandingPad(Instruction* OSRSrc) {
    LocMap::iterator it = landingPadMap.find(OSRSrc);
    if (it != landingPadMap.end()) {
        return it->second;
    }
    return nullptr;
}

StateMap::ValueInfo* StateMap::getValueInfo(Value* v, StateMap::LocPair &pair) {
    LocPairInfoMap::iterator LPIMIt = locPairInfoMap.find(pair);
    if (LPIMIt != locPairInfoMap.end()) {
        LocPairInfo& lpInfo = LPIMIt->second;
        ValueInfoMap::iterator VIMIt = lpInfo.valueInfoMap.find(v);
        if (VIMIt != lpInfo.valueInfoMap.end()) {
            return VIMIt->second;
        }
    }
    return nullptr;
}


void StateMap::registerOneToOneValue(Value* src_v, Value* dest_v, bool bidirectional) {
    defaultOneToOneMap[dest_v] = src_v;
    if (bidirectional) {
        defaultOneToOneMap[src_v] = dest_v;
    }
}

void StateMap::registerLandingPad(Instruction* OSRSrc, Instruction* LPad, bool bidirectional) {
    landingPadMap[OSRSrc] = LPad;
    if (bidirectional) {
        landingPadMap[LPad] = OSRSrc;
    }
}

StateMap::LocPairInfo& StateMap::getOrCreateMapBlockPairInfo(StateMap::LocPair &pair) {
    LocPairInfoMap::iterator it = locPairInfoMap.find(pair);
    if (it != locPairInfoMap.end()) return it->second;

    std::pair<LocPairInfoMap::iterator, bool> ret = locPairInfoMap.
        insert(std::pair<LocPair, LocPairInfo>(pair, LocPairInfo()));

    return ret.first->second;
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