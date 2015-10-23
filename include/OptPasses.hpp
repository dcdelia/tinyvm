/* ===============================================================
 * Optimization passes supported by the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_OPTPASSES_HPP
#define	TINYVM_OPTPASSES_HPP

#include <llvm/Pass.h>
#include <llvm/PassRegistry.h>
#include <llvm/PassSupport.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/Target/TargetLibraryInfo.h>

/* Adapted LLVM passes */
llvm::FunctionPass* OSR_createAggressiveDCEPass();
llvm::FunctionPass* OSR_createConstantPropagationPass();
llvm::FunctionPass* OSR_createDeadCodeEliminationPass();
llvm::FunctionPass* OSR_createEarlyCSEPass();
llvm::FunctionPass* OSR_createSCCPPass();
llvm::FunctionPass* OSR_createSinkingPass();

llvm::Pass* OSR_createLICMPass(); // LoopPass

extern char &OSR_LCSSAID;
llvm::Pass* OSR_createLCSSAPass();
extern char &OSR_LoopSimplifyID;
llvm::Pass* OSR_createLoopSimplifyPass();

void initializeOSR_ADCEPass(llvm::PassRegistry&);
void initializeOSR_ConstantPropagationPass(llvm::PassRegistry&);
void initializeOSR_DCEPass(llvm::PassRegistry&);
void initializeOSR_EarlyCSEPass(llvm::PassRegistry&);
void initializeOSR_LCSSAPass(llvm::PassRegistry&);
void initializeOSR_LICMPass(llvm::PassRegistry&);
void initializeOSR_LoopSimplifyPass(llvm::PassRegistry&);
void initializeOSR_SCCPPass(llvm::PassRegistry&);
void initializeOSR_SinkingPass(llvm::PassRegistry&);

/* Adapted LLVM utilities */
llvm::BasicBlock* OSR_SplitBlockPredecessors(llvm::BasicBlock *BB,
        llvm::ArrayRef<llvm::BasicBlock*> Preds, const char *Suffix,
        llvm::Pass *P, CodeMapper* OSR_CM);

void OSR_SplitLandingPadPredecessors(llvm::BasicBlock *OrigBB,
        llvm::ArrayRef<llvm::BasicBlock*> Preds, const char *Suffix1,
        const char *Suffix2, llvm::Pass *P,
        llvm::SmallVectorImpl<llvm::BasicBlock*> &NewBBs,
        CodeMapper* OSR_CM);

bool OSR_makeLoopInvariant(llvm::Instruction *I, bool &Changed,
        llvm::Instruction *InsertPt, llvm::Loop* L, CodeMapper* OSR_CM);

bool OSR_FoldBranchToCommonDest(llvm::BranchInst *BI, const llvm::DataLayout *DL,
        unsigned BonusInstThreshold, CodeMapper* OSR_CM);

bool OSR_RecursivelyDeleteTriviallyDeadInstructions(llvm::Value *V,
        const llvm::TargetLibraryInfo *TLI, CodeMapper* OSR_CM);


/* Adaptation of LLVM's internal macros*/
#define OSR_INITIALIZE_PASS(passName, arg, name, cfg, analysis) \
  static void* initialize##passName##PassOnce(PassRegistry &Registry) { \
    PassInfo *PI = new PassInfo(name, arg, & passName ::ID, \
      PassInfo::NormalCtor_t(callDefaultCtor< passName >), cfg, analysis); \
    Registry.registerPass(*PI, true); \
    return PI; \
  } \
  void initialize##passName##Pass(PassRegistry &Registry) { \
    CALL_ONCE_INITIALIZATION(initialize##passName##PassOnce) \
  }

#define OSR_INITIALIZE_PASS_BEGIN       INITIALIZE_PASS_BEGIN
#define OSR_INITIALIZE_PASS_DEPENDENCY  INITIALIZE_PASS_DEPENDENCY
#define OSR_INITIALIZE_AG_DEPENDENCY    INITIALIZE_AG_DEPENDENCY

#define OSR_INITIALIZE_PASS_END(passName, arg, name, cfg, analysis) \
    PassInfo *PI = new PassInfo(name, arg, & passName ::ID, \
      PassInfo::NormalCtor_t(callDefaultCtor< passName >), cfg, analysis); \
    Registry.registerPass(*PI, true); \
    return PI; \
  } \
  void initialize##passName##Pass(PassRegistry &Registry) { \
    CALL_ONCE_INITIALIZATION(initialize##passName##PassOnce) \
  }

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