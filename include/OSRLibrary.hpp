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
/// primitives to insert open and resolved OSR points in a function, to generate
/// an OSR continuation function, and to remove an OSR point from a function.
///
/// When an OSR point is inserted in a function \a F1 for a location \a OSRSrc,
/// the library will split the BasicBlock containing \a OSRSrc and insert in it
/// the OSR condition provided by the front-end. When at run-time such condition
/// is satisfied, the control flow jumps to an OSR block created by the library
/// and an OSR is fired; otherwise, the execution continues from \a OSRSrc.
///
/// OSR transitions are handled by generating a continuation function \a OSRCont
/// specific to the \a OSRSrc location in the source function \a F1 and to the
/// \a LPad landing pad in the target function \a F2. A continuation function is
/// generated by cloning the target function and then manipulating it. In
/// particular, the original entrypoint is replaced with a new OSR entrypoint,
/// and live variables at \a OSRSrc are passed as arguments to \a OSRCont. The
/// OSR entrypoint is generated with the help of the StateMap class.
///
/// For resolved OSR points, the target function \a F2 is already known when the
/// OSR point is inserted: \a OSRCont is generated right away and the OSR
/// block contains a direct call to \a OSRCont followed by a ReturnInst to leave
/// the source function and return the computed result.
///
/// For open OSR points, the target function is known only at run-time: the OSR
/// block thus contains a direct call to an OSR stub followed by a ReturnInst.
/// An OSR stub is a function that takes an (optional) profiling value and the
/// live variables at \a OSRSrc as arguments, calls a code generator provided by
/// the front-end, performs an indirect call to the function returned by the code
/// generator (passing the transferred live variables as arguments to it) and
/// eventually returns the computed value.

class OSRLibrary {
    public:
        /// \brief Condition to evaluate in order to take an OSR decision
        ///
        /// An OSR condition can be expressed as a sequence of instructions.
        /// OSRKit will use the last Instruction in the sequence as condition
        /// for a BranchInst: when the condition is satisfied, an OSR is fired;
        /// otherwise, the execution continues with the \a OSRSrc instruction.
        typedef std::vector<llvm::Instruction*> OSRCond;

        /// \brief A pair of LLVM Function objects
        typedef std::pair<llvm::Function*, llvm::Function*> OSRPair;

        /// \brief Data structure to encode settings for an OSR point insertion
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

            /// \brief See constructor
            llvm::Module* modForNewF2;
            /// \brief See constructor
            StateMap** ptrForF2NewToF2Map;

            /// \brief Generate a configuration object for OSR point insertion
            ///
            /// \param verbose Display details while OSRKit is working.
            /// \param updateF1 When \c false, rather than inserting an OSR
            /// point in the source function \a F1, OSRKit clones \a F1 and
            /// inserts an OSR point in the clone only.
            /// \param branchTakenProb Hints the code generator that the OSR is
            /// fired with the given probability (must be an integer between \c
            /// 0 and \c 100); when \c -1 is used, no hint is given.
            /// \param nameForNewF1 When \a updateF1 is \c false, specifies a
            /// name for the modified clone of the source function; use \c
            /// nullptr for default name generation.
            /// \param modForNewF1 When \a updateF1 is \c false, specifies the
            /// Module where to insert the modified cloned function; \c nullptr
            /// can be used only when the source function does not reference any
            /// global variable or other function.
            /// \param ptrForF1NewToF1Map When \a updateF1 is \c false,
            /// specifies the address of a StateMap* variable where to store the
            /// address of the StateMap object for the source function and its
            /// its clone; use \c nullptr to do not generate this StateMap.
            /// \param nameForNewF2 Specifies a name for the OSR continuation
            /// function (resolved OSR only) or the OSR stub (open OSR only);
            /// use \c nullptr for default name generation.
            /// \param modForNewF2 For resolved OSR points only, specifies the
            /// Module where to insert the continuation function; \c nullptr
            /// can be used only when the destination function does not reference
            /// any global variable or other function.
            /// \param ptrForF2NewToF2Map For resolved OSR points only,
            /// specifies the pointer to a StateMap* variable where to store the
            /// address of the unidirectional StateMap object from the
            /// continuation function to the target function; use \c nullptr to
            /// do not generate this StateMap.
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
        /// of the additional data structure created by the front-end for the
        /// OSR point, and the run-time address \a profDataAddr of the
        /// (optional) profiled Value.
        typedef void* (*DestFunGenerator)(
                                    llvm::Function* F1,
                                    llvm::Instruction* OSRSrc,
                                    void* extra,
                                    void* profDataAddr);

        /// \brief Insert a resolved OSR point in a function.
        ///
        /// \param Context LLVM Context to use for OSRKit.
        /// \param F1 Source function where to insert the OSR point.
        /// \param OSRSrc Instruction in \a F1 to take an OSR decision for.
        /// \param F2 Target function for the OSR transition.
        /// \param LPad Landing pad in \a F2 where to resume the execution at.
        /// \param cond Condition to evaluate in order to take an OSR decision.
        /// \param M StateMap object between \a F1 and \a F2.
        /// \param config Additional settings for the OSR point insertion.
        /// \return A pair in which the first element is the function with the
        /// inserted OSR point and the second is the OSR continuation function.
        /// \sa genContinuationFunc()
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
        /// \param OSRSrc Instruction in \a F to take an OSR decision for.
        /// \param extraInfo Address of the auxiliary data structure to pass to
        /// the code generator.
        /// \param cond Condition to evaluate in order to take an OSR decision.
        /// \param profDataVal Value to profile at the OSR point; use \c nullptr
        /// when no Value needs to be profiled.
        /// \param destFunGenerator Code generator to invoke when the OSR is
        /// fired.
        /// \param valuesToTransfer Custom set of values to transfer at the OSR.
        /// point; use \c nullptr to transfer all the live values.
        /// \param LA LivenessAnalysis results computed for \a F.
        /// \param config Additional settings for the OSR point insertion.
        /// \return A pair in which the first element is the function with the
        /// inserted OSR point and the second is the OSR stub function.
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
        /// \param OSRSrc Instruction in \a F1 for which an OSR decision is
        /// taken.
        /// \param F2 Target function for the OSR transition.
        /// \param LPad Landing pad in \a F2 where to resume the execution at.
        /// \param valuesToPass Values transferred at the OSR point.
        /// \param M StateMap object constructed for \a F1 and \a F2.
        /// \param F2NewName Name for the continuation funtion; use \c nullptr
        /// for default name generation.
        /// \param verbose Display details while OSRKit is working.
        /// \param ptrForF2NewToF2Map Pointer to a StateMap* variable where to
        /// store the address of the unidirectional StateMap object from the
        /// continuation function to \a F2; with \c nullptr, no StateMap is
        /// generated.
        /// \return The OSR continuation function for the given settings.
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
        /// \param I Instruction corresponding to the program point.
        /// \param LA LivenessAnalysis results for the enclosing function.
        /// \return A vector containing the \a liveIn values at \a I.
        /// \sa LivenessAnalysis::analyzeLiveInForSeq()
        static std::vector<llvm::Value*>* getLiveValsVecAtInstr(
                                            const llvm::Instruction* I,
                                            LivenessAnalysis &LA);

        /// \brief Add declarations and replace uses for references to globals
        /// and other functions.
        ///
        /// When a cloned function is inserted in a new module, each reference
        /// to a global variables or other function from the original module
        /// should be replaced with a reference to the corresponding declaration
        /// in the new modules. This method adds declarations to the new module
        /// and fixes uses where needed.
        ///
        /// \param origFun Function from which \a newFun derives.
        /// \param newFun Function to manipulate.
        /// \return \c true when \a newFun and its enclosing module have been
        /// modified, \c false otherwise.
        static bool fixUsesOfFunctionsAndGlobals(llvm::Function* origFun,
                                                 llvm::Function* newFun);

        /// \brief Remove an OSR point from a function.
        ///
        /// This method might also remove trivially dead instructions in the
        /// basic block where the OSR decision is taken.
        ///
        /// \param OSRSrc Instruction for which an OSR decision is taken.
        /// \return \c true when an OSR point was found and removed, \c false
        /// otherwise.
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