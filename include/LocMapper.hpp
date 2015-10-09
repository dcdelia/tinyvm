/* ===============================================================
 * Location mapper component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_LOCMAPPER_HPP
#define	TINYVM_LOCMAPPER_HPP

#include "StateMap.hpp"

#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/Support/Casting.h>
#include <map>

class LocMapper {
private:
    // Classes to encode IR manipulations
    class LMAction;
    class AddInst;
    class DeleteInst;
    class MoveInst;
    class ReplaceInst;

public:
    LocMapper() {}

    static LocMapper* getLocMapper(llvm::Function &F);
    static LocMapper* createLocMapper(llvm::Function &F);
    static bool hasLocMapper(llvm::Function &F);
    static void removeLocMapper(llvm::Function &F);

    void addInstruction(llvm::Instruction* I);
    void deleteInstruction(llvm::Instruction* I);
    void moveInstruction(llvm::Instruction* I, llvm::Instruction* insertBefore);
    void replaceInstruction(llvm::Instruction* oldI, llvm::Instruction* newI);

    void updateStateMapping(StateMap* M) {}

private:
    // Metadata attached to function have been introduced only since LLVM 3.7.0,
    // thus for the time being we rely on a simple static map object.
    typedef std::map<llvm::Function*, LocMapper*> GlobalMap;
    static GlobalMap globalMap;
    std::vector<LMAction*> operations;
};

/* LMAction's derived classes implement LLVM's lightweight RTTI */
class LocMapper::LMAction {
public:
    enum LMActionKind {
        LMAK_AddInst, LMAK_DeleteInst, LMAK_MoveInst, LMAK_ReplaceInst
    };
    LMActionKind getKind() const { return Kind; }
    LMAction(LMActionKind K) : Kind(K) {}
    virtual void apply(StateMap *M) {}

private:
    const LMActionKind Kind;
};

class LocMapper::AddInst : public LocMapper::LMAction {
public:
    AddInst(llvm::Instruction* I): LMAction(LMAK_AddInst), AI(I) {}

    static bool classof(const LMAction* LMA) {
        return LMA->getKind() == LMAK_AddInst;
    }

    void apply(StateMap *M) { } // TODO

    llvm::Instruction* AI;
private:

};

class LocMapper::DeleteInst : public LocMapper::LMAction {
public:
    DeleteInst(llvm::Instruction* I): LMAction(LMAK_DeleteInst), DI(I) {}

    static bool classof(const LMAction* LMA) {
        return LMA->getKind() == LMAK_DeleteInst;
    }

    void apply(StateMap *M) { } // TODO

    llvm::Instruction* DI;
private:
};


class LocMapper::MoveInst : public LocMapper::LMAction {
public:
    MoveInst(llvm::Instruction* I, llvm::Instruction* insertBefore):
            LMAction(LMAK_MoveInst), MI(I), BI(insertBefore) {
            // TODO
            }

    static bool classof(const LMAction* LMA) {
        return LMA->getKind() == LMAK_MoveInst;
    }

    void apply(StateMap *M) { } // TODO

    llvm::Instruction *MI, *BI;

private:
};

class LocMapper::ReplaceInst : public LocMapper::LMAction {
public:
    ReplaceInst(llvm::Instruction* oldI, llvm::Instruction* newI):
            LMAction(LMAK_ReplaceInst), OI(oldI), NI(newI) {}

    static bool classof(const LMAction* LMA) {
        return LMA->getKind() == LMAK_ReplaceInst;
    }

    void apply(StateMap *M) { } // TODO

    llvm::Instruction *OI, *NI;
private:
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