/* ===============================================================
 * Code mapper component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "CodeMapper.hpp"

#include <llvm/IR/Function.h>

#undef NDEBUG
#include <cassert>
#include <iostream>
#include <map>

using namespace llvm;

CodeMapper::GlobalMap CodeMapper::globalMap;

CodeMapper* CodeMapper::getCodeMapper(Function &F) {
    GlobalMap::iterator it = globalMap.find(&F);
    if (it != globalMap.end()) {
        return it->second;
    }
    return nullptr;
}

CodeMapper* CodeMapper::createCodeMapper(Function &F) {
    assert(!hasCodeMapper(F) && "a CodeMapper already exists");
    CodeMapper* LM = new CodeMapper(F);
    globalMap.insert(std::pair<Function*, CodeMapper*>(&F, LM));

    return LM;
}

bool CodeMapper::hasCodeMapper(Function& F) {
    return globalMap.count(&F) > 0;
}

void CodeMapper::removeCodeMapper(Function& F) {
    GlobalMap::iterator it = globalMap.find(&F);
    assert (it != globalMap.end() && "no CodeMapper to remove");
    globalMap.erase(it);
}

void CodeMapper::beginOptimization(const char* name) {
    operations.push_back(new BeginOpt(name));
}

void CodeMapper::addInstruction(Instruction* I) {
    operations.push_back(new AddInst(I));
}

void CodeMapper::deleteInstruction(Instruction* I) {
    operations.push_back(new DeleteInst(I));
}

void CodeMapper::hoistInstruction(Instruction* I, Instruction* insertBefore) {
    operations.push_back(new HoistInst(I, insertBefore));
}

void CodeMapper::sinkInstruction(Instruction* I, Instruction* insertBefore) {
    operations.push_back(new SinkInst(I, insertBefore));
}

void CodeMapper::replaceAllUsesWith(Instruction* I, Value* V, bool alias) {
    CodeMapper::RAUWInst::LLVMValueType type;

    if (isa<Instruction>(V)) {
        type = CodeMapper::RAUWInst::LLVMValueType::InstructionTy;
    } else if (isa<Argument>(V)) {
        type = CodeMapper::RAUWInst::LLVMValueType::ArgumentTy;
    } else if (isa<Constant>(V)) {
        type = CodeMapper::RAUWInst::LLVMValueType::ConstantTy;
    } else {
        assert(false && "[OSR] Unknown Value type for RAUW");
        return;
    }

    operations.push_back(new RAUWInst(I,V,type,alias));
}

// TODO there might be a better way to create an iterator
Instruction* CodeMapper::findSuccessor(Instruction* I) {
    if (isa<TerminatorInst>(I)) return nullptr; // TODO unconditional branchs?

    BasicBlock* B = I->getParent();
    assert(B != nullptr && "instruction not in a block");

    BasicBlock::iterator it = B->begin();
    while (&*it++ != I);

    return &*it;
}

// set NewLPad as landing pad for program points mapped to OldLPad
void CodeMapper::replaceLandingPads(StateMap* M, Instruction* OldLPad,
        Instruction* NewLPad) {
    StateMap::LocMap &landingPadMap = M->getAllLandingPads();

    for (StateMap::LocMap::iterator it = landingPadMap.begin(),
            end = landingPadMap.end(); it != end; ++it) {
        if (it->second == OldLPad) {
            it->second = NewLPad;
        }
    }
}

// discard landing pad information for program points mapped to OldLPad
void CodeMapper::discardLandingPads(StateMap* M, Instruction* OldLPad) {
    StateMap::LocMap &landingPadMap = M->getAllLandingPads();
    for (StateMap::LocMap::iterator it = landingPadMap.begin(),
            end = landingPadMap.end(); it != end; ) {
        if (it->second == OldLPad) {
            landingPadMap.erase(it++);
        } else {
            ++it;
        }
    }
}

// TODO can we come up with a better strategy?
Instruction* CodeMapper::findOtherI(StateMap* M, Instruction* I) {
    #if 0
    Instruction* otherI = nullptr;

    StateMap::OneToOneValueMap &valMap = M->getAllCorrespondingOneToOneValues();
    for (StateMap::OneToOneValueMap::iterator it = valMap.begin(),
            end = valMap.end(); it != end; ++it) {
        if (it->first == I) {
            otherI = dyn_cast<Instruction>(it->second);
            break;
        } else if (it->second == I) {
            otherI = dyn_cast<Instruction>(it->first);
            break;
        }
    }

    if (otherI) {
        if (otherI == M->getLandingPad(I) || I == M->getLandingPad(otherI)) {
            return otherI;
        }
    }
    return nullptr;

    #else
    return M->getLandingPad(I);
    #endif
}

/*
 * Original     Updated
 * function     function
 * I1'          I1
 * -            A
 * I2'          I2
 * I3'          I3
 *
 * Actions:
 * - set LPad[A] to LPad[succ(A)] = LPad[I2] = I2'
 *
 */
void CodeMapper::AddInst::apply(StateMap *M, StateMapUpdateInfo* updateInfo,
        bool verbose) {
    /*assert(updateInfo->DeletedInstructions.count(AddedI) == 0
            && "we have a problem with the allocator :-)");*/

    Instruction* LPadForSuccI = SuccI ? M->getLandingPad(SuccI) : nullptr;
    if (LPadForSuccI) {
        M->registerLandingPad(AddedI, LPadForSuccI, false);
    }
}

/*
 * Original     Updated
 * function     function
 * I1'          I1
 * D            -
 * I2'          I2
 * I3'          I3
 *
 * Actions:
 * - remove corresponding 1:1 value info for D
 * - remove information for values for which D is the 1:1 corresponding value
 *   (TODO: what if I do RAUW & delete? do we need a different primitive?)
 * - remove D as source for an OSR
 * - for each OSRSrc s.t. LPad[OSRSrc] = D do
 *      set LPad[OSRSrc] to LPad[succ(D)] = I2
 *
 */
void CodeMapper::DeleteInst::apply(StateMap *M, StateMapUpdateInfo* updateInfo,
        bool verbose) {

    std::map<Value*, std::set<Value*>>::iterator LOOIt, LOOEnd;
    std::map<Value*, std::set<Value*>> &LOOMap =
            updateInfo->RAUWOneToOneLoadInfo;
    LOOIt = LOOMap.find(DeletedI);
    if (LOOIt != LOOMap.end()) {
        LOOMap.erase(LOOIt);
    }
    for (LOOIt = LOOMap.begin(), LOOEnd = LOOMap.end(); LOOIt != LOOEnd; ) {
        std::set<Value*>::iterator it = LOOIt->second.find(DeletedI);
        if (it != LOOIt->second.end()) {
            LOOIt->second.erase(it);
        }
        if (LOOIt->second.empty()) {
            LOOMap.erase(LOOIt++);
        } else {
            ++LOOIt;
        }
    }


    StateMap::OneToOneValueMap &defaultOneToOneMap =
            M->getAllCorrespondingOneToOneValues();

    for (StateMap::OneToOneValueMap::iterator it = defaultOneToOneMap.begin(),
            end = defaultOneToOneMap.end(); it != end; ) {
        if (it->first == DeletedI) {
            defaultOneToOneMap.erase(it++);
        } else if (it->second == DeletedI) {
            // the instruction is likely to be trivially dead
            defaultOneToOneMap.erase(it++);
            //std::cerr << "Orphan value..." << std::endl;
        } else {
            ++it;
        }
    }

    M->unregisterLandingPad(DeletedI);

    if (SuccI) {
        replaceLandingPads(M, DeletedI, SuccI);
    } else {
        discardLandingPads(M, DeletedI);
    }

    updateInfo->DeletedInstructions.insert(DeletedI);

    auto addOneToOneit = updateInfo->AdditionalOneToOneValues.find(DeletedI);
    if (addOneToOneit != updateInfo->AdditionalOneToOneValues.end()) {
        updateInfo->AdditionalOneToOneValues.erase(addOneToOneit);
    }
}

/*
 * Original     Updated
 * function     function
 * I1'          I1
 * B'           H
 * I2'          B
 * H'           I2
 * I3'          I3
 *
 * Actions (order matters!):
 * - for each OSRSrc s.t. LPad[OSRSrc] = H do
 *      set LPad[OSRSrc] to I3
 * - for each OSRSrc s.t. LPad[OSRSrc] = B do
 *      set LPad[OSRSrc] to H
 * - set LPad[B'] to H
 * - set LPad[H] to B'
 *
 */
void CodeMapper::HoistInst::apply(StateMap *M, StateMapUpdateInfo* updateInfo,
        bool verbose) {
    Instruction* otherBeforeI = findOtherI(M, BeforeI);

    if (SuccHoistedI) {
        replaceLandingPads(M, HoistedI, SuccHoistedI);
    } else {
        discardLandingPads(M, HoistedI);
    }
    replaceLandingPads(M, BeforeI, HoistedI);

    if (otherBeforeI) {
        M->registerLandingPad(HoistedI, otherBeforeI, true); // bidirectional
    } else {
        M->unregisterLandingPad(HoistedI);
    }
}

/*
 * Original     Updated
 * function     function
 * I1'          I1
 * S'           I2
 * I2'          I3
 * I3'          S
 * B'           B
 *
 * Actions (order matters!):
 * - for each OSRSrc s.t. LPad[OSRSrc] = S do
 *      set LPad[OSRSrc] to I2
 * - set LPad[S'] to I2
 * - set LPad[I2] to S'
 * - set LPad[S] to B'
 */

void CodeMapper::SinkInst::apply(StateMap *M, StateMapUpdateInfo* updateInfo,
        bool verbose) {
    Instruction* otherBeforeI = findOtherI(M, BeforeI);
    Instruction* otherSunkI = findOtherI(M, SunkI);

    if (SuccSunkI) {
        replaceLandingPads(M, SunkI, SuccSunkI);
    } else {
        discardLandingPads(M, SunkI);
    }

    if (otherSunkI) {
        if (SuccSunkI) {
            M->registerLandingPad(SuccSunkI, otherSunkI, false);
        } else {
            M->unregisterLandingPad(SuccSunkI);
        }
    } else {
        if (SuccSunkI) {
            M->unregisterLandingPad(SuccSunkI);
        }
    }

    if (otherBeforeI) {
        M->registerLandingPad(SunkI, otherBeforeI, false);
    } else {
        M->unregisterLandingPad(SunkI);
    }
}

void CodeMapper::RAUWInst::apply(StateMap* M, StateMapUpdateInfo* updateInfo,
        bool verbose) {
    assert(alias && "RAUW for non-alias not implemented yet");

    if (!alias) return; // TODO

    Value *oldValue = I, *newValue = V;

    // for better handling of LoadInst
    Value* otherI = M->getCorrespondingOneToOneValue(I);
    Value* otherV = M->getCorrespondingOneToOneValue(V);

    std::map<Value*, std::set<Value*>>::iterator LOOIt;
    std::map<Value*, std::set<Value*>> &LOOMap =
            updateInfo->RAUWOneToOneLoadInfo;

    if (isLoadI && (otherI || otherV)) {
        LOOIt = LOOMap.find(I);
        if (LOOIt == LOOMap.end()) {
            LOOIt = LOOMap.insert(std::pair<Value*, std::set<Value*>>(I, {})).first;
        }
        if (otherI) LOOIt->second.insert(otherI);
        if (otherV) LOOIt->second.insert(otherV);
    }

    if (isLoadV) {
        LOOIt = LOOMap.find(V);
        if (LOOIt == LOOMap.end()) {
            LOOIt = LOOMap.insert(std::pair<Value*, std::set<Value*>>(V, {})).first;
        }
        if (otherI) LOOIt->second.insert(otherI);
        if (otherV) LOOIt->second.insert(otherV);
    }

    StateMap::OneToOneValueMap &map = M->getAllCorrespondingOneToOneValues();
    StateMap::OneToOneValueMap::iterator it, end;

    for (it = map.begin(), end = map.end(); it != end; ++it) {
        if (it->second == oldValue) {
            it->second = newValue;
        }
    }

    #if 0 // TODO this can be disruptive when map.count(newValue) != 0
    if (type == LLVMValueType::InstructionTy) {
        it = map.find(oldValue);
        if (it != end) {
            map[newValue] = it->second;
        }
    }
    #else
    if (type == LLVMValueType::InstructionTy) { // TODO avoid clash... :-(
        Instruction* newInst = cast<Instruction>(newValue);
        it = map.find(oldValue);
        if (it != end) {
#if 1
            Value* aliasV = it->second;
            if (map.count(newValue) == 0) {
                map[newValue] = aliasV;
            } else {
                if (updateInfo->AdditionalOneToOneValues.count(newInst) == 0) {
                    updateInfo->AdditionalOneToOneValues.insert(std::pair<
                            Instruction*, std::set<Value*>>(newInst, {aliasV}));
                } else {
                    updateInfo->AdditionalOneToOneValues[newInst].insert(aliasV);
                }
            }
#else
            if (map.count(newValue) != 0) {
                Value* aliasV = map[newValue];
                if (updateInfo->AdditionalOneToOneValues.count(newInst) == 0) {
                    updateInfo->AdditionalOneToOneValues.insert(std::pair<Value*,
                            std::set<Value*>>(newInst, {aliasV}));
                } else {
                    updateInfo->AdditionalOneToOneValues[newInst].insert(aliasV);
                }

            }
            map[newValue] = it->second;
#endif
        }
    }
    #endif
}

CodeMapper::StateMapUpdateInfo& CodeMapper::updateStateMapping(StateMap* M,
        bool verbose) {

    StateMapUpdateInfo updateInfo;

    int addedInst = 0, deletedInst = 0, hoistedInst = 0, sunkInst = 0;
    int instRAUWedWithArg = 0, instRAUWedwithConst = 0, instRAUWedWithInst = 0;

    for (CMAction* action: operations) {
        switch (action->getKind()) {
            case CMAction::CMAK_AddInst:            ++addedInst; break;
            case CMAction::CMAK_BeginOpt:           break;
            case CMAction::CMAK_DeleteInst:         ++deletedInst; break;
            case CMAction::CMAK_HoistInst:          ++hoistedInst; break;
            case CMAction::CMAK_SinkInst:           ++sunkInst; break;
            case CMAction::CMAK_RAUWInst:
                switch (cast<CodeMapper::RAUWInst>(action)->type) {
                    case CodeMapper::RAUWInst::LLVMValueType::ArgumentTy:
                        ++instRAUWedWithArg; break;
                    case CodeMapper::RAUWInst::LLVMValueType::ConstantTy:
                        ++instRAUWedwithConst; break;
                    case CodeMapper::RAUWInst::LLVMValueType::InstructionTy:
                        ++instRAUWedWithInst; break;

                }
                break;
        }
        action->apply(M, &updateInfo, verbose);
    }

    if (verbose) {
        std::cerr << "Added instructions: " << addedInst << std::endl;
        std::cerr << "Deleted instructions: " << deletedInst << std::endl;
        std::cerr << "Hoisted instructions: " << hoistedInst << std::endl;
        std::cerr << "Sunk instructions: " << sunkInst << std::endl;
        std::cerr << "RAUW_I instructions: " << instRAUWedWithInst << std::endl;
        std::cerr << "RAUW_C instructions: " << instRAUWedwithConst << std::endl;
        std::cerr << "RAUW_A instructions: " << instRAUWedWithArg << std::endl;
    }

    // update Liveness info in M
    std::pair<LivenessAnalysis&, LivenessAnalysis&> livenessPair =
                M->getLivenessResults();
    std::pair<Function*, Function*> funPair = M->getFunctions();
    LivenessAnalysis *LA;
    if (funPair.first == TheFunction) {
        LA = &livenessPair.first;
    } else {
        LA = &livenessPair.second;
    }
    LA->updateAllLiveValues();

    // register updateInfo and return a reference
    return updateInfoMap.insert(std::pair<StateMap*, StateMapUpdateInfo>(M,
            std::move(updateInfo))).first->second;
}

CodeMapper::StateMapUpdateInfo* CodeMapper::getStateMapUpdateInfo(StateMap* M) {
    if (updateInfoMap.count(M) == 0) return nullptr;
    return &updateInfoMap[M];
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