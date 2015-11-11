/* ===============================================================
 * Try to build OSR compensation code automatically.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#ifndef TINYVM_BUILDCOMP_H
#define TINYVM_BUILDCOMP_H

#include "CodeMapper.hpp"
#include "StateMap.hpp"

#include <llvm/Pass.h>
#include <llvm/PassManager.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/Passes.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

#include <set>
#include <string>

class BuildComp {
public:
    static const int numHeuristics = 7;

    enum Heuristic {
        BC_NONE = 0,
        BC_BASE_OPTS,
        BC_ALIASES,
        BC_DEAD_AVAIL,
        BC_DEAD_AVAIL_AND_ALIASES,
        BC_UNSAFE_DEAD_AVAIL,
        BC_UNSAFE_DEAD_AVAIL_AND_ALIASES
    };

    static std::string getDescription(Heuristic opt);

    struct AnalysisData {
        // we compare the base address only
        typedef std::set<llvm::LoadInst*> SafeLoadSet;
        typedef std::pair<SafeLoadSet, SafeLoadSet> InOutSafeLoadSets;
        typedef std::map<llvm::BasicBlock*, InOutSafeLoadSets> SafeLoadsBBMap;
        typedef std::map<llvm::Instruction*, SafeLoadSet> SafeLoadsInstMap;

        llvm::DominatorTree DT;
        std::set<llvm::CallInst*> Calls;
        std::set<llvm::InvokeInst*> Invokes;
        std::set<llvm::LoadInst*> Loads;
        std::set<llvm::LoadInst*> LoadsFromReadOnly;
        std::set<llvm::StoreInst*> Stores;

        SafeLoadsInstMap SafeLoadsMap;

        AnalysisData(llvm::Function* F) {
            assert (F->getParent() != nullptr && "function not in a module");
            llvm::FunctionPassManager FPM(F->getParent());
            FPM.add(llvm::createScalarEvolutionAliasAnalysisPass()); // TODO
            FPM.add(createBuildCompAnalysisPass(this));
            FPM.doInitialization();
            FPM.run(*F);
        }
    };

    static bool buildComp(StateMap *M,
                        llvm::Instruction* OSRSrc,
                        llvm::Instruction* LPad,
                        std::set<llvm::Value*> &keepSet,
                        bool &needPrologue,
                        Heuristic opt = BC_NONE,
                        AnalysisData *BCAD = nullptr,
                        bool updateMapping = true,
                        bool verbose = false);

    static bool isBuildCompRequired(StateMap* M,
                        llvm::Instruction* OSRSrc,
                        llvm::Instruction* LPad,
                        std::set<llvm::Value*> &missingSet,
                        bool verbose = false);

    static void printStatistics(StateMap* M,
                        Heuristic opt = BC_NONE,
                        bool verbose = false);

private:
    static void identifyMissingValues(llvm::Instruction* I,
                    std::map<llvm::Value*, llvm::Value*> &availableValues,
                    std::map<llvm::Value*, llvm::Value*> &extraAvailableValues,
                    std::set<llvm::Value*> &missingValues,
                    Heuristic opt);

    static bool reconstructInst(llvm::Instruction* I,
                    std::map<llvm::Value*, llvm::Value*> &availableValues,
                    std::map<llvm::Value*, llvm::Value*> &extraAvailableValues,
                    std::map<llvm::Instruction*, llvm::Value*> &reconstructedMap,
                    StateMap::CodeSequence* compCodeSequence,
                    std::set<llvm::Value*> &argsForCompCode,
                    Heuristic opt);

    static void computeAvailableAliases(StateMap* M,
                    llvm::Instruction* OSRSrc,
                    AnalysisData* BCAD,
                    CodeMapper::StateMapUpdateInfo* updateInfo,
                    LivenessAnalysis::LiveValues& liveAtOSRSrc,
                    std::map<llvm::Value*, llvm::Value*> &availableValues,
                    std::map<llvm::Value*, llvm::Value*> &extraAvailableValues,
                    Heuristic opt);

    static void computeDeadAvailableValues(StateMap* M,
                    llvm::Instruction* OSRSrc,
                    llvm::Function* src,
                    AnalysisData* BCAD,
                    std::map<llvm::Value*, llvm::Value*> availableValues,
                    std::map<llvm::Value*, llvm::Value*> &extraAvailableValues,
                    Heuristic opt);

    static StateMap::ValueInfo* buildCompCode(llvm::Instruction* instToReconstruct,
                    std::map<llvm::Value*, llvm::Value*> &availableValues,
                    std::map<llvm::Value*, llvm::Value*> &deadAvailableValues,
                    std::set<llvm::Value*> &valuesToKeep,
                    Heuristic opt);

    static bool shouldPerformBaseOpts(Heuristic opt);
    static bool shouldUseAliases(Heuristic opt);
    static bool shouldUseDeadValues(Heuristic opt);
    static bool shouldUseDeadValuesUnsafely(Heuristic opt);

    static llvm::FunctionPass* createBuildCompAnalysisPass(AnalysisData* BCAD);
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