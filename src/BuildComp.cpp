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

// attempt to recursively reconstruct LCSSA PHI nodes
#define RECONSTRUCT_LCSSA       1

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

std::string BuildComp::getDescription(Heuristic opt) {
    std::string desc;

    switch (opt) {
        case BC_NONE:
            desc = "Naive version of the BuildComp algorithm";
            break;
        case BC_BASE_OPTS:
            desc = "Basic optimizations (constant PHI nodes, dead arguments)";
            break;
        case BC_ALIASES:
            desc = "Basic opts + RAUW aliasing";
            break;
        case BC_DEAD_AVAIL:
            desc = "Basic opts + dead available values";
            break;
        case BC_DEAD_AVAIL_AND_ALIASES:
            desc = "Basic opts + dead available values + RAUW aliasing";
            break;
        case BC_UNSAFE_DEAD_AVAIL:
            desc = "Basic opts + (unsafe) dead available values";
            break;
        case BC_UNSAFE_DEAD_AVAIL_AND_ALIASES:
            desc = "Basic opts + (unsafe) dead available values + RAUW aliasing";
            break;
        default:
            desc = "Unknown strategy";
    }

    return desc;
}

bool BuildComp::canDoBasicOpts(BuildComp::Heuristic opt) {
    return opt != BC_NONE;
}

bool BuildComp::canUseAliases(Heuristic opt) {
    switch (opt) {
        case BC_ALIASES:
        case BC_DEAD_AVAIL_AND_ALIASES:
        case BC_UNSAFE_DEAD_AVAIL_AND_ALIASES:
            return true;
        default:
            return false;
    }
}

bool BuildComp::canUseDeadValues(Heuristic opt) {
    switch (opt) {
        case  BC_DEAD_AVAIL:
        case  BC_DEAD_AVAIL_AND_ALIASES:
        case  BC_UNSAFE_DEAD_AVAIL:
        case BC_UNSAFE_DEAD_AVAIL_AND_ALIASES:
            return true;
        default:
            return false;
    }
}

bool BuildComp::canUseAllDeadValues(Heuristic opt) {
    switch (opt) {
        case  BC_UNSAFE_DEAD_AVAIL:
        case BC_UNSAFE_DEAD_AVAIL_AND_ALIASES:
            return true;
        default:
            return false;
    }
}

bool BuildComp::shouldNotPreferDeadValues(Heuristic opt) {
    return true;
}

CodeMapper::OneToManyAliasMap BuildComp::genAliasInfoMap(
        CodeMapper::StateMapUpdateInfo* src_updateInfo,
        CodeMapper::StateMapUpdateInfo* dest_updateInfo) {

    CodeMapper::OneToManyAliasMap map;

    // create keys first
    if (src_updateInfo) {
        for (const std::pair<Value*, std::set<Value*>> &pair:
                src_updateInfo->RAUWAliasInfo) {
            for (Value* v: pair.second) { // each value is a key for map
                if (map.count(v) == 0) {
                    map.insert(std::pair<Value*, std::set<Value*>>(v, {}));
                }
            }
        }
    }

    if (dest_updateInfo) {
        for (const std::pair<Value*, std::set<Value*>> &pair:
                dest_updateInfo->RAUWAliasInfo) {
            if (map.count(pair.first) == 0) {
                map.insert(std::pair<Value*, std::set<Value*>>(pair.first, {}));
            }
        }
    }

    // then fill the map
    if (src_updateInfo) {
        for (const std::pair<Value*, std::set<Value*>> &pair:
                src_updateInfo->RAUWAliasInfo) {
            for (Value* v: pair.second) {
                map[v].insert(pair.first);
            }
        }
    }

    if (dest_updateInfo) {
        for (const std::pair<Value*, std::set<Value*>> &pair:
                dest_updateInfo->RAUWAliasInfo) {
            for (Value* v: pair.second) {
                map[pair.first].insert(v);
            }
        }
    }

    return map;
}

void BuildComp::computeAvailableAliases(StateMap* M, Instruction* OSRSrc,
        BuildComp::AnalysisData* BCAD,
        CodeMapper::OneToManyAliasMap &aliasInfoMap,
        LivenessAnalysis::LiveValues& liveAtOSRSrc,
        BuildComp::ValueMap &availMap, BuildComp::ValueMap &liveAliasMap,
        BuildComp::ValueMap &deadAvailMap, BuildComp::Heuristic opts) {
    assert(BCAD != nullptr && "no BuildComp::AnalysisData provided!");

    DominatorTree &DT = BCAD->DT;
    AnalysisData::SafeLoadSet &safeLoads = BCAD->SafeLoadsMap[OSRSrc];

    bool useOnlySafeLoads = false;

    for (const std::pair<Value*, std::set<Value*>> &pair: aliasInfoMap) {
        Value* valToSet = pair.first;

        // if a value is already available, no need to use an alias for it
        if (availMap.count(valToSet) > 0) continue;

        // unless we do not care about register pressure, we give it a try!
        if (!shouldNotPreferDeadValues(opts) && deadAvailMap.count(valToSet) > 0) continue;

        // iterate over all possible aliases until a working one is found
        for (Value* valToUse: pair.second) {
            // constants are always safe to use (TODO: may this ever happen?)
            if (isa<Constant>(valToUse)) {
                liveAliasMap[valToSet] = valToUse;
                break;
            }

            // check if the alias is live
            if (liveAtOSRSrc.count(valToUse) != 0) {
                liveAliasMap[valToSet] = valToUse;
                break;
            }

            // for the time being, we assume that dead arguments can be seen as
            // available values (things may change in an inlining scenario?)
            if (isa<Argument>(valToUse)) {
                liveAliasMap[valToSet] = valToUse;
                break;
            }

            // at this point we have to check if the Instruction is available
            if (canUseDeadValues(opts) && !shouldNotPreferDeadValues(opts)) {
                Instruction* I = cast<Instruction>(valToUse);

                if (isDeadInstructionAvailable(I, OSRSrc, DT, safeLoads,
                        useOnlySafeLoads)) {
                    deadAvailMap[valToSet] = valToUse;
                    break;
                }
            }
        }

        // a second scan is needed when we want to keep register pressure low
        if (canUseDeadValues(opts) && shouldNotPreferDeadValues(opts)) {
            if (deadAvailMap.count(valToSet) > 0) continue;

            for (Value* valToUse: pair.second) {
                if (Instruction* I = dyn_cast<Instruction>(valToUse)) {
                    if (isDeadInstructionAvailable(I, OSRSrc, DT, safeLoads,
                            useOnlySafeLoads)) {
                        deadAvailMap[valToSet] = valToUse;
                        break;
                    }
                }
            }
        }
    }
}

bool BuildComp::isDeadInstructionAvailable(Instruction* DI, Instruction* I,
        DominatorTree &DT, BuildComp::AnalysisData::SafeLoadSet &safeLoads,
        bool useOnlySafeLoads) {

    if (DI == I || isa<TerminatorInst>(DI) || isa<StoreInst>(DI)) {
        return false;
    }

    BasicBlock* blockForDI = DI->getParent();
    BasicBlock* blockForI = I->getParent();

    if (LoadInst* DLI = dyn_cast<LoadInst>(DI)) {
        if (useOnlySafeLoads) {
            if (safeLoads.count(DLI) == 0) return false;
        }
    }

    if (blockForI != blockForDI) {
        return DT.dominates(blockForDI, blockForI);
    } else {
        BasicBlock::const_iterator bbIt = blockForI->begin();
        for (; &*bbIt != DI && &*bbIt != I; ++bbIt);
        return (&*bbIt == DI);
    }
}

void BuildComp::computeDeadAvailableValues(StateMap* M, Instruction* OSRSrc,
        Function* src, BuildComp::AnalysisData* BCAD,
        BuildComp::ValueMap &availMap, BuildComp::ValueMap &deadAvailMap,
        BuildComp::Heuristic opts) {

    bool useOnlySafeLoads = !canUseAllDeadValues(opts);

    assert(BCAD != nullptr && "no BuildComp::AnalysisData provided!");

    DominatorTree &DT = BCAD->DT;
    AnalysisData::SafeLoadSet &safeLoads = BCAD->SafeLoadsMap[OSRSrc];

    StateMap::OneToOneValueMap &map = M->getAllCorrespondingOneToOneValues();
    for (StateMap::OneToOneValueMap::iterator it = map.begin(), end = map.end();
        it != end; ++it) {
        Value* valToSet = it->first;
        Value* valToUse = it->second;

        if (availMap.count(valToSet) > 0) continue;

        if (Instruction* I = dyn_cast<Instruction>(valToSet)) {
            if (I->getParent()->getParent() == src) continue;
        } else if (Argument* A = dyn_cast<Argument>(valToSet)) {
            if (A->getParent() == src) continue;
        } else {
            assert(!isa<Constant>(valToSet) && "Constant appears as key in the 1:1 map!");
            assert(false && "Referencing a deleted Value! Buggy optimizations?");
            continue;
        }

        if (Instruction* instToUse = dyn_cast<Instruction>(valToUse)) {
            if (isDeadInstructionAvailable(instToUse, OSRSrc, DT, safeLoads,
                    useOnlySafeLoads)) {
                deadAvailMap[valToSet] = valToUse;
            }
        } else {
            assert(isa<Argument>(valToUse));
            assert(!canDoBasicOpts(opts) && "Missed dead argument?");

            deadAvailMap[valToSet] = valToUse;
        }
    }
}

// build the set of available values at the OSRSrc
void BuildComp::computeAvailableValues(StateMap* M, Function* src,
        LivenessAnalysis::LiveValues &liveAtOSRSrc,
        BuildComp::Heuristic opts, BuildComp::ValueMap &availMap) {
    // Note that a live value not mapped to a valToSet from liveAtLPad might
    // come in handy later (we may need it to reconstruct an instruction!)
    StateMap::OneToOneValueMap &OOMap = M->getAllCorrespondingOneToOneValues();
    for (StateMap::OneToOneValueMap::iterator it = OOMap.begin(),
            end = OOMap.end(); it != end; ++it) {
        Value* valToSet = it->first;
        Value* valToUse = it->second;

        // skip valToSet if it belongs to src: our focus is the target function
        if (Instruction* I = dyn_cast<Instruction>(valToSet)) {
            if (I->getParent()->getParent() == src) continue;
        } else if (Argument* A = dyn_cast<Argument>(valToSet)) {
            if (A->getParent() == src) continue;
        } else {
            assert(!isa<Constant>(valToSet) && "Constant appears as key in the 1:1 map!");
            assert(false && "Referencing a deleted Value! Buggy optimizations?");
            continue;
        }

        // constants and live variables are obviously available
        if (isa<Constant>(valToUse) || liveAtOSRSrc.count(valToUse) > 0) {
            availMap[valToSet] = valToUse;
            continue;
        }

        // basic optimization: arguments are never modified, thus are available
        if (canDoBasicOpts(opts) && isa<Argument>(valToUse)) {
            availMap[valToSet] = valToUse;
            continue;
        }
    }
}

#if RECONSTRUCT_LCSSA
// helper method for isPHINodeConstant()
static Value* isPHINodeConstantAux(PHINode* PN, std::set<PHINode*> &workSet,
        std::set<PHINode*> *aliasSet) {

    // base step
    Value* constV = PN->hasConstantValue();
    if (constV) return constV;

    // to avoid infinite loops
    std::pair<std::set<PHINode*>::iterator, bool> ret = workSet.insert(PN);
    if (!ret.second) return nullptr;

    // recursive step
    for (int i = 0, n = PN->getNumIncomingValues(); i < n; ++i) {
        // get incoming value
        Value* op = PN->getIncomingValue(i);

        // it can be either a PHI node or a regular value
        if (PHINode* opPN = dyn_cast<PHINode>(op)) {
            Value* tmp = isPHINodeConstantAux(opPN, workSet, aliasSet);

            // just to simplify code structure
            if (!constV) constV = tmp;

            // fail if non-constant or different than constV
            if (!tmp || (constV && constV != tmp)) {
                if (aliasSet) aliasSet->clear();
                return nullptr;
            }

            if (aliasSet) aliasSet->insert(opPN);
        } else {
            if (constV) {
                if (op != constV) {
                    if (aliasSet) aliasSet->clear();
                    return nullptr;
                }
            } else {
                constV = op;
            }
        }
    }

    workSet.erase(ret.first);
    assert(constV && "isPHINodeConstantAux() is buggy?");

    return constV;
}

// we improve LLVM's PHINode::hasConstantValue() to capture more cases (e.g.,
// PHI nodes inserted during LCSSA form construction)
Value* BuildComp::isPHINodeConstant(PHINode* PN, std::set<PHINode*> *aliasSet) {
    std::set<PHINode*> workSet;

    Value* constV = isPHINodeConstantAux(PN, workSet, aliasSet);
    assert( (!constV || workSet.empty()) && "non-empty workSet on success");

    return constV;
}
#else
static Value* isPHINodeConstant(PHINode* PN, std::set<PHINode*> *aliasSet = nullptr) {
    return PN->hasConstantValue();
}
#endif

bool BuildComp::canAttemptToReconstruct(Instruction* I, BuildComp::Heuristic opt) {
    // reconstruct invoke/call instructions only when to read-only functions
    if (CallInst* CI = dyn_cast<CallInst>(I)) {
        if (CI->mayWriteToMemory()) return false;
    }
    if (InvokeInst* II = dyn_cast<InvokeInst>(I)) {
        if (II->mayWriteToMemory()) return false;
    }

    // TODO probably we can do better than this!
    if (isa<LoadInst>(I)) return false;

    // try to reconstruct PHI nodes when possible
    if (PHINode* PN = dyn_cast<PHINode>(I)) {
        return canDoBasicOpts(opt) && isPHINodeConstant(PN, nullptr);
    }

    return true;
}

Value* BuildComp::isAliasAvailableForConstantPHI(Value* constV,
        std::set<PHINode*> *aliasSet, BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap, BuildComp::ValueMap &deadAvailMap,
        bool canUseDeadAvailable) {

    BuildComp::ValueMap::iterator availEnd = availMap.end();
    BuildComp::ValueMap::iterator liveAliasEnd = liveAliasMap.end();
    BuildComp::ValueMap::iterator deadAvailEnd = deadAvailMap.end();

    BuildComp::ValueMap::iterator VMIt;

    // process constV first
    if ( (VMIt = availMap.find(constV)) != availEnd) return VMIt->second;
    if ( (VMIt = liveAliasMap.find(constV)) != liveAliasEnd) return VMIt->second;

    for (PHINode* PN: *aliasSet) {
        if ( (VMIt = availMap.find(PN)) != availEnd) return VMIt->second;
        if ( (VMIt = liveAliasMap.find(PN)) != liveAliasEnd) return VMIt->second;
    }

    if (canUseDeadAvailable) {
        if ( (VMIt = deadAvailMap.find(constV)) != deadAvailEnd)
            return VMIt->second;
        for (PHINode* PN: *aliasSet) {
            if ( (VMIt = deadAvailMap.find(PN)) != deadAvailEnd)
                return VMIt->second;
        }
    }

    return nullptr;
}

bool BuildComp::reconstructValue(Value* V, BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap, BuildComp::ValueMap &deadAvailMap,
        BuildComp::Heuristic opts, std::vector<Instruction*> &recList,
        std::set<Value*> *keepSet) {

    // OSRLibrary::fixUsesOfFunctionsAndGlobals() will take care of Constant
    if (isa<Constant>(V)) return true;

    // if V is available, either directly or through an alias, just use it!
    if (availMap.count(V) > 0 || liveAliasMap.count(V) > 0) return true;

    // process an Instruction
    if (Instruction* I = dyn_cast<Instruction>(V)) {
        // check if we have already reconstructed it
        if (std::find(recList.begin(), recList.end(), I) != recList.end()) {
            return true;
        }

        // the instruction is dead-available
        if (deadAvailMap.count(I) > 0) {
            // check if we can reconstruct it first (avoid register pressure
            // increase from extending the liveness range of a value)
            if (shouldNotPreferDeadValues(opts) && canAttemptToReconstruct(I, opts)) {
                // keep track of the number of values reconstructed so far
                int safeElems = recList.size();

                // constant PHI nodes need special handling
                if (PHINode* PN = dyn_cast<PHINode>(I)) {
                    std::set<PHINode*> aliasSetForConstPHI;
                    Value* constVal = isPHINodeConstant(PN, &aliasSetForConstPHI);
                    assert(constVal && "unexpected non-constant PHI node");

                    // check if  we have a live available alias for it
                    if (isAliasAvailableForConstantPHI(constVal, &aliasSetForConstPHI,
                            availMap, liveAliasMap, deadAvailMap, false)) {
                        return true;
                    }

                    // not updating keepSet speeds up the process
                    bool ret = reconstructValue(constVal, availMap, liveAliasMap,
                            deadAvailMap, opts, recList, nullptr);

                    // on success, use the reconstructed value
                    if (ret) {
                        // we do not add a PHI node to recList, as we will use
                        // the corresponding constant value in the CompCode
                        return true;
                    }
                } else {
                    // iterate over operands of the non-PHI instruction
                    bool ret = true;
                    for (Use &U: I->operands()) {
                        Value* op = U.get();

                        // not updating keepSet speeds up the process
                        ret &= reconstructValue(op, availMap, liveAliasMap,
                                deadAvailMap, opts, recList, nullptr);

                        if (!ret) break;
                    }

                    if (ret) {
                        recList.push_back(I);
                        return true;
                    }
                }

                // undo changes and use the dead available value
                recList.resize(safeElems);
                return true;
            } else {
                // use the dead available value right away!
                return true;
            }
        }

        // attempt to reconstruct the instruction
        if (!canAttemptToReconstruct(I, opts)) {
            if (keepSet) keepSet->insert(I);
            return false;
        }

        // PHI nodes need special handling
        if (PHINode* PN = dyn_cast<PHINode>(I)) {
            // the node is constant since we passed canAttempToReconstruct()
            std::set<PHINode*> aliasSetForConstPHI;
            Value* constVal = isPHINodeConstant(PN, &aliasSetForConstPHI);
            assert(constVal && "unexpected non-constant PHI node");

            // check whether we have an available alias (live or dead) for it
            if (isAliasAvailableForConstantPHI(constVal, &aliasSetForConstPHI,
                    availMap, liveAliasMap, deadAvailMap, true)) {
                return true;
            }

            // attemp to reconstruct the value
            bool ret = reconstructValue(constVal, availMap, liveAliasMap,
                    deadAvailMap, opts, recList, keepSet);

            if (ret) {
                // on success, we do not add the PHI node to recList
                return true;
            } else {
                // returning constVal provides more informationn to a front-end
                if (keepSet) keepSet->insert(constVal);
                return false;
            }
        }

        // at this stage, we are dealing with a non-PHI instruction that can be
        // reconstructed, as long as its operand can be too
        bool success = true;
        for (Use &U: I->operands()) {
            Value* op = U.get();

            if (!reconstructValue(op, availMap, liveAliasMap, deadAvailMap,
                    opts, recList, keepSet)) {
                // when keepSet should not be computed, give up asap!
                if (!keepSet) return false;

                keepSet->insert(op);
                success = false;
            }
        }

        // adding an instruction to recList means we can reconstruct it (and the
        // recursive step has alread added all of its dependencies)
        if (success) recList.push_back(I);

        return success;
    }

    // Argument values should be part of availMap, thus we give up! Note that
    // unless we V is an Argument, this code portion is unreachable
    assert(isa<Argument>(V) && "unexpected value type in reconstruction");

    if (keepSet) keepSet->insert(V);

    return false;
}

// helper method to iterate over ValueMap objects and update statistics
Value* BuildComp::fetchOperandFromMaps(Value* V, BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap, BuildComp::ValueMap &deadAvailMap,
        BuildComp::Statistics &stats) {
    BuildComp::ValueMap::iterator VMIt;

    if ( (VMIt = availMap.find(V)) != availMap.end()) {
        Value* valToUse = VMIt->second;
        stats.liveOps.insert(valToUse);
        return valToUse;
    }

    if ( (VMIt = liveAliasMap.find(V)) != liveAliasMap.end()) {
        Value* valToUse = VMIt->second;
        stats.liveAliasedOps.insert(valToUse);
        return valToUse;
    }

    if ( (VMIt = deadAvailMap.find(V)) != deadAvailMap.end()) {
        Value* valToUse = VMIt->second;
        stats.deadOps.insert(valToUse);
        return valToUse;
    }

    return nullptr;
}

StateMap::CompCode* BuildComp::buildCompCode(Instruction* instToReconstruct,
        std::vector<Instruction*> &recList, BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap, BuildComp::ValueMap &deadAvailMap,
        BuildComp::Statistics &stats, BuildComp::Heuristic opts) {

    assert(recList.size() > 0 && "empty list of instructions to reconstruct!");

    // initialize a CompCode object
    StateMap::CompCode* compCode = new StateMap::CompCode();
    compCode->args = new SmallVector<Value*, 4>;
    compCode->code = new SmallVector<Value*, 8>;

    // for previously reconstructed instructions and constant PHI nodes
    std::map<Instruction*, Value*> reconstructedMap;
    std::map<Instruction*, Value*>::iterator RMIt;

    // available values that are used as operands in the code
    ValueSet argsForCompCode;

    for (Instruction* I: recList) {
        Instruction* clonedI = I->clone();

        // TODO self-referencing nodes?

        // iterate over the operands in the copy and fix them to point to available
        // values or previously reconstructed instructions
        for (Use &U: clonedI->operands()) {
            Value* op = U.get();

            if (isa<Constant>(op)) continue;

            Value* availV = fetchOperandFromMaps(op, availMap, liveAliasMap,
                    deadAvailMap, stats);

            if (availV) {
                U.set(availV);
                argsForCompCode.insert(availV);
                continue;
            }

            // I can't have an Argument here: reconstructValue would have failed
            Instruction* opI = cast<Instruction>(op);
            RMIt = reconstructedMap.find(opI);
            if (RMIt != reconstructedMap.end()) {
                U.set(RMIt->second);
            } else {
                // we have to reconstruct a constant PHI node
                PHINode* PN = cast<PHINode>(opI);
                std::set<PHINode*> aliasSetForConstPHI;
                Value* constV = isPHINodeConstant(PN, &aliasSetForConstPHI);
                assert (constV && "expected a const PHI!");

                Value* valToUse = nullptr;
                if (Instruction* constI = dyn_cast<Instruction>(constV)) {
                    RMIt = reconstructedMap.find(constI);
                    if (RMIt != reconstructedMap.end()) {
                        valToUse = RMIt->second;
                    }
                }

                if (!valToUse) {
                    valToUse = fetchOperandFromMaps(constV, availMap,
                            liveAliasMap, deadAvailMap, stats);
                }

                assert(valToUse && "cannot find const value for const PHI");
            }
        }

        // as reconstructed instructions compute values, they can be assigned
        // a name: we add a "CC_" prefix to distinguish them from the others
        if (I->hasName()) {
            clonedI->setName(Twine("CC_", I->getName()));
        } else {
            clonedI->setName("CC_anon");
        }

        // update map of reconstructed instructions
        reconstructedMap[I] = clonedI;

        // add instruction to CompCode object
        compCode->code->push_back(clonedI);

        // update statistics
        stats.reconstructSet.insert(I);
    }

    Instruction* lastI = recList.back();

    if (lastI != instToReconstruct && !isa<PHINode>(instToReconstruct)) {
        std::cerr << "Inst to reconstruct: ";
        instToReconstruct->dump();
        std::cerr << "Last inst in recList: ";
        lastI->dump();
    }

    assert ( (lastI == instToReconstruct || isa<PHINode>(instToReconstruct))
            && "missing instructions?"); // TODO better check for PHI node

    // we can now encode arguments and return value for the CompCode
    for (Value* arg: argsForCompCode) {
        compCode->args->push_back(arg);
    }
    compCode->value = compCode->code->back();

    int length = compCode->code->size();
    assert(length > 0 && "empty compCode?");
    if (length > stats.maxVarCCLength) stats.maxVarCCLength = length;
    stats.sumVarCCLength += length;

    return compCode;
}

bool BuildComp::buildComp(StateMap* M, Instruction* OSRSrc, Instruction* LPad,
        BuildComp::Heuristic opts, BuildComp::Statistics &stats,
        BuildComp::AnalysisData* src_BCAD, BuildComp::AnalysisData* dest_BCAD,
        bool updateMapping, bool verbose) {

    // flag set to true when compensation code instructions should be created
    // (i.e., local [alias] information is not sufficient to restore the state)
    stats.needPrologue = false;

    // fetch liveness analysis information from the StateMap
    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    LivenessAnalysis *LA_src, *LA_dest;

    // identify associated <basic block, function> for OSRSrc and LPad
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

    // compute LIVE_IN sets for OSRSrc and LPad
    liveAtOSRSrc = LivenessAnalysis::analyzeLiveInForSeq(OSRSrcBlock,
                LA_src->getLiveOutValues(OSRSrcBlock), OSRSrc, nullptr);
    liveAtLPad = LivenessAnalysis::analyzeLiveInForSeq(LPadBlock,
                LA_dest->getLiveOutValues(LPadBlock), LPad, nullptr);

    // retrieve CodeMapper(s) and information on updates to StateMap object(s)
    CodeMapper* src_CM = CodeMapper::getCodeMapper(*src);
    CodeMapper* dest_CM = CodeMapper::getCodeMapper(*dest);
    CodeMapper::StateMapUpdateInfo *src_updateInfo = nullptr;
    CodeMapper::StateMapUpdateInfo *dest_updateInfo = nullptr;
    if (src_CM) {
        src_updateInfo = src_CM->getStateMapUpdateInfo(M);
    }
    if (dest_CM) {
        dest_updateInfo = dest_CM->getStateMapUpdateInfo(M);
    }

    // worklist of instructions to reconstruct
    std::vector<Value*> workList;

    // lists of values that available, live aliases or dead available [alias]
    ValueMap availMap, liveAliasMap, deadAvailMap;

    // compute available values first
    computeAvailableValues(M, src, liveAtOSRSrc, opts, availMap);

    // find out which values need to be reconstructed
    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        if (availMap.count(valToSet) == 0) {
            workList.push_back(valToSet);
        }
    }

    // when all values to set are live at OSRSrc, no compensation code is needed
    stats.valuesToSet = liveAtLPad.size();
    stats.deadVariables = workList.size();
    if (!stats.deadVariables) return true;

    // compute dead available values (we need it also for dead aliases)
    if (canUseDeadValues(opts)) {
        computeDeadAvailableValues(M, OSRSrc, src, src_BCAD, availMap,
                deadAvailMap, opts);
    }

    // compute aliasing information: note that dead avaluable aliases will go
    // into deadAvailMap
    if (canUseAliases(opts) && (src_updateInfo || dest_updateInfo) ) {
        // compute alias information after function changes
        CodeMapper::OneToManyAliasMap aliasInfoMap =
                genAliasInfoMap(src_updateInfo, dest_updateInfo); // TODO hoist!

        computeAvailableAliases(M, OSRSrc, src_BCAD, aliasInfoMap,
                liveAtOSRSrc, availMap, liveAliasMap, deadAvailMap, opts);
    }

    // data structure for encoding compensation code & local 1:1 information
    StateMap::LocPairInfo::ValueInfoMap valueInfoMap;

    // reconstruct live variables one at a time
    bool success = true;

    std::vector<Instruction*> recList;
    ValueSet keepSetForValue;

    for (Value* valToReconstruct: workList) {
        bool canReconstruct = reconstructValue(valToReconstruct, availMap,
                liveAliasMap, deadAvailMap, opts, recList, &keepSetForValue);

        if (canReconstruct) {
            if (recList.empty()) { // local 1:1 mapping information
                Value* valToUse = fetchOperandFromMaps(valToReconstruct,
                        availMap, liveAliasMap, deadAvailMap, stats);

                if (!valToUse) {
                    // either we have a constant PHI node, or a bug :-)
                    PHINode* PN = cast<PHINode>(valToReconstruct);
                    std::set<PHINode*> aliasSetForConstPHI;
                    Value* constPHIval = isPHINodeConstant(PN, &aliasSetForConstPHI);
                    assert (constPHIval != nullptr && "expected const phi node!");

                    valToUse = isAliasAvailableForConstantPHI(constPHIval,
                            &aliasSetForConstPHI, availMap, liveAliasMap,
                            deadAvailMap, true);

                    assert (valToUse && "broken isAliasAvailableForConstantPHI()?");
                }

                // store local 1:1 mapping information in valueInfoMap
                valueInfoMap[valToReconstruct] = new StateMap::ValueInfo(valToUse);
                stats.aliasedDeadVariables++;
            } else {
                // reconstruct the value, which has to be an instruction! TODO always?
                Instruction* instToReconstruct = cast<Instruction>(valToReconstruct);
                StateMap::CompCode* compCode = buildCompCode(instToReconstruct,
                        recList, availMap, liveAliasMap, deadAvailMap, stats, opts);
                assert(compCode != nullptr && "no CompCode object generated");

                valueInfoMap[valToReconstruct] = new StateMap::ValueInfo(compCode);
                stats.needPrologue = true;
                stats.recoverableDeadVariables++;
                recList.clear();
            }
            assert(keepSetForValue.empty() && "non-empty keepSetForValue on success?");
        } else {
            // give up
            success = false;
            stats.keepSet.insert(keepSetForValue.begin(), keepSetForValue.end());

            recList.clear();
            keepSetForValue.clear();
        }
    }

    assert( (!success || stats.keepSet.empty()) && "non-empty keepSet on success?");

    if (!success || !updateMapping) {
        // free memory
        for (StateMap::LocPairInfo::ValueInfoMap::iterator it = valueInfoMap.begin(),
                end = valueInfoMap.end(); it != end; ++it) {
            delete it->second;
        }
    } else {
        // register LocPairInfo for the current LocPair
        StateMap::LocPair LP(OSRSrc, LPad);
        assert(M->getLocPairInfo(LP) == nullptr && "LocPairInfo alread exists");
        StateMap::LocPairInfo* LPInfo = M->createLocPairInfo(LP);
        LPInfo->valueInfoMap = std::move(valueInfoMap);
    }

    return success;
}

bool BuildComp::isBuildCompRequired(StateMap* M, Instruction* OSRSrc,
        Instruction* LPad, BuildComp::ValueSet &missingSet, bool verbose,
        int *numLiveValues) {
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

    if (numLiveValues) *numLiveValues = liveAtLPad.size();

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
        std::cerr << "No corresponding live value for the following values:"
                  << std::endl;
        for (Value* v: missingSet) {
            v->dump();
        }
    }

    return ret;
}

void BuildComp::printStatistics(StateMap* M, BuildComp::Heuristic opts,
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
    int isPrologueRequiredInF1 = 0, isPrologueRequiredInF2 = 0;

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
        }

        assert(!isa<Constant>(v) && "Constant appears as key in the 1:1 map!");
    }

    AnalysisData* BCAD_F1 = new AnalysisData(F1);
    AnalysisData* BCAD_F2 = new AnalysisData(F2);

    Statistics stats;
    std::set<Value*> missingSet;

    for (StateMap::LocMap::iterator it = landingPadMap.begin(),
            end = landingPadMap.end(); it != end; ++it) {
        Instruction* OSRSrc = it->first;
        if (isa<PHINode>(OSRSrc)) continue;
        Instruction* LPad = it->second;
        Function* F = OSRSrc->getParent()->getParent();
        assert ( (F == F1 || F == F2) && "OSRSrc from unknown function");
        AnalysisData* BCAD_src = (F == F1) ? BCAD_F1 : BCAD_F2;
        AnalysisData* BCAD_dest = (F == F1) ? BCAD_F2 : BCAD_F1;
        bool bcReq = BuildComp::isBuildCompRequired(M, OSRSrc, LPad, missingSet,
                verbose);
        bool bcFails = false;
        if (bcReq) {
            missingSet.clear();
            stats.reset();
            bcFails = !BuildComp::buildComp(M, OSRSrc, LPad, opts, stats,
                    BCAD_src, BCAD_dest, false, verbose);
        }
        if (F == F1) {
            ++OSRSourcesInF1;
            if (bcReq) {
                ++buildCompRequiredInF1;
                if (bcFails) {
                    ++buildCompFailsInF1;
                } else if (stats.needPrologue) {
                    ++isPrologueRequiredInF1;
                }
            }
        } else {
            ++OSRSourcesInF2;
            if (bcReq) {
                ++buildCompRequiredInF2;
                if (bcFails) {
                    ++buildCompFailsInF2;
                } else if (stats.needPrologue) {
                    ++isPrologueRequiredInF2;
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
    std::cerr << "- " << isPrologueRequiredInF1 << " OSRSrc locations for which"
              << " a compensation code can be built and needs a prologue"
              << std::endl;

    std::cerr << "<" << F2Name << ">" << std::endl;
    std::cerr << "- " << oneToOneValuesForF2 << " values for which there is a "
              << "1:1 corresponding value" << std::endl;
    std::cerr << "- " << OSRSourcesInF2 << " candidate OSRSrc locations"
              << std::endl;
    std::cerr << "- " << buildCompRequiredInF2 << " OSRSrc locations for which "
              << "a compensation code is required" << std::endl;
    std::cerr << "- " << buildCompFailsInF2 << " OSRSrc locations for which a "
              << "compensation code cannot be built automatically" << std::endl;
    std::cerr << "- " << isPrologueRequiredInF2 << " OSRSrc locations for which"
              << " a compensation code can be built and needs a prologue"
              << std::endl;

    delete BCAD_F1;
    delete BCAD_F2;
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