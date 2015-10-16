/* ===============================================================
 * Try to build OSR compensation code automatically.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#include "BuildComp.hpp"
#include "Liveness.hpp"
#include "StateMap.hpp"

#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

#undef NDEBUG
#include <cassert>
#include <map>
#include <set>

using namespace llvm;

static void identifyMissingValues(Instruction* I, std::map<Value*, Value*>
        &availableValues, std::set<Value*> &missingValues) {
    for (Use &U : I->operands()) {
        Value* op = U.get();
        if (availableValues.count(op) == 0 && missingValues.count(op) == 0) {
            // OSRLibrary takes care of Constant objects (e.g. constant scalars,
            // ConstExpr, GlobalVariable, Function) when generating a
            // continuation function by running fixUsesOfFunctionsAndGlobals()
            if (isa<Constant>(op)) continue;
            missingValues.insert(op);
            if (Instruction* opI = dyn_cast<Instruction>(op)) {
                identifyMissingValues(opI, availableValues, missingValues);
            } else {
                assert (isa<Argument>(op) && "Metadata operands are unsupported");
            }
        }
    }
}

static StateMap::ValueInfo* buildCompCode(Value* valToReconstruct,
        std::map<Value*, Value*> &availableValues, std::set<Value*> &valuesToKeep,
        BuildComp::Heuristics opt) {
    // indentify which values need to be reconstructed
    std::set<Value*> missingValues;

    if (isa<Argument>(valToReconstruct)) {
        valuesToKeep.insert(valToReconstruct);
        return nullptr;
    }

    Instruction* mainInstToReconstruct = cast<Instruction>(valToReconstruct);

    // TODO: other instructions as well?
    if (isa<PHINode>(mainInstToReconstruct) || isa<LoadInst>(mainInstToReconstruct)) {
        // TODO: check optimization for LOAD from read-only memory
        return nullptr;
    }

    identifyMissingValues(mainInstToReconstruct, availableValues, missingValues);

    std::set<Instruction*> instWorkList;
    for (Value* v: missingValues) {
        // TODO check option to extend liveness range
        if (isa<Argument>(v)) return nullptr;
        instWorkList.insert(cast<Instruction>(v));
    }

    // compute a topological order based on use-def information
    std::vector<Instruction*> sortedInstructions;
    while (!instWorkList.empty()) {
        for (std::set<Instruction*>::iterator it = instWorkList.begin(),
                end = instWorkList.end(); it != end; ) {
            Instruction* I = *it;
            bool canInsert = true;
            for (Use &U: I->operands()) {
                Value* op = U.get();
                if (Instruction* opI = dyn_cast<Instruction>(op)) {
                    if (instWorkList.count(opI) > 0) {
                        canInsert = false;
                        break;
                    }
                }
            }
            if (canInsert) {
                sortedInstructions.push_back(I);
                instWorkList.erase(it++);
            } else {
                ++it;
            }
        }
    }

    StateMap::CompCode* compCode = new StateMap::CompCode();

    for (Instruction* currInstToReconstruct: sortedInstructions) {
        // TODO
    }

    StateMap::ValueInfo* valInfo = new StateMap::ValueInfo(compCode);
    return valInfo;
}

std::set<Value*> BuildComp::buildComp(StateMap *M, Instruction* OSRSrc,
        Instruction* LPad, BuildComp::Heuristics opt, bool updateMapping,
        bool verbose) {
    std::set<Value*> valuesToKeep;

    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    BasicBlock* OSRSrcBlock = OSRSrc->getParent();
    BasicBlock* LPadBlock = LPad->getParent();
    Function* src = OSRSrcBlock->getParent();
    Function* dest = LPadBlock->getParent();

    LivenessAnalysis::LiveValues *liveAtOSRSrc, *liveAtLPad;

    if (src == funPair.first) {
        assert (dest == funPair.second && "wrong LocPair or StateMap");
        liveAtOSRSrc = &LAPair.first.getLiveInValues(OSRSrcBlock);
        liveAtLPad = &LAPair.second.getLiveInValues(LPadBlock);
    } else {
        assert (src == funPair.second && dest == funPair.first
                && "wrong LocPair or StateMap");
        liveAtOSRSrc = &LAPair.second.getLiveInValues(OSRSrcBlock);
        liveAtLPad = &LAPair.first.getLiveInValues(LPadBlock);
    }

    std::map<Value*, Value*> availableValues;
    std::vector<Value*> workList;

    // build map of available values (i.e., 1:1 mapping & both are live)
    for (const Value* v: *liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        Value* oneToOneVal = M->getCorrespondingOneToOneValue(valToSet);
        if (oneToOneVal != nullptr) {
            // TODO check option to extend liveness range
            if (liveAtOSRSrc->count(oneToOneVal) > 0) {
                availableValues[valToSet] = oneToOneVal;
                continue;
            }
        }
        workList.push_back(valToSet);
    }

    if (!workList.empty()) {
        StateMap::ValueInfoMap valueInfoMap;
        bool error = false;
        for (Value* valToReconstruct: workList) {
            std::set<Value*> curValuesToKeep;
            StateMap::ValueInfo* valInfo = buildCompCode(valToReconstruct,
                    availableValues, curValuesToKeep, opt);
            if (valInfo == nullptr) {
                error = true;
                valuesToKeep.insert(curValuesToKeep.begin(), curValuesToKeep.end());
            } else {
                valueInfoMap[valToReconstruct] = valInfo;
            }
        }
        if (error) {
            // placeholder for verbose mode
            // TODO: remove memory leaks
        } else if (updateMapping) {
            StateMap::LocPair LP(OSRSrc, LPad);
            /* TODO sync with recent changes to master is required!!! */
            StateMap::LocPairInfo& LPInfo = M->getOrCreateMapBlockPairInfo(LP);
            LPInfo.valueInfoMap = std::move(valueInfoMap);
        }
    }

    return valuesToKeep;
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