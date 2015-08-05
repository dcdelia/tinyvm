#ifndef TINYVM_STATEMAP_H
#define TINYVM_STATEMAP_H

#include "Liveness.hpp"

#include <map>
#include <vector>

#include "llvm/IR/Function.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

using namespace llvm;

class OldStateMap {
    public:
        typedef std::pair<BasicBlock*, BasicBlock*> BBSrcDestPair;
        typedef ValueMap<Value*, std::vector<Value*>> ValueToValuesMap;
        typedef std::map<BasicBlock*, std::vector<Value*>> ValuesForBlockMap;
        OldStateMap(Function* src, Function* dest, ValueToValuesMap* VVsMap) : src(src), dest(dest),
            srcLiveValueAnalysis(LivenessAnalysis(src)), destLiveValueAnalysis (LivenessAnalysis(dest)),
            VVsMap(VVsMap), reverseVVsMap(flipValueToValuesMap(VVsMap)) { }
        // TODO: destructor
        LivenessAnalysis& getLivenessResultsForSrcFunction();
        LivenessAnalysis& getLivenessResultsForDestFunction();
        virtual std::vector<Value*> &getValuesToFetchFromSrcFunction(BBSrcDestPair &srcDestBlocks);
        virtual std::vector<Value*> &getValuesToSetForDestFunction(BBSrcDestPair &srcDestBlocks);
        virtual BasicBlock* createEntryPointForOSRDestFunction(BBSrcDestPair &srcDestBlocks, Function *OSRDestFun,
                            ValueToValueMapTy &destToOSRDestVMap, ValueToValueMapTy &updatesForDestToOSRDestVMap,
                            std::vector<Value*> &fetchedValuesAsArgs);
        static ValueToValuesMap* convertValueToValueMapTy(ValueToValueMapTy &Map);
    private:
        // do not change this order!
        Function *src, *dest;
        LivenessAnalysis srcLiveValueAnalysis, destLiveValueAnalysis;
        ValueToValuesMap *VVsMap, *reverseVVsMap;
        ValuesForBlockMap valuesToFetchFromSrc, valuesToFetchAtDest;

        static ValueToValuesMap* flipValueToValuesMap(ValueToValuesMap *Map);
};

#endif
