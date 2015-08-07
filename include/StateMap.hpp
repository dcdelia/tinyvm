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
    typedef std::map<BasicBlock*, BasicBlock*>  BlockMap;
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
        CompCode*           globalCompCode; // value field == nullptr
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
            Value* src_v = const_cast<Value*>(it->first);
            Value* dest_v = it->second;
            registerOneToOneValue(src_v, dest_v, reverseMap);
            if (BasicBlock* src_b = dyn_cast<BasicBlock>(src_v)) {
                registerCorrespondingBlock(src_b, cast<BasicBlock>(dest_v), reverseMap);
            }
        }
    }

    /* Public methods */
    std::pair<Function*, Function*> getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> getLivenessResults();

    // methods for generating OSR functions/stubs
    std::vector<Value*>& getValuesToSetForDestFunction(BlockPair &pair); // & as they are cached
    std::vector<Value*> getValuesToFetchFromSrcFunction(BlockPair &pair);
    std::pair<BasicBlock*, ValueToValueMapTy*> createEntryPointForNewDestFunction(BlockPair &pair, BasicBlock* newDestBB,
        std::vector<Value*>& valuesToSetAtDest, ValueToValueMapTy& fetchedValuesToNewDestArgs, LLVMContext &Context);

    // methods for registering mapping information
    void    registerOneToOneValue(Value* src_v, Value* dest_v, bool bidirectional = false);
    void    registerCorrespondingBlock(BasicBlock* src_b, BasicBlock* dest_b, bool bidirectional = true);
    // TODO: methods for registering ValueInfo and BlockPairInfo

    // methods for querying
    Value*      getCorrespondingOneToOneValue(Value *v);
    BasicBlock* getCorrespondingBlock(BasicBlock *B);
    ValueInfo*  getValueInfo(Value* v, BlockPair &pair);

    // this method is static so that insertOpenOSR can access it
    static std::vector<Value*>* getValuesToSetForBlock(BasicBlock &B, LivenessAnalysis::LiveValues& liveInAtBlock);
    // for testing and performance evaluation
    static std::pair<Function*, StateMap*> generateIdentityMapping(Function *F);



private:
    Function *F1, *F2;
    OneToOneValueMap*   defaultOneToOneMap;
    BlockMap            correspondingBlockMap;
    BlockPairStateMap   blockPairStateMap;
    LivenessAnalysis    F1LivenessAnalysis, F2LivenessAnalysis;
    std::map<BasicBlock*, std::vector<Value*>> cacheForValuesToSetForBlocks;

};


#endif

