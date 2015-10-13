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

/// \brief Track correlation between program points and values of two functions.
///
/// This class is an essential component of the OSRKit library. It is used by
/// a front-end to track the correlation between Value objects and between
/// program points (represented by Instructions) of two functions. OSRLibrary
/// relies on StateMap for generating the entry block in the continuation
/// function exploiting information provided by the front-end.
///
class StateMap {
public:
    // \brief Set of values from the source function used in compensation code.
    typedef llvm::SmallVectorImpl<llvm::Value*> CompCodeArgs;

    /// \brief Sequence of instructions for compensation code.
    typedef llvm::SmallVectorImpl<llvm::Value*> CodeSequence;

    /// \brief Compensation code object
    ///
    /// This object can be used to encode local (i.e., to reconstruct a specific
    /// Value) or global (i.e., to execute at the beginning of the continuation
    /// function, for instance to manipulate the heap) compensation code.
    ///
    /// Compensation code can be seen as a lambda function taking as arguments
    /// a subset of the live values transferred at an OSR point.
    typedef struct CompCode {
        /// \brief Arguments for the compensation code sequence.
        ///
        /// Arguments are pointers to Value objects from the source function
        /// for the OSR transitions.
        CompCodeArgs*   args;
        /// \brief
        CodeSequence*   code;
        /// \brief Value computed by the compensation code
        ///
        /// For local compensation code only, it should correspond to the last
        /// instruction in \a code. Use \c nullptr for global compensation code.
        llvm::Value*    value;
    } CompCode;

    /// \brief Express LocPair-dependent mapping information for a Value
    ///
    /// Union-like data structure to express mapping information for a Value to
    /// set in the OSR target function. It is specific to a LocPair and encodes
    /// either a compensation code or a Value from the OSR source function that
    /// can be used to set this Value.
    typedef struct ValueInfo {
        /// \brief Value from the source function to use
        llvm::Value*    oneToOneValue;

        /// \brief Compensation code to reconstruct the value
        CompCode*       compCode;

        /// \brief Constructor for a Value from the source function.
        ///
        /// \param v Value from the OSR source function to use.
        ValueInfo(llvm::Value* v)   : oneToOneValue(v), compCode(nullptr) {}

        /// \brief Constructor for a CompCode.
        ///
        /// \param c Pointer to the CompCode object to use.
        ValueInfo(CompCode* c)      : oneToOneValue(nullptr), compCode(c) {}

        /// \brief Check if the object holds a Value from the source function
        ///
        /// \return Returns \c true when the object holds in \a oneToOneValue a
        /// Value from the OSR source function, \c false otherwise.
        bool isOneToOneValue()  { return compCode == nullptr; }

        /// \brief Check if the objects holds a compensation code
        ///
        /// \return Returns \c true when the object holds in \a compCode a
        /// CompCode object to reconstruct the value, \c false otherwise.
        bool needsCompCode()    { return oneToOneValue == nullptr; }
    } ValueInfo;


    /// \brief Compensation code information for a specific LocPair.
    typedef struct LocPairInfo {
        typedef std::map<llvm::Value*, ValueInfo*> ValueInfoMap;

        ValueInfoMap        valueInfoMap;
        CompCode*           globalCompCode; // value field == nullptr
    } LocPairInfo;


    /// \brief Pair of (corresponding) program locations.
    ///
    /// Program locations are expressed as LLVM Instruction objects.
    typedef std::pair<llvm::Instruction*, llvm::Instruction*> LocPair;

    /// \brief Map between pairs of locations and corresponding compensation
    /// code information.
    typedef std::map<LocPair, LocPairInfo> LocPairInfoMap;

    /// \brief Construct a StateMap object
    ///
    /// The constructed StateMap object can be either empty, or initialized
    /// using a ValueToValueMapTy (generated for instance when cloning \a F2
    /// from \a F1).
    ///
    /// For each entry (\c k, \c v) in \a VMap, OSRKit assumes that \c k is a
    /// pointer to a Value in F1 and \c v is the corresponding Value in \a F2.
    /// This implies that when a continuation function is generated for an OSR
    /// from \a F1 to \a F2, each use of \c v in \a F2 can be replaced with the
    /// transferred value for \c k; we refer to this property as a 1:1 mapping,
    /// as the value to transfer from \a F1 to set \a v is the same for all the
    /// feasible pairs of OSR source locations and landing pads.
    ///
    /// Typically, a 1:1 mapping is also \c bidirectional: that is, when
    /// generating a continuation function for an OSR transition from \a F2 to
    /// \a F1, each use of \c k can be replaced with the transferred value for
    /// \c v.
    ///
    /// For each entry (\c k, \c v) in \a VMap, if both \c k and \c v point to
    /// Instruction objects, OSRKit assumes that \c v is the landing pad for an
    /// OSR transition to \a F2 originated at \c k in \a F2. For bidirectional
    /// mappings, \c k becomes the landing pad for an OSR originated at \c v.
    ///
    /// Information for values for which there is no 1:1 corresponding value can
    /// later be set using createLocPairInfo() and registerLandingPad().
    ///
    /// \param F1 First function for the mapping.
    /// \param F2 Second function for the mapping.
    /// \param VMap Map from Value objects in \a F1 to Value objects in \a F2;
    /// use \c nullptr when such a map is not available.
    /// \param bidirectional Flag that specifies whether the passed \a VMap is
    /// bidirectional.
    StateMap(llvm::Function* F1, llvm::Function* F2, llvm::ValueToValueMapTy *VMap = nullptr,
            bool bidirectional = false) : F1(F1), F2(F2), F1_LA(LivenessAnalysis(F1)),
            F2_LA(LivenessAnalysis(F2)) {
        if (VMap == nullptr) return;
        for (llvm::ValueToValueMapTy::const_iterator it = VMap->begin(),
                end = VMap->end(); it != end; ++ it) {
            llvm::Value* src_v = const_cast<llvm::Value*>(it->first);
            llvm::Value* dest_v = it->second;
            registerOneToOneValue(src_v, dest_v, bidirectional);
            if (llvm::Instruction* OSRSrc = llvm::dyn_cast<llvm::Instruction>(src_v)) {
                if (!llvm::isa<llvm::PHINode>(OSRSrc)) {
                    registerLandingPad(OSRSrc, llvm::cast<llvm::Instruction>(dest_v), bidirectional);
                }
            }
        }
    }

    /// \brief Get the two functions in the StateMap.
    ///
    /// \return Returns a pair with the current first and second function.
    std::pair<llvm::Function*, llvm::Function*> getFunctions();

    /// \brief Get LivenessAnalysis information for the mapped functions.
    ///
    /// \return Returns a pair where the first and second element are the
    /// LivenessAnalysis information for the first and second function,
    /// respectively.
    std::pair<LivenessAnalysis&, LivenessAnalysis&> getLivenessResults();

    /* Methods for generating OSR functions/stubs */

    /// \brief Compute the values to transfer for an OSR transition.
    ///
    /// Values in the sequence typically belong to the liveIn set at \a OSRSrc.
    /// However, it is possible that compensation code specific to the pair (\a
    /// OSRSrc, \a LPad) might require Value objects not live at \a OSRSrc.
    ///
    /// \param OSRSrc Location for OSR point insertion in the source function.
    /// \param LPad Landing pad in the target function for the OSR transition.
    /// \return Sequence of Value objects to transfer at the OSR point.
    std::vector<llvm::Value*> getValuesToFetchAtOSRSrc(
                                llvm::Instruction* OSRSrc,
                                llvm::Instruction* LPad);

    /// \brief Compute values to set at an OSR landing pad.
    ///
    /// A reference is returned as results are cached.
    ///
    /// \param LPad Landing pad in the target function for the OSR transition.
    /// \return Sequence of Value objects to set at the OSR landing pad.
    std::vector<llvm::Value*>& getValuesToSetAtLPad(llvm::Instruction* LPad);

    std::pair<llvm::BasicBlock*, llvm::ValueToValueMapTy*> genContinuationFunctionEntryPoint(
                                                                llvm::LLVMContext &Context,
                                                                llvm::Instruction* OSRSrc,
                                                                llvm::Instruction* LPad,
                                                                llvm::Instruction* OSRContLPad,
                                                                std::vector<llvm::Value*>& valuesToSetAtOSRCont,
                                                                llvm::ValueToValueMapTy& fetchedValuesToOSRContArgs);

    /* Methods for registering mapping information */
    void    registerOneToOneValue(llvm::Value* src_v, llvm::Value* dest_v, bool bidirectional = false);
    void    registerLandingPad(llvm::Instruction* OSRSrc, llvm::Instruction* LPad, bool bidirectional = false);

    // TODO: methods for registering ValueInfo and LocPairInfo
    LocPairInfo& getLocPairInfo(LocPair &pair); // TODO separate methods??

    /// \brief catacok
    LocPairInfo& createLocPairInfo(LocPair &pair); // TODO separate methods??

    ValueInfo*  getValueInfo(llvm::Value* v, LocPair &pair); // TODO LocPairInfo as arg?

    /* methods for querying */
    llvm::Value*      getCorrespondingOneToOneValue(llvm::Value *v);
    llvm::Instruction* getLandingPad(llvm::Instruction* OSRSrc);

    /// \brief Clone a function and generate a StateMap accordingly.
    ///
    /// \param F Function to clone.
    /// \return Returns a pair where the first element is the cloned function,
    /// and the second element is a StateMap between \a F and its clone.
    static std::pair<llvm::Function*, StateMap*> generateIdentityMapping(llvm::Function *F);

private:
    typedef std::map<llvm::Instruction*, llvm::Instruction*> LocMap;
    typedef std::map<llvm::Instruction*, std::vector<llvm::Value*>> ValuesToSetCache;
    typedef std::map<llvm::Value*, llvm::Value*> OneToOneValueMap; // avoid clash with llvm::ValueMap

    llvm::Function      *F1, *F2;
    OneToOneValueMap    defaultOneToOneMap;
    LocMap              landingPadMap;
    LocPairInfoMap      locPairInfoMap;
    LivenessAnalysis    F1_LA, F2_LA;
    ValuesToSetCache    valuesToSetAtLPadCache;

    // helper methods
    static void updateRefsToArgs(CompCode* compCode, llvm::ValueToValueMapTy &VMap);
    llvm::BasicBlock* addLocalCompensationCode(llvm::BasicBlock* curBlock, llvm::Value* dest_v, ValueInfo* valInfo,
        llvm::ValueToValueMapTy* updatedValuesToUse, llvm::ValueToValueMapTy &fetchedValuesToNewDestArgs);
    llvm::BasicBlock* addGlobalCompensationCode(llvm::BasicBlock* curBlock,
        CompCode* compCode, llvm::ValueToValueMapTy &fetchedValuesToNewDestArgs);


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