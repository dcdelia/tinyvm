/* ===============================================================
 * Try to build OSR compensation code automatically.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#ifndef TINYVM_BUILDCOMP_H
#define TINYVM_BUILDCOMP_H

#include "StateMap.hpp"

#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

class BuildComp {
public:
    enum Heuristics {
        BC_NONE = 0, BC_ALIAS = 1 // more to come: use a good enconding scheme
    };
    static std::vector<llvm::Value*> buildComp(StateMap *M,
            llvm::Instruction* OSRSrc, llvm::Instruction* LPad, Heuristics opt);
};

#endif