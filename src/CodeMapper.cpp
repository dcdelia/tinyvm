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