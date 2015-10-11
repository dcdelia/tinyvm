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

void CodeMapper::addInstruction(Instruction* I) {
    operations.push_back(new AddInst(I));
}

void CodeMapper::deleteInstruction(Instruction* I) {
    operations.push_back(new DeleteInst(I));
}

void CodeMapper::moveInstruction(Instruction* I, Instruction* insertBefore) {
    operations.push_back(new MoveInst(I, insertBefore));
}

void CodeMapper::replaceInstruction(Instruction* oldI, Instruction* newI) {
    operations.push_back(new ReplaceInst(oldI, newI));
}

Instruction* CodeMapper::CMAction::findSuccessor(Instruction* I) {
    if (isa<TerminatorInst>(I)) return nullptr;

    BasicBlock* B = I->getParent();
    assert(B != nullptr && "instruction not in a block");

    BasicBlock::iterator it = B->begin();
    while (&*it++ != I);

    return &*it;
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