/* ===============================================================
 * Live variable analysis for LLVM Functions.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Liveness.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/User.h>
#include <llvm/IR/Value.h>

#include <iostream>

using namespace llvm;

/** A quick overview of the dataflow analysis algorithm
 *
 * Assume that s is a generic basic block and f is the exit basic block.
 *
 * Some definitions:
 * GEN[s]   = set of variables used in s before any assignment
 * KILL[s]  = set of variables written in s
 *
 * Dataflow equations:
 * LIVE_IN[s]   = GEN[s] union (LIVE_OUT[s] - KILL[s])
 * LIVE_OUT[f]  = {}
 * LIVE_OUT[s]  = union{LIVE_IN[t]: t is a successor of s}
 *
 * Update rules:
 * KILL[d: y <- f(x1, ..., xN)] = {y}
 * GEN[d:  y <- f(x1, ..., xN)] = {x1, ..., xN}
 *
 **/

LivenessAnalysis::LiveValues LivenessAnalysis::analyzeLiveIn(const BasicBlock* B,
        const LivenessAnalysis::LiveValues &outValues) {
    // initially LIVE_IN[B] = LIVE_OUT[B]
    LiveValues inValues(outValues);

    const BasicBlock::InstListType &instructions = B->getInstList();

    // process all non-PHI instructions starting from the end of the block
    for (BasicBlock::InstListType::const_reverse_iterator revIt = instructions.rbegin(),
         revEnd = instructions.rend(); revIt != revEnd; ++revIt) {
        const Instruction* I = &*revIt;

        if (isa<PHINode>(I)) break;

        // remove elements that belong to KILL[B]
        inValues.erase(I);

        // add elements that belong to GEN[B]
        for (User::const_op_iterator opIt = I->op_begin(), opEnd = I->op_end();
             opIt != opEnd; ++opIt) {
            const Value *V = *opIt;

            // ignore constants, globals
            if (isa<Instruction>(V) || isa<Argument>(V))
                inValues.insert(V);
        }
    }

    return inValues;
}

bool LivenessAnalysis::analyzeBBwithPHINodes(const BasicBlock *B,
    LivenessAnalysis::LiveValues &inValues,
    const LivenessAnalysis::LiveValues &outValues) {

    BasicBlock::const_iterator firstNonPHIInstr = B->getFirstNonPHI();
    BasicBlock::const_iterator firstInstr = B->begin();

    // compute LIVE_IN[B] (which might include PHI nodes defined in B) since
    // LIVE_OUT[B] might have changed while analyzing a successor of B
    LiveValues currInValues = analyzeLiveIn(B, outValues);

    // remove PHI nodes created at this block from the set: we do not want to
    // propagate them to a predecessor of B
    for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
        currInValues.erase(&*it);
    }

    // the inValues set can only grow across invocations of this method
    bool hasChanged = false;
    for (const llvm::Value* v: currInValues) {
        std::pair<LiveValues::iterator,bool> ret = inValues.insert(v);
        hasChanged |= ret.second;
    }

    // if there are no PHI nodes, update the LIVE_OUT sets for predecessors
    if (firstNonPHIInstr == firstInstr) {
        for (const_pred_iterator it = pred_begin(B), end = pred_end(B);
             it != end ; ++it) {
            LiveValues &predOutValues = blockMap[*it].second;
            predOutValues.insert(inValues.begin(), inValues.end());
        }

        return hasChanged;
    }

    // we use a PHI node to initialize the LIVE_OUT sets for predecessors: this
    // should be faster than using const_pred_iterator from CFG.h
    const PHINode *phi = cast<PHINode>(&*firstInstr);
    int numPredecessors = phi->getNumIncomingValues();

    for (int i = 0; i < numPredecessors; ++i) {
        const BasicBlock *pred = phi->getIncomingBlock(i);

        LiveValues &predOutValues = blockMap[pred].second;
        predOutValues.insert(inValues.begin(), inValues.end());
    }

    // process PHI nodes in B: each incoming value is added to the LIVE_OUT set
    // of the predecessor from which the value is coming.
    for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
        const PHINode *phi = cast<PHINode>(&*it);

        for (int i = 0; i < numPredecessors; ++i) {
            const BasicBlock *pred = phi->getIncomingBlock(i);
            const Value *V = phi->getIncomingValue(i);
            LiveValues &predOutValues = blockMap[pred].second;

            // ignore constants, globals
            if (isa<Instruction>(V) || isa<Argument>(V))
                predOutValues.insert(V);
        }
    }

    return hasChanged;
}

void LivenessAnalysis::run() {
    bool hasChanged;
    const Function::BasicBlockListType &blocks = F->getBasicBlockList();

    do {
        hasChanged = false;
        // use a reversed iterator as we have to perform backward analysis
        for (Function::BasicBlockListType::const_reverse_iterator rIt = blocks.rbegin(),
             end = blocks.rend(); rIt != end; ++rIt) {
            const BasicBlock *B = &*rIt;
            LiveInAndOutValues &currPair = blockMap[B];

            // we recompute LIVE_IN[B] and propagate the results to its predecessors
            hasChanged |= analyzeBBwithPHINodes(B, currPair.second, currPair.first);
        }
    } while (hasChanged);
}

LivenessAnalysis::LiveValues& LivenessAnalysis::getLiveInValues(BasicBlock* B) {
    return blockMap[B].first;
}

LivenessAnalysis::LiveValues& LivenessAnalysis::getLiveOutValues(BasicBlock* B) {
    return blockMap[B].second;
}

void LivenessAnalysis::printResultsToScreen(BasicBlock* B) {
    assert(blockMap.find(B) != blockMap.end());
    LiveInAndOutValues &pair = blockMap[B];

    std::ostream &sin = std::cerr; // print on stderr

    sin << "Basic block: " << std::string(B->getName()) << std::endl;
    const LivenessAnalysis::LiveValues &liveIn = pair.first;
    sin << "LIVE_IN: " << liveIn.size() << std::endl;
    sin << liveIn << std::endl;
    const LivenessAnalysis::LiveValues &liveOut = pair.second;
    sin << "LIVE_OUT: " << liveOut.size() << std::endl;
    sin << liveOut << std::endl;
}

std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis &analysis) {
    for (auto it = analysis.blockMap.begin(), end = analysis.blockMap.end(); it != end; ++it) {
        const BasicBlock *BB = it->first;
        sin << "Basic block: " << std::string(BB->getName()) << std::endl;
        const LivenessAnalysis::LiveValues &liveIn = it->second.first;
        sin << "LIVE_IN: " << liveIn.size() << std::endl;
        sin << liveIn << std::endl;
        const LivenessAnalysis::LiveValues &liveOut = it->second.second;
        sin << "LIVE_OUT: " << liveOut.size() << std::endl;
        sin << liveOut << std::endl;
        sin << std::endl;
    }
    return sin;
}

std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis::LiveValues &values) {
    for (LivenessAnalysis::LiveValues::const_iterator begin = values.begin(), end = values.end(), it = begin; it != end; ++it) {
        const Value *V = *it;
        if (it != begin) sin << ", ";
        if (V->hasName()) {
            sin << std::string(V->getName());
        } else {
            sin << "NO_NAME_TYPE_" << V->getType()->getTypeID();
        }
    }
    return sin;
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
