/* ===============================================================
 * Live variable analysis for LLVM Functions.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Liveness.hpp"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h" // const_pred_iterator
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/User.h" // const_op_iterator
#include "llvm/IR/Value.h"

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
 * **/
using namespace llvm;

// adapted from live_vars.cpp from the McOSR library
void LivenessAnalysis::analyzeBBwithPHINodes(const BasicBlock *B, const LivenessAnalysis::LiveValues &outValues, LivenessAnalysis::LiveValues &inValues, LivenessAnalysis::LiveValuesMap &map) {
    const BasicBlock::InstListType &instructions = B->getInstList();

    /* Initialize LIVE_IN[B] as a copy of LIVE_OUT[B], which might
     * have been updated by a call to analyzeBB on a B's successor */
    LiveValues currInValues(outValues);

    // process all the non-PHI instructions starting from the last in the block
    for (BasicBlock::InstListType::const_reverse_iterator revIt = instructions.rbegin(),
         end = instructions.rend(); revIt != end; ++revIt) {
        const Instruction *I = &*revIt;

        if (isa<PHINode>(I)) break; // PHI nodes will be processed separately

        /* Remove from LIVE_IN[B] elements that belong to KILL[B]
         * Update rule: KILL[d: y <- f(x1, ..., xN)] = {y} */
        currInValues.erase(I); // remove elements that belong to KILL[B]

        for (User::const_op_iterator opIt = I->op_begin(), opEnd = I->op_end();
             opIt != opEnd; ++opIt) {
            const Value *V = *opIt;
            /* Add to LIVE_IN[B] elements that belong to GEN[B]
             * Update rule: GEN[d: y <- f(x1, ..., xN)] = {x1, ..., xN} */
            if (isa<Instruction>(V) || isa<Argument>(V)) // we do not insert Constants
                currInValues.insert(V);
        }
    }

    // the inValues set can only grow across invocations of this method
    inValues.insert(currInValues.begin(), currInValues.end());

    // we will need these later
    BasicBlock::const_iterator firstNonPHIInstr = B->getFirstNonPHI();
    BasicBlock::const_iterator firstInstr = B->begin();

    // remove all the phi nodes created at this block from the set
    for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
        inValues.erase(&*it);
    }

    /** Process all the values used by the PHI nodes **/
    if (firstNonPHIInstr != firstInstr) {
        /* At least one PHI node exits: use it to initialize the LIVE_OUT
         * set of the predecessors; this is faster than using the
         * const_pred_iterator provided by CFG.h */
        const PHINode *phi = cast<PHINode>(&*firstInstr);

        for (int i = 0, e = phi->getNumIncomingValues(); i != e ; ++i) {
            const BasicBlock *pred = phi->getIncomingBlock(i); // we process each incoming BB

            LiveValues &predOutValues = map[pred].second;
            predOutValues.insert(inValues.begin(), inValues.end());
        }

        /* Now process the live values used by PHIs: in LLVM all the PHI
         * instructions are grouped together at the beginning of the block.
         *
         * Each incoming value in a PHI node is added to the LIVE_OUT set
         * of the predecessor from which the value is coming.
         */
        for (BasicBlock::const_iterator it = firstInstr; it != firstNonPHIInstr; ++it) {
            const PHINode *phi = cast<PHINode>(&*it);

            for (int i = 0, e = phi->getNumIncomingValues(); i != e ; ++i) {
                const BasicBlock *pred = phi->getIncomingBlock(i);
                const Value *V = phi->getIncomingValue(i);

                // add value to the LIVE_OUT set of the predecessor
                LiveValues &predOutValues = map[pred].second;
                if (isa<Instruction>(V) || isa<Argument>(V)) // we do not insert Constants
                    predOutValues.insert(V);
            }
        }
    } else {
        /* There is no PHI node: update the LIVE_OUT sets of the predecessors */
        for (const_pred_iterator it = pred_begin(B), end = pred_end(B);
             it != end ; ++it) {
            LiveValues &predOutValues = map[*it].second;
            predOutValues.insert(inValues.begin(), inValues.end());
        }
    }
}

void LivenessAnalysis::performLivenessAnalysis() {
    bool hasChanged;
    const Function::BasicBlockListType &blocks = F->getBasicBlockList();

    do {
        hasChanged = false;
        // use a reversed iterator as we have to perform backward analysis
        for (Function::BasicBlockListType::const_reverse_iterator rIt = blocks.rbegin(),
             end = blocks.rend(); rIt != end; ++rIt) {
            const BasicBlock *B = &*rIt;
            LiveInAndOutValues &currPair = map[B];
            LiveValues oldInValues = currPair.first; // create a copy to check for changes

            // we recompute LIVE_IN[B] and propagate the results to its predecessors
            analyzeBBwithPHINodes(B, currPair.second, currPair.first, map);

            hasChanged |= (currPair.first != oldInValues);
        }
    } while (hasChanged);
}

LivenessAnalysis::LiveValues& LivenessAnalysis::getLiveInValues(BasicBlock* B) {
    return map[B].first;
}

LivenessAnalysis::LiveValues& LivenessAnalysis::getLiveOutValues(BasicBlock* B) {
    return map[B].second;
}

void LivenessAnalysis::printResultsToScreen(BasicBlock* B) {
    assert(map.find(B) != map.end());
    LiveInAndOutValues &pair = map[B];

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
    for (auto it = analysis.map.begin(), end = analysis.map.end(); it != end; ++it) {
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
