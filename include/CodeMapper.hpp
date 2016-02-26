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
#include <llvm/Support/raw_os_ostream.h>
#include <map>

class CodeMapper {
private:
    class CMAction; // abstract class to encode IR manipulations
    class BeginOpt;
    class AddInst;
    class DeleteInst;
    class HoistInst;
    class SinkInst;
    class RAUWInst;

public:
    // for optimization passes debug
    static bool debugPasses;
    static llvm::raw_os_ostream debugStream;

    CodeMapper(llvm::Function &F) : TheFunction(&F) {}

    static CodeMapper* getCodeMapper(llvm::Function &F);
    static CodeMapper* createCodeMapper(llvm::Function &F);
    static bool hasCodeMapper(llvm::Function &F);
    static void removeCodeMapper(llvm::Function &F);

    void beginOptimization(const char* name);

    // to call AFTER the instruction has been added
    void addInstruction(llvm::Instruction* I);

    // to call BEFORE the operation is performed
    void deleteInstruction(llvm::Instruction* I);
    void hoistInstruction(llvm::Instruction* I, llvm::Instruction* insertBefore);
    void sinkInstruction(llvm::Instruction* I, llvm::Instruction* insertBefore);
    void replaceAllUsesWith(llvm::Instruction* I, llvm::Value* V,
                            bool alias = true);

    typedef std::map<llvm::Value*, std::set<llvm::Value*>> OneToManyAliasMap;

    typedef struct StateMapUpdateInfo {
        OneToManyAliasMap RAUWAliasInfo;
    } StateMapUpdateInfo;

    StateMapUpdateInfo& updateStateMapping(StateMap* M, bool verbose = false);
    StateMapUpdateInfo* getStateMapUpdateInfo(StateMap* M);

private:
    llvm::Function* TheFunction;
    std::vector<CMAction*> operations;
    std::map<StateMap*, StateMapUpdateInfo> updateInfoMap;

    // Metadata attached to function have been introduced only since LLVM 3.7.0,
    // thus for the time being we rely on a simple static map object.
    typedef std::map<llvm::Function*, CodeMapper*> GlobalMap;
    static GlobalMap globalMap;

    // helper methods
    static llvm::Instruction* findOtherI(StateMap* M, llvm::Instruction* I);
    static llvm::Instruction* findSuccessor(llvm::Instruction* I);
    static void replaceLandingPads(StateMap* M, llvm::Instruction* OldLPad,
        llvm::Instruction* NewLPad);
    static void discardLandingPads(StateMap* M, llvm::Instruction* OldLPad);
};

/* CMAction's derived classes implement LLVM's lightweight RTTI */
class CodeMapper::CMAction {
public:
    // types are explicitly encoded as I might later delete a pointed object!
    enum CMActionKind {
        CMAK_BeginOpt, CMAK_AddInst, CMAK_DeleteInst, CMAK_HoistInst,
        CMAK_SinkInst, CMAK_RAUWInst
    };

    CMActionKind getKind() const { return Kind; }

    CMAction(CMActionKind K) : Kind(K) {}

    virtual void apply(StateMap *M,
                        StateMapUpdateInfo* updateInfo,
                        bool verbose = false) = 0;

private:
    const CMActionKind Kind;
};

class CodeMapper::BeginOpt : public CodeMapper::CMAction {
public:
    BeginOpt(const char* name) : CMAction(CMAK_BeginOpt), Name(name) {}

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_BeginOpt;
    }

    void apply(StateMap *M, StateMapUpdateInfo* updateInfo, bool verbose = false) { } // TODO display message

    std::string Name;
};

class CodeMapper::AddInst : public CodeMapper::CMAction {
public:
    AddInst(llvm::Instruction* I): CMAction(CMAK_AddInst), AddedI(I),
            SuccI(findSuccessor(I)) {}

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_AddInst;
    }

    void apply(StateMap *M, StateMapUpdateInfo* updateInfo, bool verbose = false);

    llvm::Instruction* AddedI;
    llvm::Instruction* SuccI;
};

class CodeMapper::DeleteInst : public CodeMapper::CMAction {
public:
    DeleteInst(llvm::Instruction* I): CMAction(CMAK_DeleteInst), DeletedI(I),
            SuccI(findSuccessor(I)) { }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_DeleteInst;
    }

    void apply(StateMap *M, StateMapUpdateInfo* updateInfo, bool verbose = false);

    llvm::Instruction* DeletedI;
    llvm::Instruction* SuccI;
};


class CodeMapper::HoistInst : public CodeMapper::CMAction {
public:
    HoistInst(llvm::Instruction* I, llvm::Instruction* insertPt):
            CMAction(CMAK_HoistInst), HoistedI(I), BeforeI(insertPt),
            SuccHoistedI(findSuccessor(I)) { }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_HoistInst;
    }

    void apply(StateMap *M, StateMapUpdateInfo* updateInfo, bool verbose = false);

    llvm::Instruction* HoistedI;
    llvm::Instruction* BeforeI;
    llvm::Instruction* SuccHoistedI;
};


class CodeMapper::SinkInst : public CodeMapper::CMAction {
public:
    SinkInst(llvm::Instruction* I, llvm::Instruction* insertPt):
            CMAction(CMAK_SinkInst), SunkI(I), BeforeI(insertPt),
            SuccSunkI(findSuccessor(I)) { }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_SinkInst;
    }

    void apply(StateMap *M, StateMapUpdateInfo* updateInfo, bool verbose = false);

    llvm::Instruction* SunkI;
    llvm::Instruction* BeforeI;
    llvm::Instruction* SuccSunkI;
};

class CodeMapper::RAUWInst : public CodeMapper::CMAction {
public:
    enum LLVMValueType { ArgumentTy, ConstantTy, InstructionTy };

    RAUWInst(llvm::Instruction* I,
                    llvm::Value* V,
                    LLVMValueType type,
                    bool alias = true):
            CMAction(CMAK_RAUWInst), I(I), V(V), type(type), alias(alias) {
        isLoadI = llvm::isa<llvm::LoadInst>(I);
        isLoadV = type == InstructionTy ? llvm::isa<llvm::LoadInst>(V) : false;
    }

    static bool classof(const CMAction* CMA) {
        return CMA->getKind() == CMAK_RAUWInst;
    }

    void apply(StateMap *M, StateMapUpdateInfo* updateInfo, bool verbose = false);

    llvm::Instruction* I;
    llvm::Value* V;
    LLVMValueType type;
    bool alias;
    bool isLoadI;
    bool isLoadV;
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