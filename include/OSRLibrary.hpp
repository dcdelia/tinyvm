/* ===============================================================
 * Main core of the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#ifndef TINYVM_OSRLIBRARY_H
#define TINYVM_OSRLIBRARY_H

#include "Liveness.hpp"
#include "StateMap.hpp"

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Transforms/Utils/ValueMapper.h>

#include <map>

/// \brief Manipulate OSR machinery for functions
///
/// This class is the core of the OSRKit library. It essentially provides
/// primitives to usert an open or resolved OSR point in a function, to generate
/// an OSR continuation function, and to remove an OSR point from a function.

class OSRLibrary {
    public:
        /// \brief Condition to evaluate for taking an OSR decision
        ///
        /// An OSR condition can be expressed as a sequence of instructions.
        /// OSRKit will use the last Instruction in the sequence as condition
        /// for a BranchInst: when the condition is satisfied, an OSR is fired.
        typedef std::vector<llvm::Instruction*> OSRCond;

        /// \brief A pair of LLVM Function objects
        typedef std::pair<llvm::Function*, llvm::Function*> OSRPair;

        /// \brief Data structure to encode settings for an OSR point
        typedef struct OSRPointConfig {
            /// \brief See constructor
            bool verbose;
            /// \brief See constructor
            bool updateF1;
            /// \brief See constructor
            int branchTakenProb;

            /// \brief See constructor
            const std::string* nameForNewF1;
            /// \brief See constructor
            llvm::Module* modForNewF1;
            /// \brief See constructor
            StateMap** ptrForF1NewToF1Map;

            /// \brief See constructor
            const std::string* nameForNewF2;

            // resolved OSR only
            /// \brief See constructor
            llvm::Module* modForNewF2;
            /// \brief See constructor
            StateMap** ptrForF2NewToF2Map;

            /// \brief Generate a configuration object for an OSR point
            ///
            /// \param verbose Display details while OSRKit is working.
            /// \param updateF1 Modify the source function (when \c false,
            /// OSRKit creates a clone of it and inserts the OSR point in the
            /// cloned function).
            /// \param branchTakenProb Hints the code generator that the OSR is
            /// fired with the given probability (an integer between \c 0 and
            /// \c 100); when \c -1 is used, no hint is given.
            /// \param nameForNewF1 When \a updateF1 is \c false, specifies a
            /// name for the modified clone of the source function; with \c
            /// nullptr, a new name is generated automatically.
            /// \param modForNewF1 When \a updateF1 is \c false, specifies the
            /// Module where to insert the modified cloned function; \c nullptr
            /// can be used when the source function does not reference any
            /// global variable or other function.
            /// \param ptrForF1NewToF1Map When \a updateF1 is \c false,
            /// specifies the pointer to a StateMap* variable where to store the
            /// address of the StateMap object between the source function and
            /// its modified clone. With \c nullptr, no StateMap is generated.
            /// \param nameForNewF2 Specifies a name for (resolved OSR) the
            /// continuation function or (open OSR with \a updateF1 being \c
            /// false) the stub; with \c nullptr, a name is generated
            /// automatically.
            /// \param modForNewF2 For resolved OSR points only, specifies the
            /// Module where to insert the continuation function; \c nullptr
            /// can be used when the destination function does not reference any
            /// global variable or other function.
            /// \param ptrForF2NewToF2Map For resolved OSR points only,
            /// specifies the pointer to a StateMap* variable where to store the
            /// address of the unidirectional StateMap object from the
            /// continuation function to the destination function; with \c
            /// nullptr, no StateMap is generated.
            OSRPointConfig(bool verbose = false, bool updateF1 = true,
                    int branchTakenProb = -1,
                    const std::string* nameForNewF1 = nullptr,
                    llvm::Module* modForNewF1 = nullptr,
                    StateMap** ptrForF1NewToF1Map = nullptr,
                    const std::string* nameForNewF2 = nullptr,
                    llvm::Module* modForNewF2 = nullptr,
                    StateMap** ptrForF2NewToF2Map = nullptr) :
                    verbose(verbose), updateF1(updateF1),
                    branchTakenProb(branchTakenProb),
                    nameForNewF1(nameForNewF1), modForNewF1(modForNewF1),
                    ptrForF1NewToF1Map(ptrForF1NewToF1Map),
                    nameForNewF2(nameForNewF2), modForNewF2(modForNewF2),
                    ptrForF2NewToF2Map(ptrForF2NewToF2Map) {
                if (branchTakenProb != -1 && (branchTakenProb > 100 || branchTakenProb < 0)) {
                    llvm::report_fatal_error("OSR probability should be either -1 or an integer number between 0 and 100");
                }
            };
        } OSRPointConfig;

        /// \brief Signature of a code generator for open OSR points
        ///
        /// A code generator for open OSR transitions takes four parameters: the
        /// Function \a F1 in which the OSR point was inserted, the instruction
        /// \a OSRSrc for which an OSR decision was taken, the address \a extra
        /// of the additional data structure passed by the front-end for the OSR
        /// point, and the run-time address \a profDataAddr of the location with
        /// the content of the profiled Value.
        typedef void* (*DestFunGenerator)(
                                    llvm::Function* F1,
                                    llvm::Instruction* OSRSrc,
                                    void* extra,
                                    void* profDataAddr);

        /// \brief Insert a resolved OSR point in a function.
        ///
        /// \param Context LLVM Context to use for OSRKit.
        /// \param F1 Source function where to insert the OSR point.
        /// \param OSRSrc Instruction in \a F1 where to take an OSR decision.
        /// \param F2 Destination function for the OSR transition.
        /// \param LPad Landing pad in \a F2 where to resume the execution at.
        /// \param cond Condition to evaluate for taking an OSR decision.
        /// \param M StateMap object between \a F1 and \a F2.
        /// \param config Additional parameters for the OSR point.
        static OSRPair insertResolvedOSR(
                                    llvm::LLVMContext &Context,
                                    llvm::Function& F1,
                                    llvm::Instruction& OSRSrc,
                                    llvm::Function& F2,
                                    llvm::Instruction& LPad,
                                    OSRCond& cond,
                                    StateMap& M,
                                    OSRPointConfig &config);

        /// \brief Insert an open OSR point in a function.
        ///
        /// \param Context LLVM Context to use for OSRKit.
        /// \param F Source function where to insert the OSR point.
        /// \param OSRSrc Instruction in \a F where to take an OSR decision.
        /// \param extraInfo Address of the auxiliary data structure to pass to
        /// the code generator.
        /// \param cond Condition to evaluate for taking an OSR decision.
        /// \param profDataVal Value to profile at the OSR point.
        /// \param destFunGenerator Code generator to use when the OSR is fired.
        /// \param valuesToTransfer Custom set of values to transfer at the OSR.
        /// point (with \c nullptr, only live values are transferred).
        /// \param LA LivenessAnalysis results computed for \a F.
        /// \param config Additional parameters for the OSR point.
        static OSRPair insertOpenOSR(
                                llvm::LLVMContext &Context,
                                llvm::Function &F,
                                llvm::Instruction &OSRSrc,
                                void* extraInfo,
                                OSRCond& cond,
                                llvm::Value* profDataVal,
                                DestFunGenerator destFunGenerator,
                                std::vector<llvm::Value*> *valuesToTransfer,
                                LivenessAnalysis *LA,
                                OSRPointConfig &config);

        /// \brief Generate an OSR continuation function.
        ///
        /// This method is used by code generators and internally by
        /// insertResolvedOSR().
        ///
        /// \param Context LLVM Context to use for OSRKit.
        /// \param F1 Source function for the OSR transition.
        /// \param OSRSrc Instruction in \a F1 for which an OSR decision was
        /// taken.
        /// \param F2 Destination function for the OSR transition.
        /// \param LPad Landing pad in \a F2 where to resume the execution at.
        /// \param valuesToPass Set of values passed at the OSR point.
        /// \param M StateMap object between \a F1 and \a F2.
        /// \param F2NewName Name for the continuation funtion; with \c nullptr,
        /// a name is generated automatically.
        /// \param verbose Display details while OSRKit is working.
        /// \param ptrForF2NewToF2Map Pointer to a StateMap* variable where to
        /// store the address of the unidirectional StateMap object from the
        /// continuation function to \a F2; with \c nullptr, no StateMap is
        /// generated.
        static llvm::Function* genContinuationFunc(
                                    llvm::LLVMContext &Context,
                                    llvm::Function &F1,
                                    llvm::Function &F2,
                                    llvm::Instruction &OSRSrc,
                                    llvm::Instruction &LPad,
                                    std::vector<llvm::Value*> &valuesToPass,
                                    StateMap &M,
                                    const std::string* F2NewName,
                                    bool verbose = false,
                                    StateMap** ptrForF2NewToF2Map = nullptr);

        /// \brief Get the set of live values at a program point as a vector.
        ///
        /// \param I Instruction at the program point.
        /// \param LA LivenessAnalysis results for the enclosing function.
        static std::vector<llvm::Value*>* getLiveValsVecAtInstr(
                                            const llvm::Instruction* I,
                                            LivenessAnalysis &LA);

        /// \brief Add declarations and replace uses for any reference to
        /// globals and other functions.
        ///
        /// When a cloned function is inserted in a new module, any reference to
        /// global variables and other functions should be replaced with a
        /// reference to the declaration in the new module of the global or
        /// function. This method adds declarations and fixes uses where needed.
        ///
        /// \param origFun Function from which \a newFun was cloned.
        /// \param newFun Cloned function to manipulate.
        /// \return Returns \c true when \a newFun and its enclosing module have
        /// been modified, otherwise returns \c false.
        static bool fixUsesOfFunctionsAndGlobals(llvm::Function* origFun,
                                                 llvm::Function* newFun);

        /// \brief Remove an OSR point from a function.
        ///
        /// Note that this method might also remove trivially dead instructions
        /// in the basic block where the OSR decision is supposed to be taken.
        ///
        /// \param OSRSrc Location used for the OSR point insertion.
        /// \return Returns \c true when an OSR point was found and removed, \c
        /// false otherwise.
        static bool removeOSRPoint(llvm::Instruction &OSRSrc);

    private:
        static void applyAttributesToArguments(llvm::Function* NF, llvm::Function* F,
            std::vector<llvm::Value*> &valuesToPass, bool skipFirst = false);
        static void duplicateBodyIntoNewFunction(llvm::Function* F, llvm::Function *NF, llvm::ValueToValueMapTy& VMap);
        static void fixOperandReferencesFromVMap(llvm::Function* NF, llvm::Function* F, llvm::ValueToValueMapTy &VMap);
        static void replaceUsesAndFixSSA(llvm::Function* OSRCont, llvm::Instruction* OSRContLPad,
            std::vector<llvm::Value*> &valuesToSetAtOrigLPad, llvm::ValueToValueMapTy &VMap,
            llvm::ValueToValueMapTy &updatesForVMap, llvm::SmallVectorImpl<llvm::PHINode*> *insertedPHINodes,
            bool verbose, StateMap** ptrForF2NewToF2Map);
        static llvm::Function* duplicateFunction(llvm::Function* F, const llvm::Twine &Name, llvm::ValueToValueMapTy &VMap);
        static OSRCond regenerateOSRCond(OSRCond &cond, llvm::ValueToValueMapTy &VMap);
        static llvm::BasicBlock* generateTriggerOSRBlock(llvm::LLVMContext &Context, llvm::Function* OSRDest,
                std::vector<llvm::Value*> &valuesToPass);
        static llvm::BasicBlock* insertOSRCond(llvm::LLVMContext &Context, llvm::Function* F, llvm::Instruction* OSRSrc,
            llvm::BasicBlock* FireOSRBlock, OSRCond& cond, const llvm::Twine& BBName, int branchTakenProb);
        static void printLiveVarInfoForDebug(LivenessAnalysis::LiveValues &liveIn,
            LivenessAnalysis::LiveValues &liveOut, std::vector<llvm::Value*> &valuesToFetch);
        static LivenessAnalysis::LiveValues getLiveValsAtInstr(const llvm::Instruction* I, LivenessAnalysis &LA);
        static bool isConstantUsedInFunction(llvm::Constant* C, llvm::Function* F);
        static llvm::GlobalVariable* getVisibleDeclaration(llvm::GlobalVariable *G, llvm::Module* M);
        static void replaceUsesOfConstantExprInFunction(llvm::ConstantExpr* CE,
            llvm::Constant* oldOp, llvm::Constant* newOp, llvm::Function* F);
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