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

#define BUILD_ALIAS_INFO_MAP    1

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

void BuildComp::identifyMissingValues(Instruction* I, std::map<Value*, Value*>
        &availableValues, std::map<Value*, Value*> &extraAvailableValues,
        std::set<Value*> &missingValues, BuildComp::Heuristic opt) {
    for (User::op_iterator it = I->op_begin(), end = I->op_end(); it != end;
            ++it) {
        Value* op = *it;

        // OSRLibrary takes care of Constant with fixUsesOfFunctionsAndGlobals()
        if (isa<Constant>(op)) continue;

        if (availableValues.count(op) == 0 && missingValues.count(op) == 0 &&
                extraAvailableValues.count(op) == 0) {
            missingValues.insert(op);
            if (Instruction* opI = dyn_cast<Instruction>(op)) {
                // we don't fetch incoming values for non-constant PHI nodes
                if (PHINode* phi = dyn_cast<PHINode>(opI)) {
                    if (!canDoBasicOpts(opt) ||
                        !phi->hasConstantValue()) {
                        continue;
                    }
                }

                identifyMissingValues(opI, availableValues,
                        extraAvailableValues, missingValues, opt);

            }
        }
    }
}

// we try to reconstruct constant PHI nodes (e.g., LCSSA form)
static Value* isPHINodeConstant(PHINode* PN, std::set<PHINode*> *aliasSet = nullptr) {

    // base step: detect trivially constant PHI nodes
    Value* V = PN->hasConstantValue();
    if (V) return V;

    // recursive step: initialize V using the first incoming value
    V = PN->getIncomingValue(0);
    if (PHINode* opPN = dyn_cast<PHINode>(V)) {
        // recursively solve the node and assign it to V
        if ((V = isPHINodeConstant(opPN, aliasSet)) == nullptr) {
            if (aliasSet) aliasSet->clear();
            return nullptr;
        }

        if (aliasSet) aliasSet->insert(opPN);
    }

    // recursive step: process remaining incoming values
    for (int i = 1, n = PN->getNumIncomingValues(); i < n; ++i) {
        Value* op = PN->getIncomingValue(i);

        if (op == V) continue; // ok, same incoming value from this edge

        if (PHINode* opPN = dyn_cast<PHINode>(op)) {
            if (isPHINodeConstant(opPN, aliasSet) != V) {
                if (aliasSet) aliasSet->clear();
                return nullptr;
            } else {
                if (aliasSet) aliasSet->insert(opPN);
                continue;
            }
        }

        // the PHI node is not constant!
        if (aliasSet) aliasSet->clear();
        return nullptr;
    }

    return V;
}


bool BuildComp::canAttemptToReconstruct(Instruction* I, BuildComp::Heuristic opt) {
    // we can reconstruct invoke/call instructions to read-only functions only
    if (CallInst* CI = dyn_cast<CallInst>(I)) {
        if (CI->mayWriteToMemory()) return false;
    }

    if (InvokeInst* II = dyn_cast<InvokeInst>(I)) {
        if (II->mayWriteToMemory()) return false;
    }

    // TODO
    if (isa<LoadInst>(I)) return false;

    // try to reconstruct PHI nodes when possible
    if (PHINode* PN = dyn_cast<PHINode>(I)) {
        if (!canDoBasicOpts(opt) || !isPHINodeConstant(PN, nullptr)) return false;
        else return true;
    }

    return true;
}

Value* isAliasAvailableForConstantPHI(Value* constV, std::set<PHINode*> *aliasSet,
        BuildComp::ValueMap &availMap, BuildComp::ValueMap &liveAliasMap,
        BuildComp::ValueMap &deadAvailMap, bool canUseDeadAvailable) {

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

    if (!canUseDeadAvailable) goto EXIT;

    if ( (VMIt = deadAvailMap.find(constV)) != deadAvailEnd) return VMIt->second;
    for (PHINode* PN: *aliasSet) {
        if ( (VMIt = deadAvailMap.find(PN)) != deadAvailEnd) return VMIt->second;
    }

    EXIT: return nullptr;

    /*

    bool found;
    BuildComp::ValueMap::iterator VMIt;

    // check constV first
    found = true;
    if ( (VMIt = availMap.find(constV)) == availEnd) {
        if ( (VMIt = liveAliasMap.find(constV)) == liveAliasEnd) {
            if (canUseDeadAvailable) {
                VMIt = deadAvailMap.find(constV);
                found = (VMIt != deadAvailEnd);
            } else {
                found = false;
            }
        }
    }

    // then check aliases
    for (PHINode* PN: *aliasSet) {
        found = true;

        if ( (VMIt = availMap.find(PN)) == availEnd) {
           if ( (VMIt = liveAliasMap.find(PN)) == liveAliasEnd) {
                if (canUseDeadAvailable) {
                    VMIt = deadAvailMap.find(PN);
                    found = (VMIt != deadAvailEnd);
                } else {
                    found = false;
                }
            }
        }

        if (found) return VMIt->second;
    }

    return nullptr;
    */
}

bool BuildComp::reconstructValue(Value* V, BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap, BuildComp::ValueMap &deadAvailMap,
        BuildComp::Heuristic opts,
        std::vector<Instruction*> &recList,
        std::set<Instruction*> &workSet,
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
            if (!shouldPreferDeadValues(opts) && canAttemptToReconstruct(I, opts)) {
                // keep track of the number of values reconstructed so far
                int safeElems = recList.size();

                // let's see if we can reconstruct it (this should reduce the
                // register pressure increase caused by an OSR point insertion)
                if (PHINode* PN = dyn_cast<PHINode>(I)) {
                    // as we passed the canAttempToReconstruct() test, we can
                    // have only constant PHI nodes here!
                    std::set<PHINode*> aliasSetForConstPHI;
                    Value* constVal = isPHINodeConstant(PN, &aliasSetForConstPHI);
                    assert(constVal && "unexpected non-constant PHI node");

                    // check if  we have a live available alias for it
                    if (isAliasAvailableForConstantPHI(constVal, &aliasSetForConstPHI,
                            availMap, liveAliasMap, deadAvailMap, false)) {
                        return true;
                    }

                    // passing nullptr as keepSet speeds up the process
                    bool ret = reconstructValue(constVal, availMap, liveAliasMap,
                            deadAvailMap, opts, recList, workSet, nullptr);

                    // on success, use the reconstructed value
                    if (ret) {
                        // we do not add a PHI node to recList, as we will use
                        // directly its constant value in the compensation code
                        return true;
                    }
                } else {
                    // iterate over operands of the instruction
                    bool ret = true;
                    for (Use &U: I->operands()) {
                        Value* op = U.get();

                        // passing nullptr as keepSet speeds up the process
                        ret &= reconstructValue(op, availMap, liveAliasMap,
                                deadAvailMap, opts, recList, workSet, nullptr);

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
                // we are allowed to use the dead available value right away
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
            // as we passed the canAttempToReconstruct() test, we can only have
            // constant PHI nodes here!
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
                    deadAvailMap, opts, recList, workSet, keepSet);

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
        // possibly reconstructed, as long as its operand can be
        bool success = true;
        for (Use &U: I->operands()) {
            Value* op = U.get();
            bool ret = reconstructValue(op, availMap, liveAliasMap, deadAvailMap,
                    opts, recList, workSet, keepSet);

            if (!ret) {
                if (keepSet) {
                    keepSet->insert(op);
                } else {
                    // when keepSet should not be computed, give up asap!
                    return false;
                }
            }

            success &= ret;
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

#if 0
// reconstruct an instruction and add it to a CompCode object, assuming that
// its dependencies have already been reconstructed
bool BuildComp::reconstructInst(Instruction* I,
        std::map<Value*, Value*> &availableValues,
        std::map<Value*, Value*> &extraAvailableValues,
        std::map<Instruction*, Value*> &reconstructedMap,
        std::set<Instruction*> &recSet,
        StateMap::CodeSequence* compCodeSequence,
        std::set<Value*> &argsForCompCode,
        BuildComp::Heuristic opt) {

    // TODO heuristics; other instruction types?

    // attempt to reconstruct constant PHI nodes
    if (PHINode* phi = dyn_cast<PHINode>(I)) {
        Value* constV = phi->hasConstantValue();

        if (!constV || !canDoBasicOpts(opt)) return false;

        // check if the constant value has already been reconstructed
        if (Instruction* constI = dyn_cast<Instruction>(constV)) {
            if (reconstructedMap.count(constI) != 0) {
                reconstructedMap[I] = reconstructedMap[constI];
                return true;
            }
        }

        Value* valToUse = nullptr;

        // check if the constant value is already available
        if (availableValues.count(constV) != 0) {
            valToUse = availableValues[constV];
        } else if (extraAvailableValues.count(constV) != 0) {
            valToUse = extraAvailableValues[constV];
        }

        if (valToUse) {
            // unless it is a Constant, we should add it to CompCode's arguments
            if (!isa<Constant>(valToUse)) {
                argsForCompCode.insert(valToUse);
            }
            reconstructedMap[I] = valToUse;

            return true;
        }

        // TODO try to reconstruct it anyway?

        return false;
    }

    // TODO we can do better than this?
    if (isa<LoadInst>(I)) {
        return false;
    }

    // we can reconstruct a call/invoke instruction only for read-only functions
    if (CallInst* CI = dyn_cast<CallInst>(I)) {
        if (CI->mayWriteToMemory()) return false;
    }
    if (InvokeInst* II = dyn_cast<InvokeInst>(I)) {
        if (II->mayWriteToMemory()) return false;
    }

    // keep track of the instructions that are being reconstructed
    recSet.insert(I);

    // create a copy of the original instruction
    Instruction* RI = I->clone();

    // we are going to need a number of iterators
    std::map<Value*, Value*>::iterator availIt, deadAvailIt;
    std::map<Value*, Value*>::iterator availEnd = availableValues.end();
    std::map<Value*, Value*>::iterator extraAvailEnd = extraAvailableValues.end();
    std::map<Instruction*, Value*>::iterator recEnd = reconstructedMap.end();

    // iterate over the operands in the copy and fix them to point to available
    // values or previously reconstructed instructions
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

        deadAvailIt = extraAvailableValues.find(op);
        if (deadAvailIt != extraAvailEnd) {
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

// recursively attempt to reconstruct a value computed by an instruction
StateMap::ValueInfo* BuildComp::buildCompCode(Instruction* instToReconstruct,
        std::map<Value*, Value*> &availableValues,
        std::map<Value*, Value*> &extraAvailableValues,
        std::set<Value*> &valuesToKeep,
        std::set<Instruction*> &recSet,
        BuildComp::Heuristic opt) {

    // sanity checks
    assert(extraAvailableValues.count(instToReconstruct) == 0
            && "attempting to reconstruct a dead available value?");
    assert(!isa<PHINode>(instToReconstruct) && "PHI node not treated earlier?");

    // TODO: other instructions as well?
    if (isa<PHINode>(instToReconstruct) || isa<LoadInst>(instToReconstruct)) {
        // TODO check optimization for LOAD from read-only memory
        valuesToKeep.insert(instToReconstruct);
        return nullptr;
    }

    // identify values that require recursive reconstruction and build workset
    std::set<Value*> missingValues;
    identifyMissingValues(instToReconstruct, availableValues,
            extraAvailableValues, missingValues, opt);

    std::set<Instruction*> instWorkSet;
    for (Value* v: missingValues) {
        // dead arguments should have already been made available at this stage!
        if (isa<Argument>(v)) return nullptr; // TODO insert assertion here

        instWorkSet.insert(cast<Instruction>(v));
    }

    // compute a topological order on the workset based on use-def information
    std::vector<Instruction*> sortedInstructions;
    while (!instWorkSet.empty()) {
        // iterate over instruction worklist
        for (std::set<Instruction*>::iterator it = instWorkSet.begin(),
                end = instWorkSet.end(); it != end; ) {
            Instruction* I = *it;
            bool canInsert = true;

            // iterate over operands
            for (Use &U: I->operands()) {
                Value* op = U.get();
                if (Instruction* opI = dyn_cast<Instruction>(op)) {
                    // a use of a PHI node by the node itself is legal in LLVM
                    if (opI == I && cast<PHINode>(I)) continue;

                    // we cannot insert an instruction until all the missing
                    // instructions it uses as operands have been inserted
                    if (instWorkSet.count(opI) != 0) {
                        canInsert = false;
                        break;
                    }
                }
            }

            // check if we can perform the insertion
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

    // initialize a CompCode object
    StateMap::CompCode* compCode = new StateMap::CompCode();
    compCode->args = nullptr;
    compCode->code = new SmallVector<Value*, 8>;

    // for each entry the key is the instruction to reconstruct, and the value
    // is the value to use for the reconstruction (e.g., an available value, or
    // an instruction that has been recursively reconstructed before this one)
    std::map<Instruction*, Value*> reconstructedMap;

    // live values that are used as operands along the compensation instructions
    std::set<Value*> argsForCompCode;

    // attempt to reconstruct instructions (give up when encountering an error)
    bool success = true;
    for (Instruction* currInstToReconstruct: sortedInstructions) {
        success &= reconstructInst(currInstToReconstruct, availableValues,
                extraAvailableValues, reconstructedMap, recSet, compCode->code,
                argsForCompCode, opt);

        if (!success) break;
    }

    if (success) {
        // the last instruction is the value we have been asked to reconstruct
        compCode->value = compCode->code->back();

        // args should be initialized even when no arguments are taken!
        compCode->args = new SmallVector<Value*, 4>;
        for (Value* arg: argsForCompCode) {
            compCode->args->push_back(arg);
        }

        return new StateMap::ValueInfo(compCode);
    } else {
        // release memory on failure
        for (StateMap::CodeSequence::iterator it = compCode->code->begin(),
                end = compCode->code->end(); it != end; ++it) {
            delete cast<Instruction>(*it);
        }
        delete compCode->code;
        delete compCode;

        return nullptr;
    }
}
#endif

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

#if BUILD_ALIAS_INFO_MAP
static CodeMapper::OneToManyAliasMap genAliasInfoMap(
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
#endif

void BuildComp::computeAvailableAliases(StateMap* M, Instruction* OSRSrc,
        BuildComp::AnalysisData* BCAD,
        CodeMapper::OneToManyAliasMap &aliasInfoMap,
        LivenessAnalysis::LiveValues& liveAtOSRSrc,
        BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap,
        BuildComp::ValueMap &deadAvailMap,
        BuildComp::Heuristic opts) {
    assert(BCAD != nullptr && "no BuildComp::AnalysisData provided!");

    DominatorTree &DT = BCAD->DT;
    AnalysisData::SafeLoadSet &safeLoads = BCAD->SafeLoadsMap[OSRSrc];

    bool useOnlySafeLoads = false;

    for (const std::pair<Value*, std::set<Value*>> &pair: aliasInfoMap) {
        Value* valToSet = pair.first;

        // if a value is already available, no need to use an alias for it
        if (availMap.count(valToSet) > 0) continue;

        // unless we do not care about register pressure, we give it a try!
        if (shouldPreferDeadValues(opts) && deadAvailMap.count(valToSet) > 0) continue;

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
            if (canUseDeadValues(opts) && shouldPreferDeadValues(opts)) {
                Instruction* I = cast<Instruction>(valToUse);

                if (isDeadInstructionAvailable(I, OSRSrc, DT, safeLoads,
                        useOnlySafeLoads)) {
                    deadAvailMap[valToSet] = valToUse;
                    break;
                }
            }
        }

        // a second scan is needed when we want to keep register pressure low
        if (canUseDeadValues(opts) && !shouldPreferDeadValues(opts)) {
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
            assert(false && "Constant appears as key in the 1:1 map!");
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

    //
    // Note that a live value not mapped to a valToSet from liveAtLPad might
    // come in handy later as we may need it to reconstruct an instruction.
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
            assert(false && "Constant appears as key in the 1:1 map!");
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

static Value* fetchOperandFromMaps(Value* V, BuildComp::ValueMap &availMap,
        BuildComp::ValueMap &liveAliasMap, BuildComp::ValueMap &deadAvailMap,
        BuildComp::Statistics &stats) {
    BuildComp::ValueMap::iterator VMIt;

    if ( (VMIt = availMap.find(V)) != availMap.end()) {
        stats.liveValues++;
        return VMIt->second;
    }

    if ( (VMIt = liveAliasMap.find(V)) != liveAliasMap.end()) {
        stats.liveAliases++;
        return VMIt->second;
    }

    if ( (VMIt = deadAvailMap.find(V)) != deadAvailMap.end()) {
        stats.deadValues++;
        return VMIt->second;
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
    std::set<Value*> argsForCompCode;

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
                assert (constV == nullptr && "expected a const PHI!");

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

        // I can set names as reconstructed instructions always compute values
        if (I->hasName()) {
            clonedI->setName((I->getName())); // TODO add CC_ prefix
        } else {
            clonedI->setName("CC_anon");
        }

        // update map of reconstructed instructions
        reconstructedMap[I] = clonedI;

        // add instruction to CompCode object
        compCode->code->push_back(clonedI);
    }

    Instruction* lastI = recList.back();
    assert (lastI == instToReconstruct && "missing instructions?"); // TODO PHI node


    // we can now encode arguments and return value for the CompCode
    for (Value* arg: argsForCompCode) {
        compCode->args->push_back(arg);
    }
    compCode->value = compCode->code->back();

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
    std::vector<Value*> workList; // instructions to reconstruct

    // lists of values that available, live aliases or dead available [alias]
    ValueMap availMap, liveAliasMap, deadAvailMap;

    // compute available values first
    computeAvailableValues(M, src,liveAtOSRSrc, opts, availMap);

    // find out which values need to be reconstructed
    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        if (availMap.count(valToSet) == 0) {
            workList.push_back(valToSet);
        }
    }

    // when all values to set are live at OSRSrc, no compensation code is needed
    if (workList.empty()) return true;

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
    std::set<Instruction*> workSet;
    std::set<Value*> keepSetForValue;

    for (Value* valToReconstruct: workList) {
        assert(availMap.count(valToReconstruct) == 0 && "missed an already-available value?"); // TODO remove asap

        // TODO easier this way atm
        recList.clear();
        workSet.clear();

        bool canReconstruct = reconstructValue(valToReconstruct, availMap,
                liveAliasMap, deadAvailMap, opts, recList, workSet, &keepSetForValue);

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
            } else {
                // reconstruct the value, which has to be an instruction! TODO always?
                Instruction* instToReconstruct = cast<Instruction>(valToReconstruct);
                StateMap::CompCode* compCode = buildCompCode(instToReconstruct,
                        recList, availMap, liveAliasMap, deadAvailMap, stats, opts);
                assert(compCode != nullptr && "no CompCode object generated");
                valueInfoMap[valToReconstruct] = new StateMap::ValueInfo(compCode);
            }
            assert(keepSetForValue.empty() && "non-empty keepSetForValue on success?");
        } else {
            // give up
            success = false;
            stats.keepSet.insert(keepSetForValue.begin(), keepSetForValue.end());
            keepSetForValue.clear();
        }
    }

    assert( (success || stats.keepSet.empty()) && "non-empty keepSet on success?");

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

// [check if we can] build compensation code for a LocPair <OSRSrc, LPad>
bool BuildComp::buildComp(StateMap *M, Instruction* OSRSrc, Instruction* LPad,
        std::set<Value*> &keepSet, std::set<Instruction*> &recSet,
        bool &needPrologue, BuildComp::Heuristic opt,
        BuildComp::AnalysisData* src_BCAD, BuildComp::AnalysisData* dest_BCAD,
        bool updateMapping, bool verbose) {

    Statistics stats;

    bool ret = buildComp(M, OSRSrc, LPad, opt, stats, src_BCAD, dest_BCAD,
            updateMapping, verbose);

    recSet = stats.reconstructSet;
    needPrologue = stats.needPrologue;
    keepSet = stats.keepSet;

    return ret;

#if 0
    // flag set to true when compensation code instructions should be created
    // (i.e., local aliasing information is not sufficient to restore the state)
    needPrologue = false;

    // fetch liveness analysis information from the StateMap
    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    LivenessAnalysis *LA_src, *LA_dest;

    // identify associated basic block & function for OSRSrc and LPad
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
    std::vector<Value*> workList; // instructions to reconstruct

    // list of values that are obviously available
    std::map<Value*, Value*> availableValues;

    // list of values that are made available by running ad-hoc heuristics
    std::map<Value*, Value*> extraAvailableValues;

    // Build the set of available values.
    //
    // Note that a live value not mapped to a valToSet from liveAtLPad might
    // come in handy later as we may need it to reconstruct an instruction.
    StateMap::OneToOneValueMap &OOMap = M->getAllCorrespondingOneToOneValues();
    for (StateMap::OneToOneValueMap::iterator it = OOMap.begin(),
            end = OOMap.end(); it != end; ++it) {
        Value* valToSet = it->first;
        Value* valToUse = it->second;

        // skip valToSet if it belongs to src: we need to reconstruct at dest!
        if (Instruction* I = dyn_cast<Instruction>(valToSet)) {
            if (I->getParent()->getParent() == src) continue;
        } else if (Argument* A = dyn_cast<Argument>(valToSet)) {
            if (A->getParent() == src) continue;
        } else {
            assert(false && "Constant appears as key in the 1:1 map!");
            continue;
        }

        // constants and live variables are obviously available
        if (isa<Constant>(valToUse) || liveAtOSRSrc.count(valToUse) > 0) {
            availableValues[valToSet] = valToUse;
            continue;
        }

        // safe optimization: arguments are never modified, thus are available
        if (canDoBasicOpts(opt) && isa<Argument>(valToUse)) {
            availableValues[valToSet] = valToUse;
            continue;
        }
    }

    // find out which values need to be reconstructed
    for (const Value* v: liveAtLPad) {
        Value* valToSet = const_cast<Value*>(v);
        if (availableValues.count(valToSet) == 0) {
            workList.push_back(valToSet);
        }
    }

    if (workList.empty()) return true; // no compensation code is required

    // extraAvailableValues += values for which liveness can be safely extended
    if (canUseDeadValues(opt)) {
        computeDeadAvailableValues(M, OSRSrc, src, src_BCAD, availableValues,
                extraAvailableValues, opt);
    }

    // extraAvailableValues += values that are available through an alias
    //
    // Note: when shouldUseDeadValues(opt) is true, it also looks for dead
    // aliases for which liveness can be safely extended
    if (canUseAliases(opt) && (src_updateInfo || dest_updateInfo) ) {
        #if BUILD_ALIAS_INFO_MAP
        CodeMapper::OneToManyAliasMap aliasInfoMap =
                genAliasInfoMap(src_updateInfo, dest_updateInfo);
        #else
        CodeMapper::OneToManyAliasMap &aliasInfoMap =
                dest_updateInfo->RAUWAliasInfo;
        #endif

        computeAvailableAliases(M, OSRSrc, src_BCAD, aliasInfoMap,
                liveAtOSRSrc, availableValues, extraAvailableValues,
                extraAvailableValues, opt);

        /*computeAvailableAdditionalOneToOne(M, OSRSrc, BCAD, updateInfo,
                liveAtOSRSrc, availableValues, extraAvailableValues, opt);*/
    }

    // data structure for encoding compensation code & local 1:1 information
    StateMap::LocPairInfo::ValueInfoMap valueInfoMap;

    // values that cannot be reconstructed (and thus should have been kept)
    std::set<Value*> curValuesToKeep;

    bool error = false;
    for (Value* valToReconstruct: workList) {
        assert(availableValues.count(valToReconstruct) == 0
                && "missed an already-available value?");

        Value* valToUse = nullptr;

        if (extraAvailableValues.count(valToReconstruct) > 0) {
            // in general this is not a globally 1:1 corresponding value
            valToUse = extraAvailableValues[valToReconstruct];
        } else if (PHINode* phi = dyn_cast<PHINode>(valToReconstruct)) {
            Value* constV = nullptr;

            // constant PHI nodes can be treated as a special case
            if (canDoBasicOpts(opt)) {
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
                error = true; // TODO what if we can still reconstruct it?!?

                // ---> I DON'T UNDERSTAND THE COMMENT BELOW ANYMORE! <---
                //
                // TODO: constV would yield more accurate info, but we can let
                // the client inspect phi to see whether hasConstantValue()
                keepSet.insert(phi);
                continue;
            }
        }

        // we have a local 1:1 corresponding value for this LocPair
        if (valToUse) {
            StateMap::ValueInfo* valInfo = new StateMap::ValueInfo(valToUse);
            valueInfoMap[valToReconstruct] = valInfo;
            continue;
        }

        // attempt to reconstruct the value through a compensation code
        if (Instruction* I = dyn_cast<Instruction>(valToReconstruct)) {
            StateMap::ValueInfo* valInfo = buildCompCode(I, availableValues,
                    extraAvailableValues, curValuesToKeep, recSet, opt);
            if (valInfo == nullptr) {
                // cannot reconstruct the value
                error = true;
                keepSet.insert(curValuesToKeep.begin(), curValuesToKeep.end());

                // clear the set for the next value to reconstruct
                curValuesToKeep.clear();
            } else {
                // we can reconstruct the value!
                valueInfoMap[valToReconstruct] = valInfo;
                needPrologue = true;
            }

            continue;
        }

        assert(isa<Argument>(valToReconstruct));
        // TODO insert assert check on heuristics for dead arguments

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
        // register LocPairInfo for the current LocPair
        StateMap::LocPair LP(OSRSrc, LPad);
        assert(M->getLocPairInfo(LP) == nullptr && "LocPairInfo alread exists");
        StateMap::LocPairInfo* LPInfo = M->createLocPairInfo(LP);
        LPInfo->valueInfoMap = std::move(valueInfoMap);
    }

    return !error;
#endif
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
    std::set<Value*> keepSet;
    std::set<Instruction*> recSet;
    std::set<Value*> missingSet;
    bool needPrologue;
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
            bcFails = !BuildComp::buildComp(M, OSRSrc, LPad, keepSet, recSet,
                    needPrologue, opt, BCAD_src, BCAD_dest, false, verbose);
            keepSet.clear();
        }
        if (F == F1) {
            ++OSRSourcesInF1;
            if (bcReq) {
                ++buildCompRequiredInF1;
                if (bcFails) {
                    ++buildCompFailsInF1;
                } else if (needPrologue) {
                    ++isPrologueRequiredInF1;
                }
            }
        } else {
            ++OSRSourcesInF2;
            if (bcReq) {
                ++buildCompRequiredInF2;
                if (bcFails) {
                    ++buildCompFailsInF2;
                } else if (needPrologue) {
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