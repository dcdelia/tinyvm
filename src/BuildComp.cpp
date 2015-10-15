/* ===============================================================
 * Try to build OSR compensation code automatically.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#include "BuildComp.hpp"

#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

using namespace llvm;

std::vector<Value*> BuildComp::buildComp(StateMap *M, Instruction* OSRSrc,
        Instruction* LPad, BuildComp::Heuristics opt) {
    std::vector<Value*> Keep;

    // TODO

    return Keep;
}