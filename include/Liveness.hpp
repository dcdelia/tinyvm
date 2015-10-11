/* ===============================================================
 * Live variable analysis for LLVM Functions.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_LIVENESS_H
#define TINYVM_LIVENESS_H

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>

#include <set>
#include <map>
#include <ostream>
#include <utility>

/// \brief Compute liveness analysis information for a function
///
/// This class performs backward data-flow analysis to determine the set of
/// Value objects that are live at the beginning and at the end of a BasicBlock.
///
/// A PHINode defined and then used in the same block will not appear in the
/// liveIn set for the block, as it is killed before it is used. A live Value
/// can be either an Argument or an Instruction, but never a Constant.
class LivenessAnalysis {
    public:

        /// \brief Live values are stored as a simple set
        typedef std::set<const llvm::Value*> LiveValues;

        /// \brief Constructor
        LivenessAnalysis(llvm::Function *F): F(F) {
            run();
        }

        /// \brief Return the \e liveIn set for a BasicBlock
        LiveValues& getLiveInValues(const llvm::BasicBlock* B);

        /// \brief Return the \e liveOut set for a BasicBlock
        LiveValues& getLiveOutValues(const llvm::BasicBlock* B);

        /// \brief Compute \e liveIn set for a sequence of instructions
        ///
        /// This method is useful to compute the \e liveIn set when are about to
        /// split a BasicBlock. Given the \a liveOut set for the block and the
        /// instruction \a last from where to start the backward analysis, it
        /// computes the set of liveIn values until \a first is reached. Both
        /// \a last and \a first must be instruction contained in \a B.
        static LiveValues analyzeLiveInForSeq(const llvm::BasicBlock* B,
                                                const LiveValues &liveOut,
                                                const llvm::Instruction* first,
                                                const llvm::Instruction* last = nullptr);

        /// \brief Perform liveness analysis again (function has been modified).
        void updateAllLiveValues() { run(); }

        /// \brief Manually update liveness results for a BasicBlock
        void updateLiveValuesForBlock(const llvm::BasicBlock* B,
                                LiveValues &&liveIn,
                                LiveValues &&liveOut);

        /// \brief Print a LiveValues object to an output stream
        friend std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis::LiveValues &values);

    private:
        typedef std::pair<LiveValues, LiveValues> LiveInAndOutValues;
        typedef std::map<const llvm::BasicBlock*, LiveInAndOutValues> BlockToLiveValuesMap;

        llvm::Function* F;
        BlockToLiveValuesMap blockMap;

        void run();
        bool processBlock(const llvm::BasicBlock *B, LiveValues &inValues, const LiveValues &outValues);
};

std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis::LiveValues &values);

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