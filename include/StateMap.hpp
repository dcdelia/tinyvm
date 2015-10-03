/* ===============================================================
 * State mapping component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_STATEMAP_HPP
#define	TINYVM_STATEMAP_HPP

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/ValueMap.h>
#include <llvm/Transforms/Utils/ValueMapper.h>

#include <map>

#include "Liveness.hpp"

class StateMap {
public:
    typedef llvm::SmallVectorImpl<llvm::Value*> CompCodeArgs;
    typedef llvm::SmallVectorImpl<llvm::Value*> CodeSequence;

    typedef struct CompCode {
        CompCodeArgs*   args;
        CodeSequence*   code;
        llvm::Value*    value;
    } CompCode;

    typedef struct ValueInfo {
        llvm::Value*    oneToOneValue;
        CompCode*       compCode;

        ValueInfo(llvm::Value* v)   : oneToOneValue(v), compCode(nullptr) {}
        ValueInfo(CompCode* c)      : oneToOneValue(nullptr), compCode(c) {}

        bool isOneToOneValue()  { return compCode == nullptr; }
        bool needsCompCode()    { return oneToOneValue == nullptr; }
    } ValueInfo;

    typedef std::map<llvm::Value*, ValueInfo*> ValueInfoMap;

    typedef struct LocPairInfo { // rename into LocPairInfo
        ValueInfoMap        valueInfoMap;
        CompCode*           globalCompCode; // value field == nullptr
    } LocPairInfo;


    // locations are LLVM instructions
    typedef std::pair<llvm::Instruction*, llvm::Instruction*> LocPair;
    typedef std::map<llvm::Instruction*, llvm::Instruction*> LocMap;
    typedef std::map<LocPair, LocPairInfo> LocPairInfoMap;

    /* Constructors */
/*
    StateMap(llvm::Function* F1, llvm::Function* F2, llvm::ValueToValueMapTy *VMap = nullptr) :
        F1(F1), F2(F2), defaultOneToOneMap(nullptr), F1_LA(LivenessAnalysis(F1)), F2_LA(LivenessAnalysis(F2))
    {
        if (VMap != nullptr) {
            for (llvm::ValueToValueMapTy::const_iterator it = VMap->begin(),
                    end = VMap->end(); it != end; ++ it) {
                llvm::Value* src_v = const_cast<llvm::Value*>(it->first);
                llvm::Value* dest_v = it->second;

            }
        }

    }
*/

    StateMap(llvm::Function* F1, llvm::Function* F2) :
        F1(F1), F2(F2), defaultOneToOneMap(new OneToOneValueMap()),
        F1_LA(LivenessAnalysis(F1)), F2_LA(LivenessAnalysis(F2)) {
    }

    StateMap(llvm::Function* F1, llvm::Function* F2, llvm::ValueToValueMapTy &VMap, bool reverseMap = false) : F1(F1), F2(F2),
        F1_LA(LivenessAnalysis(F1)), F2_LA(LivenessAnalysis(F2)) {
        defaultOneToOneMap = new OneToOneValueMap();
        for (llvm::ValueToValueMapTy::const_iterator it = VMap.begin(), end = VMap.end(); it != end; ++ it) {
            llvm::Value* src_v = const_cast<llvm::Value*>(it->first);
            llvm::Value* dest_v = it->second;
            registerOneToOneValue(src_v, dest_v, reverseMap);
            if (llvm::Instruction* OSRSrc = llvm::dyn_cast<llvm::Instruction>(src_v)) {
                if (!llvm::isa<llvm::PHINode>(OSRSrc)) {
                    registerLandingPad(OSRSrc, llvm::cast<llvm::Instruction>(dest_v), reverseMap);
                }
            }

        }
    }

    /* Public methods */
    std::pair<llvm::Function*, llvm::Function*> getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> getLivenessResults();

    // methods for generating OSR functions/stubs
    std::vector<llvm::Value*> getValuesToFetchAtOSRSrc(
                                llvm::Instruction* OSRSrc,
                                llvm::Instruction* LPad,
                                LivenessAnalysis::LiveValues *liveAtOSRSrc);

    std::vector<llvm::Value*>& getValuesToSetAtLPad(llvm::Instruction* LPad); // cached

    std::pair<llvm::BasicBlock*, llvm::ValueToValueMapTy*> genContinuationFunctionEntryPoint(
                                                                llvm::LLVMContext &Context,
                                                                llvm::Instruction* OSRSrc,
                                                                llvm::Instruction* LPad,
                                                                llvm::Instruction* OSRContLPad,
                                                                std::vector<llvm::Value*>& valuesToSetAtOSRCont,
                                                                llvm::ValueToValueMapTy& fetchedValuesToOSRContArgs);

    // methods for registering mapping information
    void    registerOneToOneValue(llvm::Value* src_v, llvm::Value* dest_v, bool bidirectional = false);
    void    registerLandingPad(llvm::Instruction* OSRSrc, llvm::Instruction* LPad, bool bidirectional = false);

    // TODO: methods for registering ValueInfo and LocPairInfo
    LocPairInfo& getOrCreateMapBlockPairInfo(LocPair &pair); // TODO separate methods??

    ValueInfo*  getValueInfo(llvm::Value* v, LocPair &pair); // TODO LocPairInfo as arg?

    // methods for querying
    llvm::Value*      getCorrespondingOneToOneValue(llvm::Value *v);
    llvm::Instruction* getLandingPad(llvm::Instruction* OSRSrc);

    // for testing and performance evaluation
    static std::pair<llvm::Function*, StateMap*> generateIdentityMapping(llvm::Function *F);

private:
    typedef std::map<llvm::Instruction*, std::vector<llvm::Value*>> ValuesToSetCache;
    typedef std::map<llvm::Value*, llvm::Value*> OneToOneValueMap; // avoid clash with llvm::ValueMap

    llvm::Function *F1, *F2;
    OneToOneValueMap*   defaultOneToOneMap;
    LocMap              landingPadMap;
    LocPairInfoMap      locPairInfoMap;
    LivenessAnalysis    F1_LA, F2_LA;
    ValuesToSetCache    cacheForValuesToSetAtLPad;

    // helper methods
    llvm::BasicBlock* addLocalCompensationCode(llvm::BasicBlock* curBlock, llvm::Value* dest_v, ValueInfo* valInfo,
        llvm::ValueToValueMapTy* updatedValuesToUse, llvm::ValueToValueMapTy &fetchedValuesToNewDestArgs);

};

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