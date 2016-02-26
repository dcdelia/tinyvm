/*
 * OSR-enabled version of LLVM (3.6.2) utilities used in optimization passes
 */
#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Pass.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/ValueTracking.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Target/TargetLibraryInfo.h>
#include <llvm/Transforms/Utils/Local.h>

using namespace llvm;

/*
 * Taken from Transforms/Utils/BasicBlockUtils.cpp
 */
/// UpdateAnalysisInformation - Update DominatorTree, LoopInfo, and LCCSA
/// analysis information.
static void UpdateAnalysisInformation(BasicBlock *OldBB, BasicBlock *NewBB,
                                      ArrayRef<BasicBlock *> Preds,
                                      Pass *P, bool &HasLoopExit) {
  if (!P) return;

  LoopInfo *LI = P->getAnalysisIfAvailable<LoopInfo>();
  Loop *L = LI ? LI->getLoopFor(OldBB) : nullptr;

  // If we need to preserve loop analyses, collect some information about how
  // this split will affect loops.
  bool IsLoopEntry = !!L;
  bool SplitMakesNewLoopHeader = false;
  if (LI) {
    bool PreserveLCSSA = P->mustPreserveAnalysisID(OSR_LCSSAID); /* OSR */
    for (ArrayRef<BasicBlock*>::iterator
           i = Preds.begin(), e = Preds.end(); i != e; ++i) {
      BasicBlock *Pred = *i;

      // If we need to preserve LCSSA, determine if any of the preds is a loop
      // exit.
      if (PreserveLCSSA)
        if (Loop *PL = LI->getLoopFor(Pred))
          if (!PL->contains(OldBB))
            HasLoopExit = true;

      // If we need to preserve LoopInfo, note whether any of the preds crosses
      // an interesting loop boundary.
      if (!L) continue;
      if (L->contains(Pred))
        IsLoopEntry = false;
      else
        SplitMakesNewLoopHeader = true;
    }
  }

  // Update dominator tree if available.
  if (DominatorTreeWrapperPass *DTWP =
          P->getAnalysisIfAvailable<DominatorTreeWrapperPass>())
    DTWP->getDomTree().splitBlock(NewBB);

  if (!L) return;

  if (IsLoopEntry) {
    // Add the new block to the nearest enclosing loop (and not an adjacent
    // loop). To find this, examine each of the predecessors and determine which
    // loops enclose them, and select the most-nested loop which contains the
    // loop containing the block being split.
    Loop *InnermostPredLoop = nullptr;
    for (ArrayRef<BasicBlock*>::iterator
           i = Preds.begin(), e = Preds.end(); i != e; ++i) {
      BasicBlock *Pred = *i;
      if (Loop *PredLoop = LI->getLoopFor(Pred)) {
        // Seek a loop which actually contains the block being split (to avoid
        // adjacent loops).
        while (PredLoop && !PredLoop->contains(OldBB))
          PredLoop = PredLoop->getParentLoop();

        // Select the most-nested of these loops which contains the block.
        if (PredLoop && PredLoop->contains(OldBB) &&
            (!InnermostPredLoop ||
             InnermostPredLoop->getLoopDepth() < PredLoop->getLoopDepth()))
          InnermostPredLoop = PredLoop;
      }
    }

    if (InnermostPredLoop)
      InnermostPredLoop->addBasicBlockToLoop(NewBB, LI->getBase());
  } else {
    L->addBasicBlockToLoop(NewBB, LI->getBase());
    if (SplitMakesNewLoopHeader)
      L->moveToHeader(NewBB);
  }
}

/*
 * Adapted from Transforms/Utils/BasicBlockUtils.cpp
 */
/// UpdatePHINodes - Update the PHI nodes in OrigBB to include the values coming
/// from NewBB. This also updates AliasAnalysis, if available.
static void OSR_UpdatePHINodes(BasicBlock *OrigBB, BasicBlock *NewBB,
        ArrayRef<BasicBlock*> Preds, BranchInst *BI, Pass *P, bool HasLoopExit,
        CodeMapper* OSR_CM) {
  // Otherwise, create a new PHI node in NewBB for each PHI node in OrigBB.
  AliasAnalysis *AA = P ? P->getAnalysisIfAvailable<AliasAnalysis>() : nullptr;
  SmallPtrSet<BasicBlock *, 16> PredSet(Preds.begin(), Preds.end());
  for (BasicBlock::iterator I = OrigBB->begin(); isa<PHINode>(I); ) {
    PHINode *PN = cast<PHINode>(I++);

    // Check to see if all of the values coming in are the same.  If so, we
    // don't need to create a new PHI node, unless it's needed for LCSSA.
    Value *InVal = nullptr;
    if (!HasLoopExit) {
      InVal = PN->getIncomingValueForBlock(Preds[0]);
      for (unsigned i = 0, e = PN->getNumIncomingValues(); i != e; ++i) {
        if (!PredSet.count(PN->getIncomingBlock(i)))
          continue;
        if (!InVal)
          InVal = PN->getIncomingValue(i);
        else if (InVal != PN->getIncomingValue(i)) {
          InVal = nullptr;
          break;
        }
      }
    }

    if (InVal) {
      // If all incoming values for the new PHI would be the same, just don't
      // make a new PHI.  Instead, just remove the incoming values from the old
      // PHI.

      // NOTE! This loop walks backwards for a reason! First off, this minimizes
      // the cost of removal if we end up removing a large number of values, and
      // second off, this ensures that the indices for the incoming values
      // aren't invalidated when we remove one.
      for (int64_t i = PN->getNumIncomingValues() - 1; i >= 0; --i)
        if (PredSet.count(PN->getIncomingBlock(i)))
          PN->removeIncomingValue(i, false);

      // Add an incoming value to the PHI node in the loop for the preheader
      // edge.
      PN->addIncoming(InVal, NewBB);
      continue;
    }

    // If the values coming into the block are not the same, we need a new
    // PHI.
    // Create the new PHI node, insert it into NewBB at the end of the block
    PHINode *NewPHI =
        PHINode::Create(PN->getType(), Preds.size(), PN->getName() + ".ph", BI);
    if (AA)
      AA->copyValue(PN, NewPHI);

    // NOTE! This loop walks backwards for a reason! First off, this minimizes
    // the cost of removal if we end up removing a large number of values, and
    // second off, this ensures that the indices for the incoming values aren't
    // invalidated when we remove one.
    for (int64_t i = PN->getNumIncomingValues() - 1; i >= 0; --i) {
      BasicBlock *IncomingBB = PN->getIncomingBlock(i);
      if (PredSet.count(IncomingBB)) {
        Value *V = PN->removeIncomingValue(i, false);
        NewPHI->addIncoming(V, IncomingBB);
      }
    }

    PN->addIncoming(NewPHI, NewBB);
  }
}

/*
 * Adapted from Transforms/Utils/BasicBlockUtils.cpp
 */
BasicBlock* OSR_SplitBlockPredecessors(BasicBlock *BB, ArrayRef<BasicBlock*>
        Preds, const char *Suffix, Pass *P, CodeMapper* OSR_CM) {
  // Create new basic block, insert right before the original block.
  BasicBlock *NewBB = BasicBlock::Create(BB->getContext(), BB->getName()+Suffix,
                                         BB->getParent(), BB);

  // The new block unconditionally branches to the old block.
  BranchInst *BI = BranchInst::Create(BB, NewBB);

  // Move the edges from Preds to point to NewBB instead of BB.
  for (unsigned i = 0, e = Preds.size(); i != e; ++i) {
    // This is slightly more strict than necessary; the minimum requirement
    // is that there be no more than one indirectbr branching to BB. And
    // all BlockAddress uses would need to be updated.
    assert(!isa<IndirectBrInst>(Preds[i]->getTerminator()) &&
           "Cannot split an edge from an IndirectBrInst");
    Preds[i]->getTerminator()->replaceUsesOfWith(BB, NewBB);
  }

  // Insert a new PHI node into NewBB for every PHI node in BB and that new PHI
  // node becomes an incoming value for BB's phi node.  However, if the Preds
  // list is empty, we need to insert dummy entries into the PHI nodes in BB to
  // account for the newly created predecessor.
  if (Preds.size() == 0) {
    // Insert dummy values as the incoming value.
    for (BasicBlock::iterator I = BB->begin(); isa<PHINode>(I); ++I)
      cast<PHINode>(I)->addIncoming(UndefValue::get(I->getType()), NewBB);
    return NewBB;
  }

  // Update DominatorTree, LoopInfo, and LCCSA analysis information.
  bool HasLoopExit = false;
  UpdateAnalysisInformation(BB, NewBB, Preds, P, HasLoopExit);

  // Update the PHI nodes in BB with the values coming from NewBB.
  OSR_UpdatePHINodes(BB, NewBB, Preds, BI, P, HasLoopExit, OSR_CM);
  return NewBB;
}

/*
 * Adapted from Transforms/Utils/BasicBlockUtils.cpp
 */
void OSR_SplitLandingPadPredecessors(BasicBlock *OrigBB,
        ArrayRef<BasicBlock*> Preds, const char *Suffix1, const char *Suffix2,
        Pass *P, SmallVectorImpl<BasicBlock*> &NewBBs, CodeMapper* OSR_CM) {
  assert(OrigBB->isLandingPad() && "Trying to split a non-landing pad!");

  // Create a new basic block for OrigBB's predecessors listed in Preds. Insert
  // it right before the original block.
  BasicBlock *NewBB1 = BasicBlock::Create(OrigBB->getContext(),
                                          OrigBB->getName() + Suffix1,
                                          OrigBB->getParent(), OrigBB);
  NewBBs.push_back(NewBB1);

  // The new block unconditionally branches to the old block.
  BranchInst *BI1 = BranchInst::Create(OrigBB, NewBB1);

  // Move the edges from Preds to point to NewBB1 instead of OrigBB.
  for (unsigned i = 0, e = Preds.size(); i != e; ++i) {
    // This is slightly more strict than necessary; the minimum requirement
    // is that there be no more than one indirectbr branching to BB. And
    // all BlockAddress uses would need to be updated.
    assert(!isa<IndirectBrInst>(Preds[i]->getTerminator()) &&
           "Cannot split an edge from an IndirectBrInst");
    Preds[i]->getTerminator()->replaceUsesOfWith(OrigBB, NewBB1);
  }

  // Update DominatorTree, LoopInfo, and LCCSA analysis information.
  bool HasLoopExit = false;
  UpdateAnalysisInformation(OrigBB, NewBB1, Preds, P, HasLoopExit);

  // Update the PHI nodes in OrigBB with the values coming from NewBB1.
  OSR_UpdatePHINodes(OrigBB, NewBB1, Preds, BI1, P, HasLoopExit, OSR_CM);

  // Move the remaining edges from OrigBB to point to NewBB2.
  SmallVector<BasicBlock*, 8> NewBB2Preds;
  for (pred_iterator i = pred_begin(OrigBB), e = pred_end(OrigBB);
       i != e; ) {
    BasicBlock *Pred = *i++;
    if (Pred == NewBB1) continue;
    assert(!isa<IndirectBrInst>(Pred->getTerminator()) &&
           "Cannot split an edge from an IndirectBrInst");
    NewBB2Preds.push_back(Pred);
    e = pred_end(OrigBB);
  }

  BasicBlock *NewBB2 = nullptr;
  if (!NewBB2Preds.empty()) {
    // Create another basic block for the rest of OrigBB's predecessors.
    NewBB2 = BasicBlock::Create(OrigBB->getContext(),
                                OrigBB->getName() + Suffix2,
                                OrigBB->getParent(), OrigBB);
    NewBBs.push_back(NewBB2);

    // The new block unconditionally branches to the old block.
    BranchInst *BI2 = BranchInst::Create(OrigBB, NewBB2);

    // Move the remaining edges from OrigBB to point to NewBB2.
    for (SmallVectorImpl<BasicBlock*>::iterator
           i = NewBB2Preds.begin(), e = NewBB2Preds.end(); i != e; ++i)
      (*i)->getTerminator()->replaceUsesOfWith(OrigBB, NewBB2);

    // Update DominatorTree, LoopInfo, and LCCSA analysis information.
    HasLoopExit = false;
    UpdateAnalysisInformation(OrigBB, NewBB2, NewBB2Preds, P, HasLoopExit);

    // Update the PHI nodes in OrigBB with the values coming from NewBB2.
    OSR_UpdatePHINodes(OrigBB, NewBB2, NewBB2Preds, BI2, P, HasLoopExit, OSR_CM);
  }

  LandingPadInst *LPad = OrigBB->getLandingPadInst();
  Instruction *Clone1 = LPad->clone();
  Clone1->setName(Twine("lpad") + Suffix1);
  NewBB1->getInstList().insert(NewBB1->getFirstInsertionPt(), Clone1);

  if (NewBB2) {
    Instruction *Clone2 = LPad->clone();
    Clone2->setName(Twine("lpad") + Suffix2);
    NewBB2->getInstList().insert(NewBB2->getFirstInsertionPt(), Clone2);

    // Create a PHI node for the two cloned landingpad instructions.
    PHINode *PN = PHINode::Create(LPad->getType(), 2, "lpad.phi", LPad);
    PN->addIncoming(Clone1, NewBB1);
    PN->addIncoming(Clone2, NewBB2);
    LPad->replaceAllUsesWith(PN);
    LPad->eraseFromParent();
  } else {
    // There is no second clone. Just replace the landing pad with the first
    // clone.
    LPad->replaceAllUsesWith(Clone1);
    LPad->eraseFromParent();
  }
}

/*
 * Adapted from Analysis/LoopInfo.cpp
 */
bool OSR_makeLoopInvariant(Instruction *I, bool &Changed, Instruction *InsertPt,
        Loop* L, CodeMapper* OSR_CM) {
  // Test if the value is already loop-invariant.
  if (L->isLoopInvariant(I))
    return true;
  if (!isSafeToSpeculativelyExecute(I))
    return false;
  if (I->mayReadFromMemory())
    return false;
  // The landingpad instruction is immobile.
  if (isa<LandingPadInst>(I))
    return false;
  // Determine the insertion point, unless one was given.
  if (!InsertPt) {
    BasicBlock *Preheader = L->getLoopPreheader();
    // Without a preheader, hoisting is not feasible.
    if (!Preheader)
      return false;
    InsertPt = Preheader->getTerminator();
  }
  // Don't hoist instructions with loop-variant operands.
  for (unsigned i = 0, e = I->getNumOperands(); i != e; ++i) {
    /* OSR: do isa<> straight away rather than having two methods */
    if (Instruction* opI = dyn_cast<Instruction>(I->getOperand(i))) {
      if (!OSR_makeLoopInvariant(opI, Changed, InsertPt, L, OSR_CM))
        return false;
    }
  }

  // Hoist.
  OSR_DEBUG(OSR_DBGS << "makeLoopInvariant() Hoist: " << *I << " before "
                     << *InsertPt << '\n');
  if (OSR_CM) OSR_CM->hoistInstruction(I, InsertPt); /* OSR */
  I->moveBefore(InsertPt);
  Changed = true;
  return true;
}

/*
 * Adapted from Transforms/Utils/Local.cpp
 */
bool OSR_RecursivelyDeleteTriviallyDeadInstructions(Value *V,
    const TargetLibraryInfo *TLI, CodeMapper* OSR_CM) {
  Instruction *I = dyn_cast<Instruction>(V);
  if (!I || !I->use_empty() || !isInstructionTriviallyDead(I, TLI))
    return false;

  SmallVector<Instruction*, 16> DeadInsts;
  DeadInsts.push_back(I);

  do {
    I = DeadInsts.pop_back_val();

    // Null out all of the instruction's operands to see if any operand becomes
    // dead as we go.
    for (unsigned i = 0, e = I->getNumOperands(); i != e; ++i) {
      Value *OpV = I->getOperand(i);
      I->setOperand(i, nullptr);

      if (!OpV->use_empty()) continue;

      // If the operand is an instruction that became dead as we nulled out the
      // operand, and if it is 'trivially' dead, delete it in a future loop
      // iteration.
      if (Instruction *OpI = dyn_cast<Instruction>(OpV))
        if (isInstructionTriviallyDead(OpI, TLI))
          DeadInsts.push_back(OpI);
    }

    OSR_DEBUG(OSR_DBGS << "RecursivelyDeleteTriviallyDeadInstructions() Delete: " << *I << '\n');
    if (OSR_CM) OSR_CM->deleteInstruction(I); /* OSR */
    I->eraseFromParent();
  } while (!DeadInsts.empty());

  return true;
}


