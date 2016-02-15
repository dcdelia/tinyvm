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

    typedef std::map<llvm::Value*, llvm::Value*> ValueMap;
    typedef std::set<llvm::Value*> ValueSet;
    typedef std::set<llvm::Instruction*> InstrSet;

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

    struct Statistics {
        // set of values that should have been preserved to enable OSR
        ValueSet keepSet;

        // flag to indicate whether instructions should be reconstructed (true)
        // or local 1:1 mapping information is sufficient for OSR (false)
        bool needPrologue = false;

        // set of reconstructed instructions
        InstrSet reconstructSet;

        // operands used in a compensation code can be divided in: live values,
        // live available alias, dead values (includes dead available aliases as
        // well), and previously reconstructed instructions
        ValueSet liveValues, liveAliases, deadValues;

        // to reuse the object across multiple reconstruction steps
        void reset() {
            keepSet.clear();
            reconstructSet.clear();
            liveValues.clear();
            liveAliases.clear();
            deadValues.clear();
        }
    };

    static bool buildComp(StateMap* M,
                        llvm::Instruction* OSRSrc,
                        llvm::Instruction* LPad,
                        Heuristic opts,
                        Statistics &stats,
                        AnalysisData* src_BCAD,
                        BuildComp::AnalysisData* dest_BCAD,
                        bool updateMapping = false,
                        bool verbose = false);

    static bool buildComp(StateMap *M,
                        llvm::Instruction* OSRSrc,
                        llvm::Instruction* LPad,
                        std::set<llvm::Value*> &keepSet,
                        std::set<llvm::Instruction*> &recSet,
                        bool &needPrologue,
                        Heuristic opt = BC_NONE,
                        AnalysisData *BCAD_src = nullptr,
                        AnalysisData *BCAD_dest = nullptr,
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
    static llvm::FunctionPass* createBuildCompAnalysisPass(AnalysisData* BCAD);

    static void computeAvailableValues(StateMap* M,
                    llvm::Function* src,
                    LivenessAnalysis::LiveValues &liveAtOSRSrc,
                    Heuristic opts,
                    ValueMap &availMap);

    static void computeAvailableAliases(StateMap* M,
                    llvm::Instruction* OSRSrc,
                    AnalysisData* BCAD,
                    CodeMapper::OneToManyAliasMap &aliasInfoMap,
                    LivenessAnalysis::LiveValues& liveAtOSRSrc,
                    ValueMap &availMap,
                    ValueMap &liveAliasMap,
                    ValueMap &deadAvailMap,
                    Heuristic opts);

    static bool isDeadInstructionAvailable(llvm::Instruction* DI,
                    llvm::Instruction* I,
                    llvm::DominatorTree &DT,
                    AnalysisData::SafeLoadSet &safeLoads,
                    bool useOnlySafeLoads);

    static void computeDeadAvailableValues(StateMap* M,
                    llvm::Instruction* OSRSrc,
                    llvm::Function* src,
                    AnalysisData* BCAD,
                    ValueMap &availMap,
                    ValueMap &deadAvailMap,
                    Heuristic opts);

    static bool canAttemptToReconstruct(llvm::Instruction* I,
                    Heuristic opt);

    static StateMap::CompCode* buildCompCode(llvm::Instruction* instToReconstruct,
                    std::vector<llvm::Instruction*> &recList,
                    ValueMap &availMap,
                    ValueMap &liveAliasMap,
                    ValueMap &deadAvailMap,
                    Statistics &stats,
                    Heuristic opts);

    static bool reconstructValue(llvm::Value* V,
                    ValueMap &availMap,
                    ValueMap &liveAliasMap,
                    ValueMap &deadAvailMap,
                    Heuristic opt,
                    std::vector<llvm::Instruction*> &recList,
                    std::set<llvm::Value*> *keepSet);

    static bool canDoBasicOpts(Heuristic opt);
    static bool canUseAliases(Heuristic opt);
    static bool canUseDeadValues(Heuristic opt);
    static bool canUseAllDeadValues(Heuristic opt);
    static bool shouldNotPreferDeadValues(Heuristic opt);
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