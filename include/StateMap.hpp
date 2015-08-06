#ifndef TINYVM_STATEMAP_HPP
#define	TINYVM_STATEMAP_HPP

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <map>

#include "Liveness.hpp"

using namespace llvm;

class StateMap {
public:
    typedef std::pair<BasicBlock*, BasicBlock*> BlockPair;
    typedef SmallVectorImpl<Value*> CompCodeArgs;
    typedef SmallVectorImpl<BasicBlock*> BBSequence;

    typedef struct CompCode {
        CompCodeArgs*   args;
        BBSequence*     blocks;
        Value*          value;
    } CompCode;

    typedef struct ValueInfo {
        Value*      oneToOneValue;
        CompCode*   compCode;

        ValueInfo(Value* v)     : oneToOneValue(v), compCode(nullptr) {}
        ValueInfo(CompCode* c)  : oneToOneValue(nullptr), compCode(c) {}

        bool isOneToOneValue()  { return compCode == nullptr; }
        bool needsCompCode()    { return oneToOneValue == nullptr; }
    } ValueInfo;

    typedef std::map<Value*, ValueInfo*> ValueInfoMap;

    typedef struct BlockPairInfo {
        ValueInfoMap        valueInfoMap;
        CompCode*           globalCompCode; // value will be nullptr
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

    StateMap(Function* F1, Function* F2, ValueToValueMapTy &VMap, bool reverseMap = false) : F1(F1), F2(F2),
        F1LivenessAnalysis(LivenessAnalysis(F1)), F2LivenessAnalysis(LivenessAnalysis(F2)) {
        defaultOneToOneMap = new OneToOneValueMap();
        for (ValueToValueMapTy::const_iterator it = VMap.begin(), end = VMap.end(); it != end; ++ it) {
            defaultOneToOneMap->insert(std::pair<Value*, Value*>(it->second, const_cast<Value*>(it->first)));
            if (reverseMap) {
                defaultOneToOneMap->insert(std::pair<Value*, Value*>(const_cast<Value*>(it->first), it->second));
            }
        }
    }

    /* Public methods */
    std::pair<Function*, Function*> getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> getLivenessResults();
    std::vector<Value*>& getValuesToSetForDestFunction(BlockPair &pair); // & as they are cached
    std::vector<Value*> getValuesToFetchFromSrcFunction(BlockPair &pair); // TODO cache these too
    std::pair<BasicBlock*, ValueToValueMapTy*> createEntryPointForNewDestFunction(BlockPair &pair, BasicBlock* newDestBB,
        std::vector<Value*>& valuesToSetAtDest, ValueToValueMapTy& fetchedValuesToNewDestArgs, LLVMContext &Context);

    // TODO: methods for registering mapping information other than defaultOneToOneMap are missing

    // TODO: add more methods for querying
    Value*  getCorrespondingOneToOneValue(Value *v);


    // this method is static so that insertOpenOSR can access it
    static std::vector<Value*>* getValuesToSetForBlock(BasicBlock &B, LivenessAnalysis::LiveValues& liveInAtBlock);
    // for testing and performance evaluation
    static std::pair<Function*, StateMap*> generateIdentityMapping(Function *F);



private:
    Function *F1, *F2;
    OneToOneValueMap*   defaultOneToOneMap;
    BlockPairStateMap   blockPairStateMap;
    LivenessAnalysis    F1LivenessAnalysis, F2LivenessAnalysis;
    std::map<BasicBlock*, std::vector<Value*>> cacheForValuesToSetForBlocks;

};


#endif

