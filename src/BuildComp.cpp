/* ===============================================================
 * Try to build OSR compensation code automatically.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#include "BuildComp.hpp"
#include "Liveness.hpp"
#include "StateMap.hpp"

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/Constant.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

#undef NDEBUG
#include <cassert>
#include <map>
#include <iostream>
#include <set>
#include <vector>

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
                // reconstructInst will take care of Argument operands
                assert (isa<Argument>(op) && "Metadata operands are unsupported");
            }
        }
    }
}

static Instruction* reconstructInst(Instruction* I, std::map<Value*, Value*>
        &availableValues, std::map<Instruction*, Instruction*> &reconstructedMap,
        std::set<Value*> &argsForCompCode, BuildComp::Heuristic opt) {
    // TODO heuristics; other instruction types?
    if (isa<PHINode>(I) || isa<LoadInst>(I)) return nullptr;

    Instruction* RI = I->clone();

    std::map<Value*, Value*>::iterator availEnd = availableValues.end();
    std::map<Instruction*, Instruction*>::iterator recEnd = reconstructedMap.end();
    for (Use &U: RI->operands()) {
        Value* op = U.get();

        if (isa<Constant>(op)) continue;

        std::map<Value*, Value*>::iterator availIt = availableValues.find(op);
        if (availIt != availEnd) {
            Value* v = availIt->second;
            U.set(v);
            argsForCompCode.insert(v);
            continue;
        }

        if (isa<Argument>(op)) {
            // TODO check option to extend liveness range for a dead argument
            return nullptr;
        }

        if (Instruction* opI = dyn_cast<Instruction>(op)) {
            std::map<Instruction*, Instruction*>::iterator recIt =
                    reconstructedMap.find(opI);
            assert(recIt != recEnd && "unidentified or not in topological order?");
            U.set(recIt->second);
            continue;
        }

        assert(false && "Metadata operands are unsupported"); // reachable?
        return nullptr;
    }

    if (I->hasName()) {
        RI->setName((I->getName()));
    }

    return RI;
}

static StateMap::ValueInfo* buildCompCode(Instruction* instToReconstruct,
        std::map<Value*, Value*> &availableValues, std::set<Value*> &valuesToKeep,
        BuildComp::Heuristic opt) {

    // TODO: other instructions as well?
    if (isa<PHINode>(instToReconstruct) || isa<LoadInst>(instToReconstruct)) {
        // TODO check optimization for LOAD from read-only memory
        return nullptr;
    }

    // identify which values need to be reconstructed
    std::set<Value*> missingValues;
    identifyMissingValues(instToReconstruct, availableValues, missingValues);

    std::set<Instruction*> instWorkSet;
    for (Value* v: missingValues) {
        // TODO check option to extend liveness range for a dead argument
        if (isa<Argument>(v)) return nullptr;
        instWorkSet.insert(cast<Instruction>(v));
    }

    // compute a topological order based on use-def information
    std::vector<Instruction*> sortedInstructions;
    while (!instWorkSet.empty()) {
        for (std::set<Instruction*>::iterator it = instWorkSet.begin(),
                end = instWorkSet.end(); it != end; ) {
            Instruction* I = *it;
            bool canInsert = true;
            for (Use &U: I->operands()) {
                Value* op = U.get();
                if (Instruction* opI = dyn_cast<Instruction>(op)) {
                    // a use of a PHI node by itself is legal LLVM
                    if (opI == op && cast<PHINode>(I)) continue;
                    // we cannot insert an instruction before all the missing
                    // instructions it uses as operands have not been inserted
                    if (instWorkSet.count(opI) > 0) {
                        canInsert = false;
                        break;
                    }
                }
            }
            if (canInsert) {
                sortedInstructions.push_back(I);
                instWorkSet.erase(it++);
            } else {
                ++it;
            }
        }
    }

    // now we can insert the instruction to reconstruct at the end of the list:
    // since we are not reconstructing PHI nodes, instToReconstruct can not
    // appear in missingValues (special case of a PHI node using itself)
    assert(missingValues.count(instToReconstruct) == 0
            && "instruction to reconstruct appear as operand for itself?!?");
    sortedInstructions.push_back(instToReconstruct);

    StateMap::CompCode* compCode = new StateMap::CompCode();
    compCode->args = nullptr;
    compCode->code = new SmallVector<Value*, 8>;

    bool success = true;
    std::map<Instruction*, Instruction*> reconstructedMap;
    std::set<Value*> argsForCompCode;
    for (Instruction* currInstToReconstruct: sortedInstructions) {
        Instruction* RI = reconstructInst(currInstToReconstruct, availableValues,
                reconstructedMap, argsForCompCode, opt);
        if (RI == nullptr) {
            success = false;
            break;
        } else {
            compCode->code->push_back(RI);
            reconstructedMap[currInstToReconstruct] = RI;
        }
    }

    if (success) {
        compCode->value = compCode->code->back();
        if (!argsForCompCode.empty()) {
            compCode->args = new SmallVector<Value*, 4>;
            for (Value* arg: argsForCompCode) {
                compCode->args->push_back(arg);
            }
        }
        return new StateMap::ValueInfo(compCode);
    } else {
        for (StateMap::CodeSequence::iterator it = compCode->code->begin(),
                end = compCode->code->end(); it != end; ++it) {
            delete cast<Instruction>(*it);
        }
        delete compCode->code;
        delete compCode;

        return nullptr;
    }
}

bool BuildComp::isBuildCompRequired(StateMap* M, Instruction* OSRSrc,
        Instruction* LPad, bool verbose) {
    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    LivenessAnalysis *LA_src, *LA_dest;

    BasicBlock* OSRSrcBlock = OSRSrc->getParent();
    BasicBlock* LPadBlock = LPad->getParent();
    Function* src = OSRSrcBlock->getParent();
    Function* dest = LPadBlock->getParent();

    if (src == funPair.first) {
        assert (dest == funPair.second && "wrong LocPair or StateMap");
        LA_src = &LAPair.first;
        LA_dest = &LAPair.second;
    } else {
        assert (src == funPair.second && dest == funPair.first
                && "wrong LocPair or StateMap");
        LA_src = &LAPair.second;
        LA_dest = &LAPair.first;
    }

    liveAtOSRSrc = LivenessAnalysis::analyzeLiveInForSeq(OSRSrcBlock,
                LA_src->getLiveOutValues(OSRSrcBlock), OSRSrc, nullptr);
    liveAtLPad = LivenessAnalysis::analyzeLiveInForSeq(LPadBlock,
                LA_dest->getLiveOutValues(LPadBlock), LPad, nullptr);

    // check if for each value to set there is a 1:1 mapping with a live value
    std::vector<Value*> valuesToReconstruct;
    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        Value* oneToOneVal = M->getCorrespondingOneToOneValue(valToSet);
        if (oneToOneVal == nullptr || liveAtOSRSrc.count(oneToOneVal) == 0) {
            valuesToReconstruct.push_back(valToSet);
        }
    }

    bool ret = !valuesToReconstruct.empty();

    if (verbose && ret) {
        std::cerr << "No live value available to set the following values:"
                  << std::endl;
        for (Value* v: valuesToReconstruct) {
            v->dump();
        }
    }

    return ret;
}

bool BuildComp::buildComp(StateMap *M, Instruction* OSRSrc, Instruction* LPad,
        std::set<Value*> &keepSet, BuildComp::Heuristic opt, bool updateMapping,
        bool verbose) {

    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    LivenessAnalysis *LA_src, *LA_dest;

    BasicBlock* OSRSrcBlock = OSRSrc->getParent();
    BasicBlock* LPadBlock = LPad->getParent();
    Function* src = OSRSrcBlock->getParent();
    Function* dest = LPadBlock->getParent();

    if (src == funPair.first) {
        assert (dest == funPair.second && "wrong LocPair or StateMap");
        LA_src = &LAPair.first;
        LA_dest = &LAPair.second;
    } else {
        assert (src == funPair.second && dest == funPair.first
                && "wrong LocPair or StateMap");
        LA_src = &LAPair.second;
        LA_dest = &LAPair.first;
    }

    liveAtOSRSrc = LivenessAnalysis::analyzeLiveInForSeq(OSRSrcBlock,
                LA_src->getLiveOutValues(OSRSrcBlock), OSRSrc, nullptr);
    liveAtLPad = LivenessAnalysis::analyzeLiveInForSeq(LPadBlock,
                LA_dest->getLiveOutValues(LPadBlock), LPad, nullptr);


    std::map<Value*, Value*> availableValues;
    std::vector<Value*> workList;

    // build map of available values (i.e., 1:1 mapping & both are live)
    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        Value* oneToOneVal = M->getCorrespondingOneToOneValue(valToSet);
        if (oneToOneVal != nullptr) {
            // TODO check option to extend liveness range
            if (liveAtOSRSrc.count(oneToOneVal) > 0) {
                availableValues[valToSet] = oneToOneVal;
                continue;
            }
        }
        workList.push_back(valToSet);
    }

    if (workList.empty()) return true;


    StateMap::LocPairInfo::ValueInfoMap valueInfoMap;
    bool error = false;
    for (Value* valToReconstruct: workList) {
        std::set<Value*> curValuesToKeep;
        if (Instruction* I = dyn_cast<Instruction>(valToReconstruct)) {
            StateMap::ValueInfo* valInfo = buildCompCode(I, availableValues,
                    curValuesToKeep, opt);
            if (valInfo == nullptr) {
                error = true;
                keepSet.insert(curValuesToKeep.begin(), curValuesToKeep.end());
            } else {
                valueInfoMap[valToReconstruct] = valInfo;
            }
        } else {
            // TODO option to extend liveness range of a dead argument
            error = true;
            keepSet.insert(valToReconstruct);
        }
    }

    assert( (error || keepSet.empty()) && "non-empty keepSet on success?");

    if (error || !updateMapping) {
        // avoid memory leaks
        for (StateMap::LocPairInfo::ValueInfoMap::iterator it = valueInfoMap.begin(),
                end = valueInfoMap.end(); it != end; ++it) {
            delete it->second;
        }
    } else {
        StateMap::LocPair LP(OSRSrc, LPad);
        assert(M->getLocPairInfo(LP) == nullptr && "LocPairInfo alread exists");
        StateMap::LocPairInfo* LPInfo = M->createLocPairInfo(LP);
        LPInfo->valueInfoMap = std::move(valueInfoMap);
    }

    return error;
}

void BuildComp::printStatistics(StateMap* M, BuildComp::Heuristic opt,
        bool verbose) {
    std::pair<Function*, Function*> funPair = M->getFunctions();
    Function* F1 = funPair.first;
    Function* F2 = funPair.second;
    std::string F1Name = F1->getName().str();
    std::string F2Name = F2->getName().str();

    int OSRSourcesInF1 = 0, OSRSourcesInF2 = 0;
    int oneToOneValuesForF1 = 0, oneToOneValuesForF2 = 0;

    StateMap::LocMap &landingPadMap = M->getAllLandingPads();
    StateMap::OneToOneValueMap &defaultOneToOneValueMap =
            M->getAllCorrespondingOneToOneValues();

    for (StateMap::OneToOneValueMap::iterator it = defaultOneToOneValueMap.begin(),
            end = defaultOneToOneValueMap.end(); it != end; ++it) {
        Value* v = it->first;
        if (Instruction* I = dyn_cast<Instruction>(v)) {
            Function* F = I->getParent()->getParent();
            if (F == F1) {
                ++oneToOneValuesForF1;
            } else {
                assert (F == F2 && "Instruction from unknown function");
                ++oneToOneValuesForF2;
            }
        } else if (Argument* A = dyn_cast<Argument>(v)) {
            Function* F = A->getParent();
            if (F == F1) {
                ++oneToOneValuesForF1;
            } else {
                assert (F == F2 && "Argument from unknown function");
                ++oneToOneValuesForF2;
            }
        } else if (Constant* C = dyn_cast<Constant>(v)) {
            // TODO
        }
    }

    for (StateMap::LocMap::iterator it = landingPadMap.begin(),
            end = landingPadMap.end(); it != end; ++it) {
        Instruction* I = it->first;
        Function* F = I->getParent()->getParent();
        if (F == F1) {
            ++OSRSourcesInF1;
        } else {
            assert (F == F2 && "OSRSrc from unknown function");
            ++OSRSourcesInF2;
        }
    }

    std::cerr << "<" << F1Name << ">" << std::endl;
    std::cerr << "- " << oneToOneValuesForF1 << " values for which there is a "
              << "1:1 corresponding value" << std::endl;
    std::cerr << "- " << OSRSourcesInF1 << " candidate OSRSrc locations"
              << std::endl;

    std::cerr << "<" << F2Name << ">" << std::endl;
    std::cerr << "- " << oneToOneValuesForF2 << " values for which there is a "
              << "1:1 corresponding value" << std::endl;
    std::cerr << "- " << OSRSourcesInF2 << " candidate OSRSrc locations"
              << std::endl;
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