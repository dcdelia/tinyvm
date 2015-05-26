#ifndef TINYVM_LIVENESS_H
#define TINYVM_LIVENESS_H

#include <set>
#include <map>

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Value.h"

using namespace llvm;

class LivenessAnalysis {
    public:
        typedef std::set<const Value*> LiveValues;
        LivenessAnalysis(Function *fun): F(fun) {
            performLivenessAnalysis();
        }
        LiveValues& getLiveInValues(BasicBlock* B);
        LiveValues& getLiveOutValues(BasicBlock* B);
        void printResultsToScreen(BasicBlock* B);
        friend std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis &analysis);
        friend std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis::LiveValues &values);


    private:
        typedef std::pair<LiveValues, LiveValues> LiveInAndOutValues;
        typedef std::map<const BasicBlock*, LiveInAndOutValues> LiveValuesMap;

        Function*       F;
        LiveValuesMap   map;

        void performLivenessAnalysis();
        void analyzeBBwithPHINodes(const BasicBlock *B, const LiveValues &outValues, LiveValues &inValues, LiveValuesMap &map);
};

std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis &analysis);
std::ostream &operator<<(std::ostream &sin, const LivenessAnalysis::LiveValues &values);

#endif
