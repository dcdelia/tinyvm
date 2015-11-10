/* ===============================================================
 * Try to build OSR compensation code automatically.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#include "BuildComp.hpp"
#include "Liveness.hpp"
#include "StateMap.hpp"
#include "OptPasses.hpp"

#include <llvm/Pass.h>
#include <llvm/PassAnalysisSupport.h>
#include <llvm/PassManager.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constant.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/Value.h>

#undef NDEBUG
#include <cassert>
#include <algorithm>
#include <map>
#include <iostream>
#include <set>
#include <vector>
#include <llvm/IR/Dominators.h>

using namespace llvm;

void initializeBuildCompAnalysisPass(PassRegistry&);

namespace {
struct BuildCompAnalysis : public FunctionPass {
    static char ID;
    BuildComp::AnalysisData* BCAD;

    BuildCompAnalysis() : FunctionPass(ID) {
        initializeBuildCompAnalysisPass(*PassRegistry::getPassRegistry());
    }

    bool runOnFunction(Function& F) override;

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<DominatorTreeWrapperPass>();
        AU.addRequired<AliasAnalysis>();
    }
};
}

char BuildCompAnalysis::ID = 0;

OSR_INITIALIZE_PASS_BEGIN(BuildCompAnalysis, "BuildCompAnalysis", "[OSR] BuildCompAnalysis", false, false)
OSR_INITIALIZE_PASS_DEPENDENCY(DominatorTreeWrapperPass)
OSR_INITIALIZE_AG_DEPENDENCY(AliasAnalysis);
OSR_INITIALIZE_PASS_END(BuildCompAnalysis, "BuildCompAnalysis", "[OSR] BuildCompAnalysis", false, false)

static void processInstructionsForSafeLoadAnalysis(AliasAnalysis* AA,
        BuildComp::AnalysisData::SafeLoadSet &currentSet,
        BasicBlock::iterator it, const BasicBlock::iterator end,
        BuildComp::AnalysisData::SafeLoadsInstMap &InstMap) {

    #define CHECK_AND_REMOVE_FROM_CUR_OUT(Inst) do \
        for (BuildComp::AnalysisData::SafeLoadSet::iterator \
                aIt = currentSet.begin(), aEnd = currentSet.end(); \
                aIt != aEnd; ) { \
            LoadInst* LI = *aIt; \
            AliasAnalysis::Location Loc = AA->getLocation(LI); \
            if (AA->getModRefInfo(Inst, Loc) & AliasAnalysis::Mod) { \
                currentSet.erase(aIt++); \
            } else { \
                ++aIt; \
            } \
        } while(0)

    for (; it != end; ++it) {
        Instruction* I = &*it;

        InstMap[I] = currentSet; // TODO inefficient, but okay for now...

        // see getLocation() methods from AliasAnalysis.cpp
        if (LoadInst* LI = dyn_cast<LoadInst>(I)) {
            currentSet.insert(LI);
        } else if (StoreInst* SI = dyn_cast<StoreInst>(I)) {
            CHECK_AND_REMOVE_FROM_CUR_OUT(SI);
        } else if (CallInst* CI = dyn_cast<CallInst>(I)) {
            if (!CI->onlyReadsMemory()) {
                currentSet.clear();
            }
        } else if (InvokeInst* II = dyn_cast<InvokeInst>(I)) {
            if (!II->onlyReadsMemory()) {
                currentSet.clear();
            }
        } else if (AtomicCmpXchgInst* AI = dyn_cast<AtomicCmpXchgInst>(I)) {
            CHECK_AND_REMOVE_FROM_CUR_OUT(AI);
        } else if (AtomicRMWInst* AI = dyn_cast<AtomicRMWInst>(I)) {
            CHECK_AND_REMOVE_FROM_CUR_OUT(AI);
        } else if (MemTransferInst* MI = dyn_cast<MemTransferInst>(I)) {
            CHECK_AND_REMOVE_FROM_CUR_OUT(MI);
        } // nothing to do for VAArg and Fence
    }

    #undef CHECK_AND_REMOVE_FROM_CUR_OUT
}

static bool processBlockForSafeLoadAnalysis(BasicBlock* B,
        AliasAnalysis* AA, BuildComp::AnalysisData::SafeLoadsBBMap &BBMap,
        BuildComp::AnalysisData::SafeLoadsInstMap &InstMap,
        const BuildComp::AnalysisData::SafeLoadSet &inSafe,
        BuildComp::AnalysisData::SafeLoadSet &outSafe) {

    BuildComp::AnalysisData::SafeLoadSet curOutSafe = inSafe;

    processInstructionsForSafeLoadAnalysis(AA, curOutSafe, B->begin(),
            B->end(), InstMap);

    bool hasChanged = (curOutSafe != outSafe);

    outSafe = curOutSafe;

    if (!hasChanged) return false;

    for (succ_iterator it = succ_begin(B), end = succ_end(B); it != end; ++it) {
        BuildComp::AnalysisData::SafeLoadSet intersection;
        BuildComp::AnalysisData::SafeLoadSet &succInSet = BBMap[*it].first;
        std::set_intersection(outSafe.begin(), outSafe.end(),
                succInSet.begin(), succInSet.end(),
                std::inserter(intersection, intersection.end()));
        succInSet = intersection;
    }

    return hasChanged;
}

bool BuildCompAnalysis::runOnFunction(Function& F) {
    assert (BCAD != nullptr && "BuildCompAnalysisData uninitialized");

    // alias analysis
    AliasAnalysis *AA = &getAnalysis<AliasAnalysis>();

    // dominance information
    DominatorTree* DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
    BCAD->DT = std::move(*DT);

    // identify loads, stores and function calls
    for (Function::iterator fIt = F.begin(), fEnd = F.end(); fIt != fEnd; ++fIt) {
        BasicBlock* B = &*fIt;
        for (BasicBlock::iterator it = B->begin(), end = B->end(); it != end; ++it) {
            Instruction* I = &*it;
            if (LoadInst* LI = dyn_cast<LoadInst>(I)) {
                BCAD->Loads.insert(LI);
            } else if (StoreInst* SI = dyn_cast<StoreInst>(I)) {
                BCAD->Stores.insert(SI);
            } else if (CallInst* CI = dyn_cast<CallInst>(I)) {
                BCAD->Calls.insert(CI);
            } else if (InvokeInst* II = dyn_cast<InvokeInst>(I))  {
                BCAD->Invokes.insert(II);
            }
        }
    }

    // perform available-Load analysis for memory locations
    BuildComp::AnalysisData::SafeLoadsInstMap &InstMap = BCAD->SafeLoadsMap;

    BuildComp::AnalysisData::SafeLoadsBBMap BBMap;
    Function::BasicBlockListType &blocks = F.getBasicBlockList();

    for (Function::BasicBlockListType::iterator it = blocks.begin(),
            end = blocks.end(); it != end; ++it) {
        BasicBlock *B = &*it;
        BBMap[B] = BuildComp::AnalysisData::InOutSafeLoadSets();
    }

    bool hasChanged;
    do {
        hasChanged = false;
        for (Function::BasicBlockListType::iterator it = blocks.begin(),
                end = blocks.end(); it != end; ++it) { // forward analysis
            BasicBlock* B = &*it;
            BuildComp::AnalysisData::InOutSafeLoadSets &currPair = BBMap[B];

            hasChanged |= processBlockForSafeLoadAnalysis(B, AA, BBMap,
                    InstMap, currPair.first, currPair.second);
        }
    } while (hasChanged);

    return true;
}

FunctionPass* BuildComp::createBuildCompAnalysisPass(BuildComp::AnalysisData* BCAD) {
    BuildCompAnalysis* BCAP = new BuildCompAnalysis();
    BCAP->BCAD = BCAD;
    return BCAP;
}

static void identifyMissingValues(Instruction* I, std::map<Value*, Value*>
        &availableValues, std::map<Value*, Value*> &deadAvailableValues,
        std::set<Value*> &missingValues, BuildComp::Heuristic opt) {
    for (User::op_iterator it = I->op_begin(), end = I->op_end(); it != end;
            ++it) {
        Value* op = *it;

        // OSRLibrary takes care of Constant with fixUsesOfFunctionsAndGlobals()
        if (isa<Constant>(op)) continue;

        if (availableValues.count(op) == 0 && missingValues.count(op) == 0 &&
                deadAvailableValues.count(op) == 0) {
            missingValues.insert(op);
            if (Instruction* opI = dyn_cast<Instruction>(op)) {
                // we don't fetch incoming values for non-constant PHI nodes
                if (PHINode* phi = dyn_cast<PHINode>(opI)) {
                    if (!BuildComp::shouldOptimizeConstantPHI(opt) ||
                        !phi->hasConstantValue()) {
                        continue;
                    }
                }

                identifyMissingValues(opI, availableValues,
                        deadAvailableValues, missingValues, opt);

            }
        }
    }
}


static bool reconstructInst(Instruction* I, std::map<Value*, Value*>
        &availableValues, std::map<Value*, Value*> &deadAvailableValues,
        std::map<Instruction*, Value*> &reconstructedMap,
        StateMap::CodeSequence* compCodeSequence,
        std::set<Value*> &argsForCompCode, BuildComp::Heuristic opt) {

    // TODO heuristics; other instruction types?

    // attempt to reconstruct constant PHI nodes
    if (PHINode* phi = dyn_cast<PHINode>(I)) {
        Value* constV = phi->hasConstantValue();

        if (!constV || !BuildComp::shouldOptimizeConstantPHI(opt)) return false;

        if (Instruction* constI = dyn_cast<Instruction>(constV)) {
            if (reconstructedMap.count(constI) != 0) {
                reconstructedMap[I] = reconstructedMap[constI];
                return true;
            }
        }

        Value* valToUse = nullptr;

        if (availableValues.count(constV) != 0) {
            valToUse = availableValues[constV];
        } else if (deadAvailableValues.count(constV) != 0) {
            valToUse = deadAvailableValues[constV];
        }

        if (valToUse) {
            if (!isa<Constant>(valToUse)) {
                argsForCompCode.insert(valToUse);
            }
            reconstructedMap[I] = valToUse;

            return true;
        }

        return false;
    }

    if (isa<LoadInst>(I)) {
        return false;
    }


    if (CallInst* CI = dyn_cast<CallInst>(I)) {
        if (CI->mayWriteToMemory()) return false;
    }

    if (InvokeInst* II = dyn_cast<InvokeInst>(I)) {
        if (II->mayWriteToMemory()) return false;
    }

    Instruction* RI = I->clone();

    std::map<Value*, Value*>::iterator availIt, deadAvailIt;
    std::map<Value*, Value*>::iterator availEnd = availableValues.end();
    std::map<Value*, Value*>::iterator deadAvailEnd = deadAvailableValues.end();
    std::map<Instruction*, Value*>::iterator recEnd = reconstructedMap.end();
    for (Use &U: RI->operands()) {
        Value* op = U.get();

        if (isa<Constant>(op)) continue;

        availIt = availableValues.find(op);
        if (availIt != availEnd) {
            Value* v = availIt->second;
            U.set(v);
            argsForCompCode.insert(v);
            continue;
        }

        deadAvailIt = deadAvailableValues.find(op);
        if (deadAvailIt != deadAvailEnd) {
            Value* v = deadAvailIt->second;
            U.set(v);
            argsForCompCode.insert(v);
            continue;
        } else {
            assert(!isa<Argument>(op) && "cannot extend liveness of dead arg?");
        }

        if (isa<Argument>(op)) {
            // TODO check option to extend liveness range for a dead argument
            return false;
        }

        if (Instruction* opI = dyn_cast<Instruction>(op)) {
            std::map<Instruction*, Value*>::iterator recIt =
                    reconstructedMap.find(opI);

            assert(recIt != recEnd && "unidentified or not in topological order?");
            U.set(recIt->second);
            continue;
        }

        assert(false && "Metadata operands are unsupported"); // reachable?
        return false;
    }

    if (I->hasName()) {
        RI->setName((I->getName()));
    } else {
        RI->setName("CCtmp");
    }

    reconstructedMap[I] = RI;
    compCodeSequence->push_back(RI);

    return true;
}

static StateMap::ValueInfo* buildCompCode(Instruction* instToReconstruct,
        std::map<Value*, Value*> &availableValues,
        std::map<Value*, Value*> &deadAvailableValues,
        std::set<Value*> &valuesToKeep, BuildComp::Heuristic opt) {

    // sanity checks
    assert(deadAvailableValues.count(instToReconstruct) == 0
            && "attempting to reconstruct a dead available value?");
    assert(!isa<PHINode>(instToReconstruct) && "PHI node not treated earlier?");

    // TODO: other instructions as well?
    if (isa<PHINode>(instToReconstruct) || isa<LoadInst>(instToReconstruct)) {
        // TODO check optimization for LOAD from read-only memory
        valuesToKeep.insert(instToReconstruct);
        return nullptr;
    }

    // identify which values need to be reconstructed
    std::set<Value*> missingValues;
    identifyMissingValues(instToReconstruct, availableValues,
            deadAvailableValues, missingValues, opt);

    std::set<Instruction*> instWorkSet;
    for (Value* v: missingValues) {
        // dead arguments should have already been made available at this stage
        if (isa<Argument>(v)) return nullptr; // TODO insert assertion here

        instWorkSet.insert(cast<Instruction>(v));
    }

    // compute a topological order based on use-def information
    std::vector<Instruction*> sortedInstructions;
    while (!instWorkSet.empty()) {
        for (std::set<Instruction*>::iterator it = instWorkSet.begin(),
                end = instWorkSet.end(); it != end; ) {
            Instruction* I = *it;
            bool canInsert = true;
            for (Use &U: I->operands()) {
                Value* op = U.get();
                if (Instruction* opI = dyn_cast<Instruction>(op)) {
                    // a use of a PHI node by itself is legal LLVM
                    if (opI == I && cast<PHINode>(I)) continue;
                    // we cannot insert an instruction before all the missing
                    // instructions it uses as operands have not been inserted
                    if (instWorkSet.count(opI) != 0) {
                        canInsert = false;
                        break;
                    }
                }
            }
            if (canInsert) {
                sortedInstructions.push_back(I);
                instWorkSet.erase(it++);
            } else {
                ++it;
            }
        }
    }

    // now we can insert the instruction to reconstruct at the end of the list:
    // since we are not reconstructing PHI nodes, instToReconstruct can not
    // appear in missingValues (special case of a PHI node using itself)
    assert(missingValues.count(instToReconstruct) == 0
            && "instruction to reconstruct appear as operand for itself?!?");
    sortedInstructions.push_back(instToReconstruct);

    StateMap::CompCode* compCode = new StateMap::CompCode();
    compCode->args = nullptr;
    compCode->code = new SmallVector<Value*, 8>;

    bool success = true;
    std::map<Instruction*, Value*> reconstructedMap;
    std::set<Value*> argsForCompCode;

    for (Instruction* currInstToReconstruct: sortedInstructions) {
        success &= reconstructInst(currInstToReconstruct, availableValues,
                deadAvailableValues, reconstructedMap, compCode->code,
                argsForCompCode, opt);

        if (!success) break;
    }

    if (success) {
        compCode->value = compCode->code->back();

        // args should be initialized even when no arguments are taken
        compCode->args = new SmallVector<Value*, 4>;
        for (Value* arg: argsForCompCode) {
            compCode->args->push_back(arg);
        }

        return new StateMap::ValueInfo(compCode);
    } else {
        for (StateMap::CodeSequence::iterator it = compCode->code->begin(),
                end = compCode->code->end(); it != end; ++it) {
            delete cast<Instruction>(*it);
        }
        delete compCode->code;
        delete compCode;

        return nullptr;
    }
}

bool BuildComp::isBuildCompRequired(StateMap* M, Instruction* OSRSrc,
        Instruction* LPad, std::set<Value*> &missingSet, bool verbose) {
    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    LivenessAnalysis *LA_src, *LA_dest;

    BasicBlock* OSRSrcBlock = OSRSrc->getParent();
    BasicBlock* LPadBlock = LPad->getParent();
    Function* src = OSRSrcBlock->getParent();
    Function* dest = LPadBlock->getParent();

    if (src == funPair.first) {
        assert (dest == funPair.second && "wrong LocPair or StateMap");
        LA_src = &LAPair.first;
        LA_dest = &LAPair.second;
    } else {
        assert (src == funPair.second && dest == funPair.first
                && "wrong LocPair or StateMap");
        LA_src = &LAPair.second;
        LA_dest = &LAPair.first;
    }

    liveAtOSRSrc = LivenessAnalysis::analyzeLiveInForSeq(OSRSrcBlock,
                LA_src->getLiveOutValues(OSRSrcBlock), OSRSrc, nullptr);
    liveAtLPad = LivenessAnalysis::analyzeLiveInForSeq(LPadBlock,
                LA_dest->getLiveOutValues(LPadBlock), LPad, nullptr);

    // check if for each value to set there is a 1:1 mapping with a live value
    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        Value* oneToOneVal = M->getCorrespondingOneToOneValue(valToSet);
        if (oneToOneVal == nullptr || liveAtOSRSrc.count(oneToOneVal) == 0) {
            missingSet.insert(valToSet);
        }
    }

    bool ret = !missingSet.empty();

    if (verbose && ret) {
        std::cerr << "No live value available to set the following values:"
                  << std::endl;
        for (Value* v: missingSet) {
            v->dump();
        }
    }

    return ret;
}

static void computeAvailableAliases(StateMap* M, Instruction* OSRSrc,
        BuildComp::AnalysisData* BCAD, CodeMapper::StateMapUpdateInfo* updateInfo,
        LivenessAnalysis::LiveValues& liveAtOSRSrc,
        std::map<Value*, Value*> &availableValues,
        std::map<Value*, Value*> &extraAvailableValues,
        BuildComp::Heuristic opt) {
    assert(BCAD != nullptr && "no BuildComp::AnalysisData provided!");
    assert(updateInfo != nullptr && "no CompCode::StateMapUpdateInfo provided!");

    BasicBlock* OSRSrcBB = OSRSrc->getParent();

    DominatorTree &DT = BCAD->DT;
    BuildComp::AnalysisData::SafeLoadSet &safeLoads = BCAD->SafeLoadsMap[OSRSrc];

    for (const std::pair<Value*, std::set<Value*>> &pair:
            updateInfo->RAUWOneToOneAliasInfo) {
        Value* valToSet = pair.first;

        if (availableValues.count(valToSet) > 0 ||
                extraAvailableValues.count(valToSet) > 0) {
            continue;
        }

        for (Value* valToUse: pair.second) {
            // constants are always safe to use
            if (isa<Constant>(valToUse)) { // TODO not sure it can happen
                extraAvailableValues[valToSet] = valToUse;
                break;
            }

            // check live values first
            if (liveAtOSRSrc.count(valToUse) != 0) {
                extraAvailableValues[valToSet] = valToUse;
                break;
            }

            // then try with dead arguments
            if (isa<Argument>(valToUse)) {
                if (BuildComp::shouldIncludeDeadArgs(opt)) {
                    extraAvailableValues[valToSet] = valToUse;
                    break;
                } else if (BuildComp::shouldExtendLiveness(opt)) {
                    extraAvailableValues[valToSet] = valToUse;
                    break;
                }

                continue;
            }

            // at this point we have to check if the Instruction is available
            if (BuildComp::shouldExtendLiveness(opt)) {

                Instruction* instToUse = cast<Instruction>(valToUse);
                BasicBlock* BB = instToUse->getParent();

                if (BB != OSRSrcBB) {
                    if (DT.dominates(BB, OSRSrcBB)) {
                        if (LoadInst* LI = dyn_cast<LoadInst>(instToUse)) {
                            if (!BuildComp::shouldAlwaysExtendLiveness(opt)) {
                                if (safeLoads.count(LI) == 0) continue; // TODO
                            }
                        }

                        extraAvailableValues[valToSet] = valToUse;
                        break;
                    }
                } else {
                    if (instToUse == OSRSrc) continue;

                    if (LoadInst* LI = dyn_cast<LoadInst>(instToUse)) {
                        if (!BuildComp::shouldAlwaysExtendLiveness(opt)) {
                            if (safeLoads.count(LI) == 0) continue; // TODO
                        }
                    }

                    BasicBlock::const_iterator bbIt = BB->begin();
                    for (; &*bbIt != instToUse && &*bbIt != OSRSrc; ++bbIt);
                    if (&*bbIt == instToUse) {
                        extraAvailableValues[valToSet] = valToUse;
                        break;
                    }
                }
            }
        }
    }
}

static void computeAvailableAdditionalOneToOne(StateMap* M,
        Instruction* OSRSrc, BuildComp::AnalysisData* BCAD,
        CodeMapper::StateMapUpdateInfo* updateInfo,
        LivenessAnalysis::LiveValues& liveAtOSRSrc,
        std::map<Value*, Value*> &availableValues,
        std::map<Value*, Value*> &deadAvailableValues,
        BuildComp::Heuristic opt) {

    assert(BCAD != nullptr && "no BuildComp::AnalysisData provided!");
    assert(updateInfo != nullptr && "no CompCode::StateMapUpdateInfo provided!");

    BasicBlock* OSRSrcBB = OSRSrc->getParent();

    DominatorTree &DT = BCAD->DT;
    BuildComp::AnalysisData::SafeLoadSet &safeLoads = BCAD->SafeLoadsMap[OSRSrc];

    int availAdditionalOneToOne = 0;

    for (const std::pair<Instruction*, std::set<Value*>> &pair:
            updateInfo->AdditionalOneToOneValues) {
        Instruction* valToSet = pair.first;

        if (availableValues.count(valToSet) != 0 ||
                deadAvailableValues.count(valToSet) != 0) {
            continue;
        }
        for (Value* valToUse: pair.second) {
            // constants are always safe to use
            if (isa<Constant>(valToUse)) {
                availableValues[valToSet] = valToUse;
                //std::cerr << "SUCCESS 1" << std::endl;
                ++availAdditionalOneToOne;
                break;
            }

            // check live values first
            if (liveAtOSRSrc.count(valToUse) != 0) {
                availableValues[valToSet] = valToUse;
                //std::cerr << "SUCCESS 2" << std::endl;
                ++availAdditionalOneToOne;
                break;
            }

            // then try with arguments
            if (isa<Argument>(valToUse)) {
                if (BuildComp::shouldIncludeDeadArgs(opt)) {
                    availableValues[valToSet] = valToUse;
                    //std::cerr << "SUCCESS 3" << std::endl;
                    ++availAdditionalOneToOne;
                    break;
                } else if (BuildComp::shouldExtendLiveness(opt)) {
                    deadAvailableValues[valToSet] = valToUse;
                    //std::cerr << "SUCCESS 4" << std::endl;
                    ++availAdditionalOneToOne;
                    break;
                }

                continue;
            }

            // at this point we can only check if an Instruction is available
            if (BuildComp::shouldExtendLiveness(opt)) {

                Instruction* instToUse = cast<Instruction>(valToUse);
                BasicBlock* BB = instToUse->getParent();

                if (BB != OSRSrcBB) {
                    if (DT.dominates(BB, OSRSrcBB)) {
                        if (LoadInst* LI = dyn_cast<LoadInst>(instToUse)) {
                            if (!BuildComp::shouldAlwaysExtendLiveness(opt)) {
                                if (safeLoads.count(LI) == 0) continue;
                            }
                        }
                        deadAvailableValues[valToSet] = valToUse;
                        //std::cerr << "SUCCESS 5" << std::endl;
                        ++availAdditionalOneToOne;
                    }
                } else {
                    if (instToUse == OSRSrc) continue;
                    if (LoadInst* LI = dyn_cast<LoadInst>(instToUse)) {
                        if (!BuildComp::shouldAlwaysExtendLiveness(opt)) {
                            if (safeLoads.count(LI) == 0) continue;
                        }
                    }
                    BasicBlock::const_iterator bbIt = BB->begin();
                    for (; &*bbIt != instToUse && &*bbIt != OSRSrc; ++bbIt);
                    if (&*bbIt == instToUse) {
                        deadAvailableValues[valToSet] = valToUse;
                        //std::cerr << "SUCCESS 6" << std::endl;
                        ++availAdditionalOneToOne;
                    }
                }
            }
        }
    }

    if (availAdditionalOneToOne) {
        std::cerr << "Available additional 1:1 values: " << availAdditionalOneToOne
                  << std::endl;
    }

}

static void computeDeadAvailableValues(StateMap* M, Instruction* OSRSrc,
        Function* src, BuildComp::AnalysisData* BCAD,
        std::map<Value*, Value*> availableValues,
        std::map<Value*, Value*> &extraAvailableValues,
        BuildComp::Heuristic opt) {

    assert(BCAD != nullptr && "no BuildComp::AnalysisData provided!");

    BasicBlock* OSRSrcBB = OSRSrc->getParent();

    DominatorTree &DT = BCAD->DT;
    BuildComp::AnalysisData::SafeLoadSet &safeLoads = BCAD->SafeLoadsMap[OSRSrc];

    StateMap::OneToOneValueMap &map = M->getAllCorrespondingOneToOneValues();
    for (StateMap::OneToOneValueMap::iterator it = map.begin(), end = map.end();
        it != end; ++it) {
        Value* valToSet = it->first;
        Value* valToUse = it->second;

        if (availableValues.count(valToSet) > 0) continue;

        if (Instruction* I = dyn_cast<Instruction>(valToSet)) {
            if (I->getParent()->getParent() == src) continue;
        } else if (Argument* A = dyn_cast<Argument>(valToSet)) {
            if (A->getParent() == src) continue;
        } else {
            assert(false && "Constant appears as key in the 1:1 map!");
            continue;
        }

        if (Instruction* instToUse = dyn_cast<Instruction>(valToUse)) {
            // TODO skip more cases
            if (isa<TerminatorInst>(instToUse) || isa<StoreInst>(instToUse)) {
                continue;
            }

            BasicBlock* BB = instToUse->getParent();

            if (BB != OSRSrcBB) {
                if (DT.dominates(BB, OSRSrcBB)) {
                    if (LoadInst* LI = dyn_cast<LoadInst>(instToUse)) {
                        if (!BuildComp::shouldAlwaysExtendLiveness(opt)) {
                            if (safeLoads.count(LI) == 0) continue;
                        }
                    }

                    extraAvailableValues[valToSet] = valToUse;
                }
            } else {
                if (instToUse == OSRSrc) continue;

                if (LoadInst* LI = dyn_cast<LoadInst>(instToUse)) {
                    if (!BuildComp::shouldAlwaysExtendLiveness(opt)) {
                        if (safeLoads.count(LI) == 0) continue;
                    }
                }

                BasicBlock::const_iterator bbIt = BB->begin();
                for (; &*bbIt != instToUse && &*bbIt != OSRSrc; ++bbIt);
                if (&*bbIt == instToUse) {
                    extraAvailableValues[valToSet] = valToUse;
                }
            }
        } else {
            assert(isa<Argument>(valToUse));
            assert(!BuildComp::shouldIncludeDeadArgs(opt)
                    && "Missed dead argument?");

            extraAvailableValues[valToSet] = valToUse;
        }
    }
}

bool BuildComp::buildComp(StateMap *M, Instruction* OSRSrc, Instruction* LPad,
        std::set<Value*> &keepSet, BuildComp::Heuristic opt,
        BuildComp::AnalysisData* BCAD, bool updateMapping, bool verbose) {

    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    LivenessAnalysis *LA_src, *LA_dest;

    BasicBlock* OSRSrcBlock = OSRSrc->getParent();
    BasicBlock* LPadBlock = LPad->getParent();
    Function* src = OSRSrcBlock->getParent();
    Function* dest = LPadBlock->getParent();

    if (src == funPair.first) {
        assert (dest == funPair.second && "wrong LocPair or StateMap");
        LA_src = &LAPair.first;
        LA_dest = &LAPair.second;
    } else {
        assert (src == funPair.second && dest == funPair.first
                && "wrong LocPair or StateMap");
        LA_src = &LAPair.second;
        LA_dest = &LAPair.first;
    }

    liveAtOSRSrc = LivenessAnalysis::analyzeLiveInForSeq(OSRSrcBlock,
                LA_src->getLiveOutValues(OSRSrcBlock), OSRSrc, nullptr);
    liveAtLPad = LivenessAnalysis::analyzeLiveInForSeq(LPadBlock,
                LA_dest->getLiveOutValues(LPadBlock), LPad, nullptr);

    CodeMapper* dest_CM = CodeMapper::getCodeMapper(*dest);
    CodeMapper::StateMapUpdateInfo *updateInfo = nullptr;
    if (dest_CM) {
        updateInfo = dest_CM->getStateMapUpdateInfo(M);
    }

    std::vector<Value*> workList; // instructions to reconstruct
    std::map<Value*, Value*> availableValues; // available values
    std::map<Value*, Value*> extraAvailableValues; // will populate it later...

    // Build the set of available values. Note that a live value not mapped to
    // a valToSet from liveAtLPad might come in handy later when we might have
    // to reconstruct some instruction
    StateMap::OneToOneValueMap &OOMap = M->getAllCorrespondingOneToOneValues();
    for (StateMap::OneToOneValueMap::iterator it = OOMap.begin(),
            end = OOMap.end(); it != end; ++it) {
        Value* valToSet = it->first;
        Value* valToUse = it->second;

        // skip valToSet if it belongs to src
        if (Instruction* I = dyn_cast<Instruction>(valToSet)) {
            if (I->getParent()->getParent() == src) continue;
        } else if (Argument* A = dyn_cast<Argument>(valToSet)) {
            if (A->getParent() == src) continue;
        } else {
            assert(false && "Constant appears as key in the 1:1 map!");
            continue;
        }

        if (isa<Constant>(valToUse) || liveAtOSRSrc.count(valToUse) > 0) {
            availableValues[valToSet] = valToUse;
            continue;
        }

        if (shouldIncludeDeadArgs(opt) && isa<Argument>(valToUse)) {
            availableValues[valToSet] = valToUse;
            continue;
        }
    }

    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        if (availableValues.count(valToSet) == 0) {
            workList.push_back(valToSet);
        }
    }

    if (workList.empty()) return true;

    if (shouldExtendLiveness(opt)) {
        computeDeadAvailableValues(M, OSRSrc, src, BCAD, availableValues,
                extraAvailableValues, opt);
    }

    if (shouldUseAdditionalOneToOneInfo(opt) && updateInfo) {
        /*computeAvailableAdditionalOneToOne(M, OSRSrc, BCAD, updateInfo,
                liveAtOSRSrc, availableValues, additionalAvailableValues, opt);*/
        computeAvailableAliases(M, OSRSrc, BCAD, updateInfo,
                liveAtOSRSrc, availableValues, extraAvailableValues, opt);
    }

    StateMap::LocPairInfo::ValueInfoMap valueInfoMap;
    std::set<Value*> curValuesToKeep;
    bool error = false;

    for (Value* valToReconstruct: workList) {
        if (availableValues.count(valToReconstruct) > 0) {
            std::cerr << "DUDE!!!" << std::endl;
        }

        if (extraAvailableValues.count(valToReconstruct) > 0) {
            Value* valToUse = extraAvailableValues[valToReconstruct];
            StateMap::ValueInfo* valInfo = new StateMap::ValueInfo(valToUse);
            valueInfoMap[valToReconstruct] = valInfo;

            continue;
        }

        if (PHINode* phi = dyn_cast<PHINode>(valToReconstruct)) {
            Value* valToUse = nullptr;

            // constant PHI nodes can be treated as a special case
            Value* constV = nullptr;

            if (shouldOptimizeConstantPHI(opt)) {
                constV = phi->hasConstantValue();
                if (constV) {
                    if (availableValues.count(constV) != 0) {
                        valToUse = availableValues[constV];
                    } else if (extraAvailableValues.count(constV) != 0) {
                        valToUse = extraAvailableValues[constV];
                    }
                }
            }

            if (!valToUse) {
                error = true;
                // TODO: constV would yield more accurate info, but we can let
                // the client inspect phi to see whether hasConstantValue()
                keepSet.insert(phi);
            } else {
                StateMap::ValueInfo* valInfo = new StateMap::ValueInfo(valToUse);
                valueInfoMap[valToReconstruct] = valInfo;
            }

            continue;
        }

        if (Instruction* I = dyn_cast<Instruction>(valToReconstruct)) {
            StateMap::ValueInfo* valInfo = buildCompCode(I, availableValues,
                    extraAvailableValues, curValuesToKeep, opt);
            if (valInfo == nullptr) {
                error = true;
                keepSet.insert(curValuesToKeep.begin(), curValuesToKeep.end());
                curValuesToKeep.clear();
            } else {
                valueInfoMap[valToReconstruct] = valInfo;
            }

            continue;
        }

        error = true;
        keepSet.insert(valToReconstruct);
    }

    assert( (error || keepSet.empty()) && "non-empty keepSet on success?");

    if (error || !updateMapping) {
        // avoid memory leaks
        for (StateMap::LocPairInfo::ValueInfoMap::iterator it = valueInfoMap.begin(),
                end = valueInfoMap.end(); it != end; ++it) {
            delete it->second;
        }
    } else {
        StateMap::LocPair LP(OSRSrc, LPad);
        assert(M->getLocPairInfo(LP) == nullptr && "LocPairInfo alread exists");
        StateMap::LocPairInfo* LPInfo = M->createLocPairInfo(LP);
        LPInfo->valueInfoMap = std::move(valueInfoMap);
    }

    return !error;
}

void BuildComp::printStatistics(StateMap* M, BuildComp::Heuristic opt,
        bool verbose) {
    std::pair<Function*, Function*> funPair = M->getFunctions();
    Function* F1 = funPair.first;
    Function* F2 = funPair.second;
    std::string F1Name = F1->getName().str();
    std::string F2Name = F2->getName().str();

    int oneToOneValuesForF1 = 0, oneToOneValuesForF2 = 0;
    int OSRSourcesInF1 = 0, OSRSourcesInF2 = 0;
    int buildCompRequiredInF1 = 0, buildCompRequiredInF2 = 0;
    int buildCompFailsInF1 = 0, buildCompFailsInF2 = 0;

    StateMap::LocMap &landingPadMap = M->getAllLandingPads();
    StateMap::OneToOneValueMap &defaultOneToOneValueMap =
            M->getAllCorrespondingOneToOneValues();

    for (StateMap::OneToOneValueMap::iterator it = defaultOneToOneValueMap.begin(),
            end = defaultOneToOneValueMap.end(); it != end; ++it) {
        Value* v = it->first;
        if (Instruction* I = dyn_cast<Instruction>(v)) {
            Function* F = I->getParent()->getParent();
            if (F == F1) {
                ++oneToOneValuesForF1;
            } else {
                assert (F == F2 && "Instruction from unknown function");
                ++oneToOneValuesForF2;
            }
        } else if (Argument* A = dyn_cast<Argument>(v)) {
            Function* F = A->getParent();
            if (F == F1) {
                ++oneToOneValuesForF1;
            } else {
                assert (F == F2 && "Argument from unknown function");
                ++oneToOneValuesForF2;
            }
        } else if (Constant* C = dyn_cast<Constant>(v)) {
            // TODO
        }
    }

    std::set<Value*> keepSet;
    std::set<Value*> missingSet;
    for (StateMap::LocMap::iterator it = landingPadMap.begin(),
            end = landingPadMap.end(); it != end; ++it) {
        Instruction* OSRSrc = it->first;
        if (isa<PHINode>(OSRSrc)) continue;
        Instruction* LPad = it->second;
        Function* F = OSRSrc->getParent()->getParent();
        assert ( (F == F1 || F == F2) && "OSRSrc from unknown function");
        bool bcReq = BuildComp::isBuildCompRequired(M, OSRSrc, LPad, missingSet,
                verbose);
        bool bcFails = false;
        if (bcReq) {
            missingSet.clear();
            bcFails = !BuildComp::buildComp(M, OSRSrc, LPad, keepSet,
                    BuildComp::Heuristic::BC_NONE, nullptr, false, verbose); // TODO!!!
            keepSet.clear();
        }
        if (F == F1) {
            ++OSRSourcesInF1;
            if (bcReq) {
                ++buildCompRequiredInF1;
                if (bcFails) {
                    ++buildCompFailsInF1;
                }
            }
        } else {
            ++OSRSourcesInF2;
            if (bcReq) {
                ++buildCompRequiredInF2;
                if (bcFails) {
                    ++buildCompFailsInF2;
                }
            }
        }
    }

    std::cerr << "<" << F1Name << ">" << std::endl;
    std::cerr << "- " << oneToOneValuesForF1 << " values for which there is a "
              << "1:1 corresponding value" << std::endl;
    std::cerr << "- " << OSRSourcesInF1 << " candidate OSRSrc locations"
              << std::endl;
    std::cerr << "- " << buildCompRequiredInF1 << " OSRSrc locations for which "
              << "a compensation code is required" << std::endl;
    std::cerr << "- " << buildCompFailsInF1 << " OSRSrc locations for which a "
              << "compensation code cannot be built automatically" << std::endl;

    std::cerr << "<" << F2Name << ">" << std::endl;
    std::cerr << "- " << oneToOneValuesForF2 << " values for which there is a "
              << "1:1 corresponding value" << std::endl;
    std::cerr << "- " << OSRSourcesInF2 << " candidate OSRSrc locations"
              << std::endl;
    std::cerr << "- " << buildCompRequiredInF2 << " OSRSrc locations for which "
              << "a compensation code is required" << std::endl;
    std::cerr << "- " << buildCompFailsInF2 << " OSRSrc locations for which a "
              << "compensation code cannot be built automatically" << std::endl;
}


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