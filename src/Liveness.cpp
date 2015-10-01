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
 * s is a generic basic block and f is the exit basic block.
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


LivenessAnalysis::LiveValues LivenessAnalysis::analyzeLiveInForSeq(const BasicBlock* B, const
        LivenessAnalysis::LiveValues &liveOut, const Instruction* first, const Instruction* last) {
    // initially LIVE_IN = LIVE_OUT
    LiveValues liveIn(liveOut);

    BasicBlock::InstListType::const_reverse_iterator revIt = B->getInstList().rbegin();
    while (last && &*(revIt++) != last);

    const Instruction* I;
    do {
        I = &*(revIt++);

        // remove elements that belong to KILL set
        liveIn.erase(I);

        // add elements that belong to GEN set (ignore constants and globals)
        for (User::const_op_iterator opIt = I->op_begin(), opEnd = I->op_end();
                opIt != opEnd; ++opIt) {
            const Value* V = *opIt;
            if (isa<Instruction>(V) || isa<Argument>(V))
                liveIn.insert(V);
        }
    } while (I != first);

    return liveIn;
}

bool LivenessAnalysis::processBlock(const BasicBlock *B,
    LivenessAnalysis::LiveValues &inValues,
    const LivenessAnalysis::LiveValues &outValues) {

    BasicBlock::const_iterator firstNonPHIInstr = B->getFirstNonPHI();
    BasicBlock::const_iterator firstInstr = B->begin();

    // compute LIVE_IN[B] (which might include PHI nodes defined in B) since
    // LIVE_OUT[B] might have changed while analyzing a successor of B
    LiveValues currInValues = analyzeLiveInForSeq(B, outValues, &*firstNonPHIInstr);

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
    const PHINode* phi = cast<PHINode>(&*firstInstr);
    int numPredecessors = cast<PHINode>(&*firstInstr)->getNumIncomingValues();

    for (int i = 0; i < numPredecessors; ++i) {
        const BasicBlock* pred = phi->getIncomingBlock(i);

        LiveValues &predOutValues = blockMap[pred].second;
        predOutValues.insert(inValues.begin(), inValues.end());
    }

    // process PHI nodes in B: each incoming value is added to the LIVE_OUT set
    // of the predecessor from which the value is coming.
    for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
        phi = cast<PHINode>(&*it);

        for (int i = 0; i < numPredecessors; ++i) {
            const BasicBlock* pred = phi->getIncomingBlock(i);
            const Value* V = phi->getIncomingValue(i);
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

    // perform backward analysis using a reverse iterator on basic blocks: at
    // each step recompute LIVE_IN[B] and update B's predecessors
    do {
        hasChanged = false;
        for (Function::BasicBlockListType::const_reverse_iterator revIt = blocks.rbegin(),
                revEnd = blocks.rend(); revIt != revEnd; ++revIt) {
            const BasicBlock* B = &*revIt;
            LiveInAndOutValues &currPair = blockMap[B];

            hasChanged |= processBlock(B, currPair.first, currPair.second);
        }
    } while (hasChanged);
}

LivenessAnalysis::LiveValues& LivenessAnalysis::getLiveInValues(const BasicBlock* B) {
    return blockMap[B].first;
}

LivenessAnalysis::LiveValues& LivenessAnalysis::getLiveOutValues(const BasicBlock* B) {
    return blockMap[B].second;
}

void LivenessAnalysis::updateLiveValues(const llvm::BasicBlock* B,
        LivenessAnalysis::LiveValues &&liveIn, LivenessAnalysis::LiveValues &&liveOut) {
    blockMap[B] = std::pair<LiveValues, LiveValues>(std::move(liveIn), std::move(liveOut));
}

std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis::LiveValues &values) {
    for (LivenessAnalysis::LiveValues::const_iterator begin = values.begin(),
            end = values.end(), it = begin; it != end; ++it) {
        const Value* V = *it;
        if (it != begin) sin << ", ";
        if (V->hasName()) {
            sin << std::string(V->getName());
        } else {
            sin << "ANON-TY" << V->getType()->getTypeID();
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
