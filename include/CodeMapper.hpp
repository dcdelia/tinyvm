/* ===============================================================
 * Code mapper component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_CODEMAPPER_HPP
#define	TINYVM_CODEMAPPER_HPP

#include "StateMap.hpp"

#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/Support/Casting.h>
#include <map>

class StateMap;

class CodeMapper {
private:
    // Classes to encode IR manipulations
    class CMAction;
    class AddInst;
    class DeleteInst;
    class HoistInst;
    class SinkInst;
    class RAUWInstWithInst;
    class RAUWInstWithConst;

public:
    CodeMapper() {}

    static CodeMapper* getCodeMapper(llvm::Function &F);
    static CodeMapper* createCodeMapper(llvm::Function &F);
    static bool hasCodeMapper(llvm::Function &F);
    static void removeCodeMapper(llvm::Function &F);

    // to call AFTER the instruction has been added
    void addInstruction(llvm::Instruction* I);

    // to call BEFORE the operation is performed
    void deleteInstruction(llvm::Instruction* I);
    void hoistInstruction(llvm::Instruction* I, llvm::Instruction* insertBefore);
    void sinkInstruction(llvm::Instruction* I, llvm::Instruction* insertBefore);
    void replaceAllUsesWith(llvm::Instruction* I, llvm::Value* V);

    void updateStateMapping(StateMap* M) {}

private:
    // Metadata attached to function have been introduced only since LLVM 3.7.0,
    // thus for the time being we rely on a simple static map object.
    typedef std::map<llvm::Function*, CodeMapper*> GlobalMap;
    static GlobalMap globalMap;
    std::vector<CMAction*> operations;

    // manipulation of private fields in StateMap objects
    static void replaceLandingPads(StateMap* M, llvm::Instruction* OldLPad,
        llvm::Instruction* NewLPad);
    static void discardLandingPads(StateMap* M, llvm::Instruction* OldLPad);
};

/* CMAction's derived classes implement LLVM's lightweight RTTI */
class CodeMapper::CMAction {
public:
    // types are explicitly encoded as I might later delete a pointed object!
    enum CMActionKind {
        CMAK_AddInst, CMAK_DeleteInst, CMAK_HoistInst, CMAK_SinkInst,
        CMAK_RAUWInstWithInst, CMAK_RAUWInstWithConst
    };
    CMActionKind getKind() const { return Kind; }
    CMAction(CMActionKind K) : Kind(K) {}
    virtual void apply(StateMap *M, bool verbose = false) = 0;

    static llvm::Instruction* findSuccessor(llvm::Instruction* I);

private:
    const CMActionKind Kind;
};

class CodeMapper::AddInst : public CodeMapper::CMAction {
public:
    AddInst(llvm::Instruction* I): CMAction(CMAK_AddInst), AddedI(I),
            SuccI(findSuccessor(I)) {}

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_AddInst;
    }

    void apply(StateMap *M, bool verbose = false);

    llvm::Instruction* AddedI;
    llvm::Instruction* SuccI;
private:

};

class CodeMapper::DeleteInst : public CodeMapper::CMAction {
public:
    DeleteInst(llvm::Instruction* I): CMAction(CMAK_DeleteInst), DeletedI(I),
            SuccI(findSuccessor(I)) { }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_DeleteInst;
    }

    void apply(StateMap *M, bool verbose = false);

    llvm::Instruction* DeletedI;
    llvm::Instruction* SuccI;
private:
};


class CodeMapper::HoistInst : public CodeMapper::CMAction {
public:
    HoistInst(llvm::Instruction* I, llvm::Instruction* insertPt):
            CMAction(CMAK_HoistInst), HoistedI(I), BeforeI(insertPt),
            SuccHoistedI(findSuccessor(I)) { }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_HoistInst;
    }

    void apply(StateMap *M, bool verbose = false);

    llvm::Instruction* HoistedI;
    llvm::Instruction* BeforeI;
    llvm::Instruction* SuccHoistedI;

private:
};


class CodeMapper::SinkInst : public CodeMapper::CMAction {
public:
    SinkInst(llvm::Instruction* I, llvm::Instruction* insertPt):
            CMAction(CMAK_SinkInst), SunkI(I), InsertPt(insertPt),
            SuccSunkI(findSuccessor(I)) { }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_SinkInst;
    }

    void apply(StateMap *M, bool verbose = false);

    llvm::Instruction* SunkI;
    llvm::Instruction* InsertPt;
    llvm::Instruction* SuccSunkI;

private:
};

class CodeMapper::RAUWInstWithInst : public CodeMapper::CMAction {
public:
    RAUWInstWithInst(llvm::Instruction* oldI, llvm::Instruction* newI):
            CMAction(CMAK_RAUWInstWithInst), OI(oldI), NI(newI) {}

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_RAUWInstWithInst;
    }

    void apply(StateMap *M, bool verbose = false) { } // TODO

    llvm::Instruction *OI, *NI;
private:
};

class CodeMapper::RAUWInstWithConst : public CodeMapper::CMAction {
public:
    RAUWInstWithConst(llvm::Instruction* I, llvm::Constant* C):
            CMAction(CMAK_RAUWInstWithConst), I(I), C(C) {}

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_RAUWInstWithConst;
    }

    void apply(StateMap *M, bool verbose = false) { } // TODO

    llvm::Instruction* I;
    llvm::Constant* C;
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