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

class LivenessAnalysis {
    public:
        typedef std::set<const llvm::Value*> LiveValues;
        LivenessAnalysis(llvm::Function *F): F(F) {
            run();
        }
        LiveValues& getLiveInValues(const llvm::BasicBlock* B);
        LiveValues& getLiveOutValues(const llvm::BasicBlock* B);

        static LiveValues analyzeLiveInForSeq(const llvm::BasicBlock* B, const LiveValues &liveOut,
            const llvm::Instruction* first, const llvm::Instruction* last = nullptr);

        void updateLiveValues(const llvm::BasicBlock* B, LiveValues &&liveIn, LiveValues &&liveOut);

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