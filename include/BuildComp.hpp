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

#include <set>

class BuildComp {
public:
    enum Heuristic {
        BC_NONE = 0, BC_ALIAS = 1 // more to come: use a good enconding scheme
    };
    static bool buildComp(StateMap *M,
                        llvm::Instruction* OSRSrc,
                        llvm::Instruction* LPad,
                        std::set<llvm::Value*> &keepSet,
                        Heuristic opt = BC_NONE,
                        bool updateMapping = true,
                        bool verbose = false);

    static bool isBuildCompRequired(StateMap* M,
                        llvm::Instruction* OSRSrc,
                        llvm::Instruction* LPad,
                        bool verbose = false);

    static void printStatistics(StateMap* M,
                        Heuristic opt = BC_NONE,
                        bool verbose = false);
};

#endif

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