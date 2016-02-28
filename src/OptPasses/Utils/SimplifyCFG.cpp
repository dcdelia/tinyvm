/*
 * OSR-enabled methods from Transforms/Utils/SimplifyCFG.cpp (LLVM 3.6.2)
 */

#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Analysis/ValueTracking.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/MDBuilder.h>
#include <llvm/Support/Debug.h>

using namespace llvm;

static bool isProfitableToFoldUnconditional(BranchInst *SI1,
                                          BranchInst *SI2,
                                          Instruction *Cond,
                                          SmallVectorImpl<PHINode*> &PhiNodes) {
  if (SI1 == SI2) return false;  // Can't merge with self!
  assert(SI1->isUnconditional() && SI2->isConditional());

  // We fold the unconditional branch if we can easily update all PHI nodes in
  // common successors:
  // 1> We have a constant incoming value for the conditional branch;
  // 2> We have "Cond" as the incoming value for the unconditional branch;
  // 3> SI2->getCondition() and Cond have same operands.
  CmpInst *Ci2 = dyn_cast<CmpInst>(SI2->getCondition());
  if (!Ci2) return false;
  if (!(Cond->getOperand(0) == Ci2->getOperand(0) &&
        Cond->getOperand(1) == Ci2->getOperand(1)) &&
      !(Cond->getOperand(0) == Ci2->getOperand(1) &&
        Cond->getOperand(1) == Ci2->getOperand(0)))
    return false;

  BasicBlock *SI1BB = SI1->getParent();
  BasicBlock *SI2BB = SI2->getParent();
  SmallPtrSet<BasicBlock*, 16> SI1Succs(succ_begin(SI1BB), succ_end(SI1BB));
  for (succ_iterator I = succ_begin(SI2BB), E = succ_end(SI2BB); I != E; ++I)
    if (SI1Succs.count(*I))
      for (BasicBlock::iterator BBI = (*I)->begin();
           isa<PHINode>(BBI); ++BBI) {
        PHINode *PN = cast<PHINode>(BBI);
        if (PN->getIncomingValueForBlock(SI1BB) != Cond ||
            !isa<ConstantInt>(PN->getIncomingValueForBlock(SI2BB)))
          return false;
        PhiNodes.push_back(PN);
      }
  return true;
}

static void AddPredecessorToBlock(BasicBlock *Succ, BasicBlock *NewPred,
                                  BasicBlock *ExistPred) {
  if (!isa<PHINode>(Succ->begin())) return; // Quick exit if nothing to do

  PHINode *PN;
  for (BasicBlock::iterator I = Succ->begin();
       (PN = dyn_cast<PHINode>(I)); ++I)
    PN->addIncoming(PN->getIncomingValueForBlock(ExistPred), NewPred);
}

static bool ExtractBranchMetadata(BranchInst *BI,
                                  uint64_t &ProbTrue, uint64_t &ProbFalse) {
  assert(BI->isConditional() &&
         "Looking for probabilities on unconditional branch?");
  MDNode *ProfileData = BI->getMetadata(LLVMContext::MD_prof);
  if (!ProfileData || ProfileData->getNumOperands() != 3) return false;
  ConstantInt *CITrue =
      mdconst::dyn_extract<ConstantInt>(ProfileData->getOperand(1));
  ConstantInt *CIFalse =
      mdconst::dyn_extract<ConstantInt>(ProfileData->getOperand(2));
  if (!CITrue || !CIFalse) return false;
  ProbTrue = CITrue->getValue().getZExtValue();
  ProbFalse = CIFalse->getValue().getZExtValue();
  return true;
}

static void FitWeights(MutableArrayRef<uint64_t> Weights) {
  uint64_t Max = *std::max_element(Weights.begin(), Weights.end());
  if (Max > UINT_MAX) {
    unsigned Offset = 32 - countLeadingZeros(Max);
    for (uint64_t &I : Weights)
      I >>= Offset;
  }
}

static bool SafeToMergeTerminators(TerminatorInst *SI1, TerminatorInst *SI2) {
  if (SI1 == SI2) return false;  // Can't merge with self!

  // It is not safe to merge these two switch instructions if they have a common
  // successor, and if that successor has a PHI node, and if *that* PHI node has
  // conflicting incoming values from the two switch blocks.
  BasicBlock *SI1BB = SI1->getParent();
  BasicBlock *SI2BB = SI2->getParent();
  SmallPtrSet<BasicBlock*, 16> SI1Succs(succ_begin(SI1BB), succ_end(SI1BB));

  for (succ_iterator I = succ_begin(SI2BB), E = succ_end(SI2BB); I != E; ++I)
    if (SI1Succs.count(*I))
      for (BasicBlock::iterator BBI = (*I)->begin();
           isa<PHINode>(BBI); ++BBI) {
        PHINode *PN = cast<PHINode>(BBI);
        if (PN->getIncomingValueForBlock(SI1BB) !=
            PN->getIncomingValueForBlock(SI2BB))
          return false;
      }

  return true;
}

static bool OSR_checkCSEInPredecessor(Instruction *Inst, BasicBlock *PB,
        CodeMapper* OSR_CM) {
  if (!isa<BinaryOperator>(Inst) && !isa<CmpInst>(Inst))
    return false;
  for (BasicBlock::iterator I = PB->begin(), E = PB->end(); I != E; I++) {
    Instruction *PBI = &*I;
    // Check whether Inst and PBI generate the same value.
    if (Inst->isIdenticalTo(PBI)) {
      OSR_DEBUG(OSR_DBGS << "checkCSEInPredecessor() RAUW & Delete: "
                         << *Inst << " with " << PBI << '\n');
      if (OSR_CM) { /* OSR */
        OSR_CM->replaceAllUsesWith(Inst, PBI);
        OSR_CM->deleteInstruction(Inst);
      }
      Inst->replaceAllUsesWith(PBI);
      Inst->eraseFromParent();
      return true;
    }
  }
  return false;
}

static void OSR_EraseTerminatorInstAndDCECond(TerminatorInst *TI,
        CodeMapper* OSR_CM) {
  Instruction *Cond = nullptr;
  if (SwitchInst *SI = dyn_cast<SwitchInst>(TI)) {
    Cond = dyn_cast<Instruction>(SI->getCondition());
  } else if (BranchInst *BI = dyn_cast<BranchInst>(TI)) {
    if (BI->isConditional())
      Cond = dyn_cast<Instruction>(BI->getCondition());
  } else if (IndirectBrInst *IBI = dyn_cast<IndirectBrInst>(TI)) {
    Cond = dyn_cast<Instruction>(IBI->getAddress());
  }
  OSR_DEBUG(OSR_DBGS << "EraseTerminatorInstAndDCECond() Delete: " << *TI << '\n');
  if (OSR_CM) OSR_CM->deleteInstruction(TI); /* OSR */
  TI->eraseFromParent();
  if (Cond) OSR_RecursivelyDeleteTriviallyDeadInstructions(Cond, nullptr, OSR_CM);
}

bool OSR_FoldBranchToCommonDest(BranchInst *BI, const llvm::DataLayout *DL,
        unsigned BonusInstThreshold, CodeMapper* OSR_CM) {
    BasicBlock *BB = BI->getParent();

    Instruction *Cond = nullptr;
    if (BI->isConditional())
        Cond = dyn_cast<Instruction>(BI->getCondition());
    else {
        // For unconditional branch, check for a simple CFG pattern, where
        // BB has a single predecessor and BB's successor is also its predecessor's
        // successor. If such pattern exisits, check for CSE between BB and its
        // predecessor.
        if (BasicBlock * PB = BB->getSinglePredecessor())
            if (BranchInst * PBI = dyn_cast<BranchInst>(PB->getTerminator()))
                if (PBI->isConditional() &&
                        (BI->getSuccessor(0) == PBI->getSuccessor(0) ||
                        BI->getSuccessor(0) == PBI->getSuccessor(1))) {
                    for (BasicBlock::iterator I = BB->begin(), E = BB->end();
                            I != E;) {
                        Instruction *Curr = I++;
                        if (isa<CmpInst>(Curr)) {
                            Cond = Curr;
                            break;
                        }
                        // Quit if we can't remove this instruction.
                        if (!OSR_checkCSEInPredecessor(Curr, PB, OSR_CM))
                            return false;
                    }
                }

        if (!Cond)
            return false;
    }

    if (!Cond || (!isa<CmpInst>(Cond) && !isa<BinaryOperator>(Cond)) ||
            Cond->getParent() != BB || !Cond->hasOneUse())
        return false;

    // Make sure the instruction after the condition is the cond branch.
    BasicBlock::iterator CondIt = Cond;
    ++CondIt;

    // Ignore dbg intrinsics.
    while (isa<DbgInfoIntrinsic>(CondIt)) ++CondIt;

    if (&*CondIt != BI)
        return false;

    // Only allow this transformation if computing the condition doesn't involve
    // too many instructions and these involved instructions can be executed
    // unconditionally. We denote all involved instructions except the condition
    // as "bonus instructions", and only allow this transformation when the
    // number of the bonus instructions does not exceed a certain threshold.
    unsigned NumBonusInsts = 0;
    for (auto I = BB->begin(); Cond != I; ++I) {
        // Ignore dbg intrinsics.
        if (isa<DbgInfoIntrinsic>(I))
            continue;
        if (!I->hasOneUse() || !isSafeToSpeculativelyExecute(I, DL))
            return false;
        // I has only one use and can be executed unconditionally.
        Instruction *User = dyn_cast<Instruction>(I->user_back());
        if (User == nullptr || User->getParent() != BB)
            return false;
        // I is used in the same BB. Since BI uses Cond and doesn't have more slots
        // to use any other instruction, User must be an instruction between next(I)
        // and Cond.
        ++NumBonusInsts;
        // Early exits once we reach the limit.
        if (NumBonusInsts > BonusInstThreshold)
            return false;
    }

    // Cond is known to be a compare or binary operator.  Check to make sure that
    // neither operand is a potentially-trapping constant expression.
    if (ConstantExpr * CE = dyn_cast<ConstantExpr>(Cond->getOperand(0)))
        if (CE->canTrap())
            return false;
    if (ConstantExpr * CE = dyn_cast<ConstantExpr>(Cond->getOperand(1)))
        if (CE->canTrap())
            return false;

    // Finally, don't infinitely unroll conditional loops.
    BasicBlock *TrueDest = BI->getSuccessor(0);
    BasicBlock *FalseDest = (BI->isConditional()) ? BI->getSuccessor(1) : nullptr;
    if (TrueDest == BB || FalseDest == BB)
        return false;

    for (pred_iterator PI = pred_begin(BB), E = pred_end(BB); PI != E; ++PI) {
        BasicBlock *PredBlock = *PI;
        BranchInst *PBI = dyn_cast<BranchInst>(PredBlock->getTerminator());

        // Check that we have two conditional branches.  If there is a PHI node in
        // the common successor, verify that the same value flows in from both
        // blocks.
        SmallVector<PHINode*, 4> PHIs;
        if (!PBI || PBI->isUnconditional() ||
                (BI->isConditional() &&
                !SafeToMergeTerminators(BI, PBI)) ||
                (!BI->isConditional() &&
                !isProfitableToFoldUnconditional(BI, PBI, Cond, PHIs)))
            continue;

        // Determine if the two branches share a common destination.
        Instruction::BinaryOps Opc = Instruction::BinaryOpsEnd;
        bool InvertPredCond = false;

        if (BI->isConditional()) {
            if (PBI->getSuccessor(0) == TrueDest)
                Opc = Instruction::Or;
            else if (PBI->getSuccessor(1) == FalseDest)
                Opc = Instruction::And;
            else if (PBI->getSuccessor(0) == FalseDest)
                Opc = Instruction::And, InvertPredCond = true;
            else if (PBI->getSuccessor(1) == TrueDest)
                Opc = Instruction::Or, InvertPredCond = true;
            else
                continue;
        } else {
            if (PBI->getSuccessor(0) != TrueDest && PBI->getSuccessor(1) != TrueDest)
                continue;
        }

        DEBUG(dbgs() << "FOLDING BRANCH TO COMMON DEST:\n" << *PBI << *BB);
        IRBuilder<> Builder(PBI);

        // If we need to invert the condition in the pred block to match, do so now.
        if (InvertPredCond) {
            Value *NewCond = PBI->getCondition();

            if (NewCond->hasOneUse() && isa<CmpInst>(NewCond)) {
                CmpInst *CI = cast<CmpInst>(NewCond);
                CI->setPredicate(CI->getInversePredicate());
            } else {
                NewCond = Builder.CreateNot(NewCond,
                        PBI->getCondition()->getName() + ".not");
            }

            PBI->setCondition(NewCond);
            PBI->swapSuccessors();
        }

        // If we have bonus instructions, clone them into the predecessor block.
        // Note that there may be mutliple predecessor blocks, so we cannot move
        // bonus instructions to a predecessor block.
        ValueToValueMapTy VMap; // maps original values to cloned values
        // We already make sure Cond is the last instruction before BI. Therefore,
        // every instructions before Cond other than DbgInfoIntrinsic are bonus
        // instructions.
        for (auto BonusInst = BB->begin(); Cond != BonusInst; ++BonusInst) {
            if (isa<DbgInfoIntrinsic>(BonusInst))
                continue;
            Instruction *NewBonusInst = BonusInst->clone();
            RemapInstruction(NewBonusInst, VMap,
                    RF_NoModuleLevelChanges | RF_IgnoreMissingEntries);
            VMap[BonusInst] = NewBonusInst;

            // If we moved a load, we cannot any longer claim any knowledge about
            // its potential value. The previous information might have been valid
            // only given the branch precondition.
            // For an analogous reason, we must also drop all the metadata whose
            // semantics we don't understand.
            NewBonusInst->dropUnknownMetadata(LLVMContext::MD_dbg);

            PredBlock->getInstList().insert(PBI, NewBonusInst);
            NewBonusInst->takeName(BonusInst);
            OSR_DEBUG(OSR_DBGS << "FoldBranchToCommonDest() Add: " << *NewBonusInst << '\n');
            if (OSR_CM) OSR_CM->addInstruction(NewBonusInst); /* OSR */
            BonusInst->setName(BonusInst->getName() + ".old");
        }

        // Clone Cond into the predecessor basic block, and or/and the
        // two conditions together.
        Instruction *New = Cond->clone();
        RemapInstruction(New, VMap,
                RF_NoModuleLevelChanges | RF_IgnoreMissingEntries);
        PredBlock->getInstList().insert(PBI, New);
        New->takeName(Cond);
        OSR_DEBUG(OSR_DBGS << "FoldBranchToCommonDest() Add: " << *New << '\n');
        if (OSR_CM) OSR_CM->addInstruction(New); /* OSR */
        Cond->setName(New->getName() + ".old");

        if (BI->isConditional()) {
            Instruction *NewCond =
                    cast<Instruction>(Builder.CreateBinOp(Opc, PBI->getCondition(),
                    New, "or.cond"));
            PBI->setCondition(NewCond);

            uint64_t PredTrueWeight, PredFalseWeight, SuccTrueWeight, SuccFalseWeight;
            bool PredHasWeights = ExtractBranchMetadata(PBI, PredTrueWeight,
                    PredFalseWeight);
            bool SuccHasWeights = ExtractBranchMetadata(BI, SuccTrueWeight,
                    SuccFalseWeight);
            SmallVector<uint64_t, 8> NewWeights;

            if (PBI->getSuccessor(0) == BB) {
                if (PredHasWeights && SuccHasWeights) {
                    // PBI: br i1 %x, BB, FalseDest
                    // BI:  br i1 %y, TrueDest, FalseDest
                    //TrueWeight is TrueWeight for PBI * TrueWeight for BI.
                    NewWeights.push_back(PredTrueWeight * SuccTrueWeight);
                    //FalseWeight is FalseWeight for PBI * TotalWeight for BI +
                    //               TrueWeight for PBI * FalseWeight for BI.
                    // We assume that total weights of a BranchInst can fit into 32 bits.
                    // Therefore, we will not have overflow using 64-bit arithmetic.
                    NewWeights.push_back(PredFalseWeight * (SuccFalseWeight +
                            SuccTrueWeight) + PredTrueWeight * SuccFalseWeight);
                }
                AddPredecessorToBlock(TrueDest, PredBlock, BB);
                PBI->setSuccessor(0, TrueDest);
            }
            if (PBI->getSuccessor(1) == BB) {
                if (PredHasWeights && SuccHasWeights) {
                    // PBI: br i1 %x, TrueDest, BB
                    // BI:  br i1 %y, TrueDest, FalseDest
                    //TrueWeight is TrueWeight for PBI * TotalWeight for BI +
                    //              FalseWeight for PBI * TrueWeight for BI.
                    NewWeights.push_back(PredTrueWeight * (SuccFalseWeight +
                            SuccTrueWeight) + PredFalseWeight * SuccTrueWeight);
                    //FalseWeight is FalseWeight for PBI * FalseWeight for BI.
                    NewWeights.push_back(PredFalseWeight * SuccFalseWeight);
                }
                AddPredecessorToBlock(FalseDest, PredBlock, BB);
                PBI->setSuccessor(1, FalseDest);
            }
            if (NewWeights.size() == 2) {
                // Halve the weights if any of them cannot fit in an uint32_t
                FitWeights(NewWeights);

                SmallVector<uint32_t, 8> MDWeights(NewWeights.begin(), NewWeights.end());
                PBI->setMetadata(LLVMContext::MD_prof,
                        MDBuilder(BI->getContext()).
                        createBranchWeights(MDWeights));
            } else
                PBI->setMetadata(LLVMContext::MD_prof, nullptr);
        } else {
            // Update PHI nodes in the common successors.
            for (unsigned i = 0, e = PHIs.size(); i != e; ++i) {
                ConstantInt *PBI_C = cast<ConstantInt>(
                        PHIs[i]->getIncomingValueForBlock(PBI->getParent()));
                assert(PBI_C->getType()->isIntegerTy(1));
                Instruction *MergedCond = nullptr;
                if (PBI->getSuccessor(0) == TrueDest) {
                    // Create (PBI_Cond and PBI_C) or (!PBI_Cond and BI_Value)
                    // PBI_C is true: PBI_Cond or (!PBI_Cond and BI_Value)
                    //       is false: !PBI_Cond and BI_Value
                    Instruction *NotCond =
                            cast<Instruction>(Builder.CreateNot(PBI->getCondition(),
                            "not.cond"));
                    MergedCond =
                            cast<Instruction>(Builder.CreateBinOp(Instruction::And,
                            NotCond, New,
                            "and.cond"));
                    if (PBI_C->isOne())
                        MergedCond =
                            cast<Instruction>(Builder.CreateBinOp(Instruction::Or,
                            PBI->getCondition(), MergedCond,
                            "or.cond"));
                } else {
                    // Create (PBI_Cond and BI_Value) or (!PBI_Cond and PBI_C)
                    // PBI_C is true: (PBI_Cond and BI_Value) or (!PBI_Cond)
                    //       is false: PBI_Cond and BI_Value
                    MergedCond =
                            cast<Instruction>(Builder.CreateBinOp(Instruction::And,
                            PBI->getCondition(), New,
                            "and.cond"));
                    if (PBI_C->isOne()) {
                        Instruction *NotCond =
                                cast<Instruction>(Builder.CreateNot(PBI->getCondition(),
                                "not.cond"));
                        MergedCond =
                                cast<Instruction>(Builder.CreateBinOp(Instruction::Or,
                                NotCond, MergedCond,
                                "or.cond"));
                    }
                }
                // Update PHI Node.
                PHIs[i]->setIncomingValue(PHIs[i]->getBasicBlockIndex(PBI->getParent()),
                        MergedCond);
            }
            // Change PBI from Conditional to Unconditional.
            BranchInst *New_PBI = BranchInst::Create(TrueDest, PBI);
            OSR_EraseTerminatorInstAndDCECond(PBI, OSR_CM);
            PBI = New_PBI;
        }

        // TODO: If BB is reachable from all paths through PredBlock, then we
        // could replace PBI's branch probabilities with BI's.

        // Copy any debug value intrinsics into the end of PredBlock.
        for (BasicBlock::iterator I = BB->begin(), E = BB->end(); I != E; ++I)
            if (isa<DbgInfoIntrinsic>(*I))
                I->clone()->insertBefore(PBI); /* OSR: nothing to do */

        return true;
    }
    return false;
}