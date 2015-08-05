#ifndef TINYVM_STATEMAP_HPP
#define	TINYVM_STATEMAP_HPP

#include "llvm/IR/Function.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <map>

#include "Liveness.hpp"

using namespace llvm;

class StateMap {
public:
    typedef std::pair<BasicBlock*, BasicBlock*> BlockPair;
    typedef SmallVectorImpl<BasicBlock*> BBSequence;

    typedef struct ValueInfo {
        Value*      oneToOneValue;
        BBSequence* compCode;

        ValueInfo(Value* v) : oneToOneValue(v), compCode(nullptr) {};
        ValueInfo(BBSequence* seq) : oneToOneValue(nullptr), compCode(seq) {};
    } ValueInfo;

    typedef std::map<Value*, ValueInfo*> ValueInfoMap;

    typedef struct BlockPairInfo {
        ValueInfoMap        valueInfoMap;
        BBSequence*         globalCompCode;
    } BlockPairInfo;

    typedef std::map<Value*, Value*> OneToOneValueMap;
    typedef std::map<BlockPair, BlockPairInfo> BlockPairStateMap;

    /* Constructors */
    StateMap(Function* F1, Function* F2, OneToOneValueMap *defaultOneToOneMap = nullptr) :
        F1(F1), F2(F2), defaultOneToOneMap(defaultOneToOneMap),
        F1LivenessAnalysis(LivenessAnalysis(F1)), F2LivenessAnalysis(LivenessAnalysis(F2)) {
        if (defaultOneToOneMap == nullptr) {
            this->defaultOneToOneMap = new OneToOneValueMap();
        }
    }

    StateMap(Function* F1, Function* F2, ValueToValueMapTy &VMap) : F1(F1), F2(F2),
        F1LivenessAnalysis(LivenessAnalysis(F1)), F2LivenessAnalysis(LivenessAnalysis(F2)) {
        defaultOneToOneMap = new OneToOneValueMap();
        for (ValueToValueMapTy::const_iterator it = VMap.begin(), end = VMap.end(); it != end; ++ it) {
            defaultOneToOneMap->insert(std::pair<Value*, Value*>(const_cast<Value*>(it->first), it->second));
            defaultOneToOneMap->insert(std::pair<Value*, Value*>(it->second, const_cast<Value*>(it->first)));
        }
    }

    /* Public methods */
    std::pair<Function*, Function*> getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> getLivenessResults();
    std::vector<Value*>* getValuesToSetForDestFunction(BlockPair &pair);

    static std::pair<Function*, StateMap*> generateIdentityMapping(Function *F);
    static std::vector<Value*>* getValuesToSetForBlock(BasicBlock &B, LivenessAnalysis::LiveValues& liveInAtBlock);



private:
    Function *F1, *F2;
    OneToOneValueMap*   defaultOneToOneMap;
    LivenessAnalysis    F1LivenessAnalysis, F2LivenessAnalysis;

};


#endif

