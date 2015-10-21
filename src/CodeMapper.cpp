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
    CodeMapper* LM = new CodeMapper();
    globalMap.insert(std::pair<Function*, CodeMapper*>(&F, LM));

    // embed LM as metadata for the function
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

void CodeMapper::replaceAllUsesWith(Instruction* I, Value* V) {
    if (Instruction* newI = dyn_cast<Instruction>(V)) {
        operations.push_back(new RAUWInstWithInst(I, newI));
    } else if (Constant* C = dyn_cast<Constant>(V)) {
        operations.push_back(new RAUWInstWithConst(I, C));
    } else if (Argument* A = dyn_cast<Argument>(V)) {
        operations.push_back(new RAUWInstWithArg(I, A));
    } else {
        assert(false && "[OSR] unknown value type for RAUW");
    }
}

Instruction* CodeMapper::CMAction::findSuccessor(Instruction* I) {
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
    for (StateMap::LocMap::iterator it = M->landingPadMap.begin(),
            end = M->landingPadMap.end(); it != end; ++it) {
        if (it->second == OldLPad) {
            it->second = NewLPad;
        }
    }
}

// discard landing pad information for program points mapped to OldLPad
void CodeMapper::discardLandingPads(StateMap* M, Instruction* OldLPad) {
    for (StateMap::LocMap::iterator it = M->landingPadMap.begin(),
            end = M->landingPadMap.end(); it != end; ) {
        if (it->second == OldLPad) {
            M->landingPadMap.erase(it++);
        } else {
            ++it;
        }
    }
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
void CodeMapper::AddInst::apply(StateMap *M, bool verbose) {
    Instruction* LPadForSuccI = M->getLandingPad(SuccI);
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
 * - set LPad[D] to LPad[succ(D)] = LPad[I2'] = I2
 * - for each OSRSrc s.t. LPad[OSRSrc] = D do
 *      set LPad[OSRSrc] to LPad[succ(D)] = I2
 *
 */
void CodeMapper::DeleteInst::apply(StateMap *M, bool verbose) {
    StateMap::OneToOneValueMap::iterator it = M->defaultOneToOneMap.find(DeletedI);
    Value* otherD = nullptr;
    if (it != M->defaultOneToOneMap.end()) {
        otherD = it->second;
        M->defaultOneToOneMap.erase(it);
        // Deleted instruction might not exist in the original function (this
        // happens when it has been added at some point during optimization)
        it = M->defaultOneToOneMap.find(otherD);
        if (it != M->defaultOneToOneMap.end()) {
            M->defaultOneToOneMap.erase(it);
        }
    }

    Instruction* LPadForSuccI = M->getLandingPad(SuccI);
    if (LPadForSuccI) {
        // the deleted instruction might have been constant-folded in the other
        // function, so we have to check whether otherD is an Instruction
        if (Instruction* otherDI = dyn_cast_or_null<Instruction>(otherD)) {
            M->registerLandingPad(otherDI, LPadForSuccI);
        }
        replaceLandingPads(M, DeletedI, LPadForSuccI);
    } else {
        // we ought to be conservative here
        discardLandingPads(M, DeletedI);
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
 * - set LPad[H'] to I3
 *
 */
void CodeMapper::HoistInst::apply(StateMap *M, bool verbose) {
    replaceLandingPads(M, HoistedI, SuccHoistedI);
    replaceLandingPads(M, BeforeI, HoistedI);

    // TODO when the instruction does not exist, can we do better than this?
    StateMap::OneToOneValueMap::iterator it = M->defaultOneToOneMap.find(BeforeI);
    if (it != M->defaultOneToOneMap.end()) {
        Value *otherBefore = it->second;
        if (Instruction* otherBeforeI = dyn_cast<Instruction>(otherBefore)) {
            M->registerLandingPad(otherBeforeI, HoistedI);
            M->registerLandingPad(HoistedI, otherBeforeI);
        } else {
            M->unregisterLandingPad(HoistedI);
        }
    } else {
        M->unregisterLandingPad(HoistedI);
    }

    it = M->defaultOneToOneMap.find(HoistedI);
    if (it != M->defaultOneToOneMap.end()) {
        Value* otherHoisted = it->second;
        if (Instruction* otherHoistedI = dyn_cast<Instruction>(otherHoisted)) {
            M->registerLandingPad(otherHoistedI, SuccHoistedI);
        } // TODO else branch?
    }
}

void CodeMapper::SinkInst::apply(StateMap *M, bool verbose) {
    // TODO
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