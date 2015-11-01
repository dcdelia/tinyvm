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

/// \brief Map program points and values from two functions.
///
/// This class is an essential component of the OSRKit library. A front-end can
/// encode in a StateMap object correlation information between Value objects
/// and between program points (i.e., Instruction objects) from two functions.
/// OSRLibrary relies on StateMap to generate the entry block for OSR
/// continuation functions.
///
class StateMap {
public:
    /// \brief Values from the source function required by a compensation code.
    typedef llvm::SmallVectorImpl<llvm::Value*> CompCodeArgs;

    /// \brief Sequence of instructions to express a compensation code.
    typedef llvm::SmallVectorImpl<llvm::Value*> CodeSequence;

    /// \brief Compensation code object
    ///
    /// This object can be used to encode local (i.e., required to reconstruct a
    /// specific Value) or global (i.e., to be executed at the beginning of the
    /// continuation function) compensation code.
    ///
    /// A CompCode is essentially a lambda function that takes as arguments a
    /// subset of the live values transferred at an OSR point.
    typedef struct CompCode {
        /// \brief Arguments for the compensation code sequence.
        ///
        /// Arguments are pointers to Value objects from the source function
        /// transferred during an OSR transition.
        CompCodeArgs*   args;

        /// \brief Sequence of instructions to reconstruct the value.
        ///
        /// In each instruction in the sequence, each operand can be a Value
        /// from \a args, a Constant, or a previous Instruction from the
        /// sequence.
        CodeSequence*   code;

        /// \brief Value computed by the compensation code
        ///
        /// For local compensation code, it should correspond to the last
        /// instruction in \a code. For global compensation code, \c nullptr
        /// should be used.
        llvm::Value*    value;
    } CompCode;

    /// \brief Express LocPair-specific mapping information for a Value
    ///
    /// Data structure used to express mapping information for a Value to set
    /// in the OSR target function. It is specific to a LocPair and contains
    /// either a CompCode object or a Value from the OSR source function that -
    /// although it does not provide a more general 1:1 mapping - can be still
    /// transferred to set this Value for the current LocPair.
    ///
    /// \sa StateMap()
    typedef struct ValueInfo {
        /// \brief Value from the source function to use
        llvm::Value*    oneToOneValue;

        /// \brief Compensation code to reconstruct the value
        CompCode*       compCode;

        /// \brief Constructor for using a Value from the source function.
        ///
        /// \param v Value from the OSR source function to use.
        ValueInfo(llvm::Value* v)   : oneToOneValue(v), compCode(nullptr) {}

        /// \brief Constructor for encoding a CompCode.
        ///
        /// \param c Pointer to the CompCode object to use.
        ValueInfo(CompCode* c)      : oneToOneValue(nullptr), compCode(c) {}

        /// \brief Check if the object holds a Value from the source function
        ///
        /// \return \c true when the object holds (in its \a oneToOneValue
        /// field) a Value from the OSR source function, \c false otherwise.
        bool isOneToOneValue()  { return compCode == nullptr; }

        /// \brief Check if the objects holds a compensation code
        ///
        /// \return \c true when the object holds (in its \a compCode field) a
        /// CompCode object to reconstruct the value, \c false otherwise.
        bool needsCompCode()    { return oneToOneValue == nullptr; }
    } ValueInfo;


    /// \brief Compensation code information specific to a LocPair.
    typedef struct LocPairInfo {
        /// \brief Map between LLVM Value and ValueInfo objects.
        typedef std::map<llvm::Value*, ValueInfo*> ValueInfoMap;

        /// \brief Associates an LLVM Value with its corresponding ValueInfo (if
        /// any).
        ValueInfoMap        valueInfoMap;

        /// \brief Global compensation code specific to the LocPair.
        CompCode*           globalCompCode;

        /// \brief Get the ValueInfo object for a given Value.
        ///
        /// \param v LLVM Value for the query.
        /// \return A pointer to the ValueInfo object associated with \a v, or
        /// \c nullptr if a corresponding object does not exist.
        ValueInfo* getValueInfo(llvm::Value* v);

        /// \brief Associate a ValueInfo object with a Value.
        ///
        /// \param v LLVM Value for the operation.
        /// \param VI ValueInfo object generated by the front-end for \a v.
        void setValueInfo(llvm::Value* v, ValueInfo* VI);
    } LocPairInfo;


    /// \brief Pair of (related) program locations.
    ///
    /// Program locations are expressed as LLVM Instruction objects.
    typedef std::pair<llvm::Instruction*, llvm::Instruction*> LocPair;

    /// \brief Map between pairs of locations and corresponding compensation
    /// code information.
    typedef std::map<LocPair, LocPairInfo> LocPairInfoMap;

    /// \brief Map between program locations from different functions.
    typedef std::map<llvm::Instruction*, llvm::Instruction*> LocMap;

    /// \brief Map between values and their corresponding 1:1 values.
    /// \sa StateMap()
    typedef std::map<llvm::Value*, llvm::Value*> OneToOneValueMap;

    /// \brief Construct a StateMap object
    ///
    /// The constructed StateMap object can be either empty, or initialized
    /// using a ValueToValueMapTy (generated for instance by LLVM when cloning
    /// \a F2 from \a F1).
    ///
    /// For each entry (\c k, \c v) in \a VMap, OSRKit assumes that \c k is a
    /// pointer to a Value in F1 and \c v is the corresponding Value in \a F2.
    /// This implies that when a continuation function is generated for an OSR
    /// from \a F1 to \a F2, each use of \c v in \a F2 can be replaced with the
    /// transferred value for \c k; we refer to this property as a 1:1 mapping,
    /// as the value to transfer from \a F1 to set \a v is the same for all the
    /// feasible pairs of OSR source locations and landing pads.
    ///
    /// Typically, a 1:1 mapping is also \e bidirectional: that is, when
    /// generating a continuation function for an OSR transition from \a F2 to
    /// \a F1, each use of \c k can be replaced with the transferred value for
    /// \c v.
    ///
    /// For each entry (\c k, \c v) in \a VMap, if both \c k and \c v are
    /// pointers to Instruction objects, OSRKit assumes that \c v is the landing
    /// pad for an OSR transition to \a F2 originated at \c k in \a F1. For
    /// bidirectional mappings, \c k also becomes the landing pad for an OSR
    /// from \a F2 to \a F1 originated at \c v.
    ///
    /// When a \a VMap is not provided, the front-end can encode information on
    /// 1:1 mappings and landing pads using the registerOneToOneValue() and
    /// registerLandingPad() methods, respectively. In fact, OSRKit does not
    /// require a StateMap to be \a complete (i.e., containing information for
    /// all Value and feasible LocPair objects) in order to encode an OSR, but
    /// only to provide a landing pad in the target function for the OSR source
    /// location and to maintain information for live variables at the landing
    /// pad.
    ///
    /// Finally, information for values for which there is no 1:1 corresponding
    /// value can be set using createLocPairInfo() and
    /// LocPairInfo::setValueInfo().
    ///
    /// \param F1 First function for the mapping.
    /// \param F2 Second function for the mapping.
    /// \param VMap Map from Value objects in \a F1 to Value objects in \a F2
    /// for which a 1:1 mapping can be assumed; use \c nullptr when such a map
    /// is not available.
    /// \param bidirectional Specifies whether the passed \a VMap is
    /// bidirectional.
    /// \sa LocPairInfo
    StateMap(llvm::Function* F1, llvm::Function* F2, llvm::ValueToValueMapTy *VMap = nullptr,
            bool bidirectional = false) : F1(F1), F2(F2), F1_LA(LivenessAnalysis(F1)),
            F2_LA(LivenessAnalysis(F2)) {
        if (VMap == nullptr) return;
        for (llvm::ValueToValueMapTy::const_iterator it = VMap->begin(),
                end = VMap->end(); it != end; ++ it) {
            llvm::Value* src_v = const_cast<llvm::Value*>(it->first);
            llvm::Value* dest_v = it->second;
            if (!llvm::isa<llvm::Argument>(src_v) && !llvm::isa<llvm::Instruction>(src_v)) {
                continue;
            }
            registerOneToOneValue(src_v, dest_v, bidirectional);
            if (llvm::Instruction* OSRSrc = llvm::dyn_cast<llvm::Instruction>(src_v)) {
                if (!llvm::isa<llvm::PHINode>(OSRSrc)) {
                    registerLandingPad(OSRSrc, llvm::cast<llvm::Instruction>(dest_v), bidirectional);
                }
            }
        }
    }

    /// \brief Get the two functions mapped by the StateMap.
    ///
    /// \return A pair containing pointers to the two functions.
    std::pair<llvm::Function*, llvm::Function*> getFunctions();

    /// \brief Get LivenessAnalysis information for the mapped functions.
    ///
    /// \return A pair where the first and second element are the
    /// LivenessAnalysis objects computed for the first and second function in
    /// the pair returned by getFunctions().
    std::pair<LivenessAnalysis&, LivenessAnalysis&> getLivenessResults();

    /* Methods for generating OSR functions/stubs */

    /// \brief Compute values to transfer for an OSR transition.
    ///
    /// Values in the sequence typically belong to the liveIn set at \a OSRSrc.
    /// In general, it is possible that a CompCode specific to the LocPair
    /// (\a OSRSrc, \a LPad) might also need Value objects not live at \a OSRSrc:
    /// in this case, OSRKit will artificially extend their liveness range.
    ///
    /// \param OSRSrc Location for OSR point insertion in the source function.
    /// \param LPad Landing pad in the target function for the OSR transition.
    /// \return Sequence of Value objects to transfer at the OSR point.
    std::vector<llvm::Value*> getValuesToFetchAtOSRSrc(
                                llvm::Instruction* OSRSrc,
                                llvm::Instruction* LPad);

    /// \brief Compute live values at an OSR landing pad.
    ///
    /// The OSR continuation function has to initialize these values in order to
    /// resume the execution.
    ///
    /// A reference is returned since results for these queries are cached
    /// inside the StateMap object for efficiency reasons.
    ///
    /// \param LPad Landing pad in the target function for the OSR transition.
    /// \return Sequence of Value objects to set at the OSR landing pad.
    std::vector<llvm::Value*>& getValuesToSetAtLPad(llvm::Instruction* LPad);

    /// \brief Generate entry block for an OSR continuation function
    ///
    /// The entrypoint will instantiate any global or local compensation code
    /// needed for the LocPair represented by \a OSRSrc and \a LPad. This method
    /// also generates a map - required by OSRLibrary::genContinuationFunc() -
    /// that associates values to set in the continuation function with either
    /// transferred values from the OSR source function, or with a value
    /// reconstructed in the entry point using local compensation code.
    ///
    /// \param Context LLVM Context to use for OSRKit.
    /// \param OSRSrc Instruction in the source function for which an OSR
    /// decision is taken.
    /// \param LPad Landing pad in the target function for \a OSRSrc.
    /// \param OSRContLPad Instruction in the OSR continuation function
    /// corresponding to \a LPad.
    /// \param valuesToSetAtOSRCont Live values to set in the continuation
    /// function to resume the execution.
    /// \param fetchedValuesToOSRContArgs Map between values from the source
    /// function transferred at the OSR point and corresponding arguments of the
    /// OSR continuation function.
    /// \return A pair where the first element is a BasicBlock suitable as
    /// entrypoint for the OSR continuation function, and the second element is
    /// a map between live values to set and arguments/reconstructed values.
    std::pair<llvm::BasicBlock*, llvm::ValueToValueMapTy*> genContinuationFunctionEntryPoint(
                            llvm::LLVMContext &Context,
                            llvm::Instruction* OSRSrc,
                            llvm::Instruction* LPad,
                            llvm::Instruction* OSRContLPad,
                            std::vector<llvm::Value*>& valuesToSetAtOSRCont,
                            llvm::ValueToValueMapTy& fetchedValuesToOSRContArgs);

    /// \brief Set 1:1 mapping information for a Value.
    ///
    /// \param src_v Value in the OSR source function.
    /// \param dest_v Value in the target function for the OSR transition.
    /// \param bidirectional When \c true, it specifies that dest_v is also the
    /// 1:1 corresponding value for src_v when the source and target functions
    /// are swapped in their roles.
    void registerOneToOneValue(llvm::Value* src_v,
                            llvm::Value* dest_v,
                            bool bidirectional = false);

    /// \brief Discard 1:1 mapping information for a Value.
    ///
    /// \param src_v Value for which 1:1 mapping information is to discard.
    void unregisterOneToOneValue(llvm::Value* src_v);

    /// \brief Set the landing pad for an OSR source location.
    ///
    /// \param OSRSrc Location in the OSR source function.
    /// \param LPad Location in the OSR target function suitable as landing pad
    /// for an OSR transition originated at \a OSRSrc.
    /// \param bidirectional When \c true, it specifies that \a OSRSrc is also
    /// the landing pad for an OSR transition originated at \a LPad when the
    /// source and target functions are swapped in their roles.
    void registerLandingPad(llvm::Instruction* OSRSrc,
                            llvm::Instruction* LPad,
                            bool bidirectional = false);

    /// \brief Discard landing pad information for a Value.
    ///
    /// \param OSRSrc Location for which landing pad information is to discard.
    void unregisterLandingPad(llvm::Instruction* OSRSrc);

    /// \brief Get mapping information specific to a LocPair
    ///
    /// \param pair LocPair for which we want to retrieve mapping information.
    /// \return A pointer to the existing LocPairInfo object inside the StateMap
    /// for the given \a pair, or \c nullptr when such an object does not exist.
    LocPairInfo* getLocPairInfo(LocPair &pair);

    /// \brief Create mapping information specific to a LocPair
    ///
    /// \param pair LocPair for which we want to encode mapping information.
    /// \return A pointer to the LocPairInfo object created inside the StateMap
    /// for the given \a pair.
    LocPairInfo* createLocPairInfo(LocPair &pair);

    /* methods for querying */
    /// \brief Get the 1:1 corresponding value for a given value.
    ///
    /// \param v Value from the target function for the OSR.
    /// \return The 1:1 corresponding Value from the source function, or \c
    /// nullptr when such a Value does not exist.
    /// \sa StateMap()
    llvm::Value*      getCorrespondingOneToOneValue(llvm::Value *v);

    /// \brief Get all pairs of values and their corresponding 1:1 values.
    /// \return A reference to the OneToOneValueMap maintained by the object.
    /// \sa StateMap()
    OneToOneValueMap& getAllCorrespondingOneToOneValues() {
        return defaultOneToOneMap;
    }

    /// \brief Get the landing pad for a given OSR source location.
    ///
    /// \param OSRSrc Instruction to use as source of an OSR transition.
    /// \return The Instruction from the target function that represents the
    /// landing pad for the OSR transition, or \c nullptr when an OSR from \a
    /// OSRSrc is not feasible.
    llvm::Instruction* getLandingPad(llvm::Instruction* OSRSrc);

    /// \brief Get all pairs of OSR source locations and corresponding landing
    /// pads
    /// \return A reference to the LocMap maintained by the object.
    LocMap& getAllLandingPads() {
        return landingPadMap;
    }

    /// \brief Clone a function and generate a StateMap.
    ///
    /// \param F Function to clone.
    /// \return A pair where the first element is the cloned function, and the
    /// second element is a StateMap for \a F and its clone.
    static std::pair<llvm::Function*, StateMap*> generateIdentityMapping(llvm::Function *F);

private:
    typedef std::map<llvm::Instruction*, std::vector<llvm::Value*>> ValuesToSetCache;

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