#include "LocMapper.hpp"

#include <llvm/IR/Function.h>

#undef NDEBUG
#include <cassert>
#include <map>

using namespace llvm;

LocMapper::GlobalMap LocMapper::globalMap;

LocMapper* LocMapper::getLocMapper(Function &F) {
    GlobalMap::iterator it = globalMap.find(&F);
    if (it != globalMap.end()) {
        return it->second;
    }
    return nullptr;
}

LocMapper* LocMapper::createLocMapper(Function &F) {
    assert(!hasLocMapper(F) && "a LocMapper already exists");
    LocMapper* LM = new LocMapper();
    globalMap.insert(std::pair<Function*, LocMapper*>(&F, LM));

    // embed LM as metadata for the function
    return LM;
}

bool LocMapper::hasLocMapper(Function& F) {
    return globalMap.count(&F) > 0;
}

void LocMapper::removeLocMapper(Function& F) {
    GlobalMap::iterator it = globalMap.find(&F);
    assert (it != globalMap.end() && "no LocMapper to remove");
    globalMap.erase(it);
}

void LocMapper::addInstruction(Instruction* I) {
    operations.push_back(new AddInst(I));
}

void LocMapper::deleteInstruction(Instruction* I) {
    operations.push_back(new DeleteInst(I));
}

void LocMapper::moveInstruction(Instruction* I, Instruction* insertBefore) {
    operations.push_back(new MoveInst(I, insertBefore));
}

void LocMapper::replaceInstruction(Instruction* oldI, Instruction* newI) {
    operations.push_back(new ReplaceInst(oldI, newI));
}