/*
 * OSR-enabled version of lib/Transform/Scalar/Sink.cpp (LLVM 3.6.2)
 */
#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Transforms/Scalar.h>
#include <llvm/ADT/Statistic.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/ValueTracking.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_ostream.h>
using namespace llvm;

#define DEBUG_TYPE "OSR_sink"

STATISTIC(NumSunk, "Number of instructions sunk");
STATISTIC(NumSinkIter, "Number of sinking iterations");

void initializeOSR_SinkingPass(PassRegistry&);

namespace {
  class OSR_Sinking : public FunctionPass {
    DominatorTree *DT;
    LoopInfo *LI;
    AliasAnalysis *AA;
    const DataLayout *DL;

  public:
    static char ID; // Pass identification
    CodeMapper* OSR_CM; /* OSR */
    OSR_Sinking() : FunctionPass(ID) {
      initializeOSR_SinkingPass(*PassRegistry::getPassRegistry());
    }

    bool runOnFunction(Function &F) override;

    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesCFG();
      FunctionPass::getAnalysisUsage(AU);
      AU.addRequired<AliasAnalysis>();
      AU.addRequired<DominatorTreeWrapperPass>();
      AU.addRequired<LoopInfo>();
      AU.addPreserved<DominatorTreeWrapperPass>();
      AU.addPreserved<LoopInfo>();
    }
  private:
    bool ProcessBlock(BasicBlock &BB);
    bool SinkInstruction(Instruction *I, SmallPtrSetImpl<Instruction*> &Stores);
    bool AllUsesDominatedByBlock(Instruction *Inst, BasicBlock *BB) const;
    bool IsAcceptableTarget(Instruction *Inst, BasicBlock *SuccToSinkTo) const;
  };
} // end anonymous namespace

char OSR_Sinking::ID = 0;
OSR_INITIALIZE_PASS_BEGIN(OSR_Sinking, "OSR_sink", "[OSR] Code sinking", false, false)
OSR_INITIALIZE_PASS_DEPENDENCY(LoopInfo)
OSR_INITIALIZE_PASS_DEPENDENCY(DominatorTreeWrapperPass)
OSR_INITIALIZE_AG_DEPENDENCY(AliasAnalysis)
OSR_INITIALIZE_PASS_END(OSR_Sinking, "OSR_sink", "[OSR] Code sinking", false, false)

FunctionPass* OSR_createSinkingPass() { return new OSR_Sinking(); }

/// AllUsesDominatedByBlock - Return true if all uses of the specified value
/// occur in blocks dominated by the specified block.
bool OSR_Sinking::AllUsesDominatedByBlock(Instruction *Inst,
                                      BasicBlock *BB) const {
  // Ignoring debug uses is necessary so debug info doesn't affect the code.
  // This may leave a referencing dbg_value in the original block, before
  // the definition of the vreg.  Dwarf generator handles this although the
  // user might not get the right info at runtime.
  for (Use &U : Inst->uses()) {
    // Determine the block of the use.
    Instruction *UseInst = cast<Instruction>(U.getUser());
    BasicBlock *UseBlock = UseInst->getParent();
    if (PHINode *PN = dyn_cast<PHINode>(UseInst)) {
      // PHI nodes use the operand in the predecessor block, not the block with
      // the PHI.
      unsigned Num = PHINode::getIncomingValueNumForOperand(U.getOperandNo());
      UseBlock = PN->getIncomingBlock(Num);
    }
    // Check that it dominates.
    if (!DT->dominates(BB, UseBlock))
      return false;
  }
  return true;
}

bool OSR_Sinking::runOnFunction(Function &F) {
  OSR_CM = CodeMapper::getCodeMapper(F); /* OSR */

  DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
  LI = &getAnalysis<LoopInfo>();
  AA = &getAnalysis<AliasAnalysis>();
  DataLayoutPass *DLP = getAnalysisIfAvailable<DataLayoutPass>();
  DL = DLP ? &DLP->getDataLayout() : nullptr;

  bool MadeChange, EverMadeChange = false;

  do {
    MadeChange = false;
    DEBUG(dbgs() << "Sinking iteration " << NumSinkIter << "\n");
    // Process all basic blocks.
    for (Function::iterator I = F.begin(), E = F.end();
         I != E; ++I)
      MadeChange |= ProcessBlock(*I);
    EverMadeChange |= MadeChange;
    NumSinkIter++;
  } while (MadeChange);

  return EverMadeChange;
}

bool OSR_Sinking::ProcessBlock(BasicBlock &BB) {
  // Can't sink anything out of a block that has less than two successors.
  if (BB.getTerminator()->getNumSuccessors() <= 1 || BB.empty()) return false;

  // Don't bother sinking code out of unreachable blocks. In addition to being
  // unprofitable, it can also lead to infinite looping, because in an
  // unreachable loop there may be nowhere to stop.
  if (!DT->isReachableFromEntry(&BB)) return false;

  bool MadeChange = false;

  // Walk the basic block bottom-up.  Remember if we saw a store.
  BasicBlock::iterator I = BB.end();
  --I;
  bool ProcessedBegin = false;
  SmallPtrSet<Instruction *, 8> Stores;
  do {
    Instruction *Inst = I;  // The instruction to sink.

    // Predecrement I (if it's not begin) so that it isn't invalidated by
    // sinking.
    ProcessedBegin = I == BB.begin();
    if (!ProcessedBegin)
      --I;

    if (isa<DbgInfoIntrinsic>(Inst))
      continue;

    if (SinkInstruction(Inst, Stores))
      ++NumSunk, MadeChange = true;

    // If we just processed the first instruction in the block, we're done.
  } while (!ProcessedBegin);

  return MadeChange;
}

static bool isSafeToMove(Instruction *Inst, AliasAnalysis *AA,
                         SmallPtrSetImpl<Instruction *> &Stores) {

  if (Inst->mayWriteToMemory()) {
    Stores.insert(Inst);
    return false;
  }

  if (LoadInst *L = dyn_cast<LoadInst>(Inst)) {
    AliasAnalysis::Location Loc = AA->getLocation(L);
    for (Instruction *S : Stores)
      if (AA->getModRefInfo(S, Loc) & AliasAnalysis::Mod)
        return false;
  }

  if (isa<TerminatorInst>(Inst) || isa<PHINode>(Inst))
    return false;

  return true;
}

/// IsAcceptableTarget - Return true if it is possible to sink the instruction
/// in the specified basic block.
bool OSR_Sinking::IsAcceptableTarget(Instruction *Inst,
                                 BasicBlock *SuccToSinkTo) const {
  assert(Inst && "Instruction to be sunk is null");
  assert(SuccToSinkTo && "Candidate sink target is null");

  // It is not possible to sink an instruction into its own block.  This can
  // happen with loops.
  if (Inst->getParent() == SuccToSinkTo)
    return false;

  // If the block has multiple predecessors, this would introduce computation
  // on different code paths.  We could split the critical edge, but for now we
  // just punt.
  // FIXME: Split critical edges if not backedges.
  if (SuccToSinkTo->getUniquePredecessor() != Inst->getParent()) {
    // We cannot sink a load across a critical edge - there may be stores in
    // other code paths.
    if (!isSafeToSpeculativelyExecute(Inst, DL))
      return false;

    // We don't want to sink across a critical edge if we don't dominate the
    // successor. We could be introducing calculations to new code paths.
    if (!DT->dominates(Inst->getParent(), SuccToSinkTo))
      return false;

    // Don't sink instructions into a loop.
    Loop *succ = LI->getLoopFor(SuccToSinkTo);
    Loop *cur = LI->getLoopFor(Inst->getParent());
    if (succ != nullptr && succ != cur)
      return false;
  }

  // Finally, check that all the uses of the instruction are actually
  // dominated by the candidate
  return AllUsesDominatedByBlock(Inst, SuccToSinkTo);
}

/// SinkInstruction - Determine whether it is safe to sink the specified machine
/// instruction out of its current block into a successor.
bool OSR_Sinking::SinkInstruction(Instruction *Inst,
                              SmallPtrSetImpl<Instruction *> &Stores) {

  // Don't sink static alloca instructions.  CodeGen assumes allocas outside the
  // entry block are dynamically sized stack objects.
  if (AllocaInst *AI = dyn_cast<AllocaInst>(Inst))
    if (AI->isStaticAlloca())
      return false;

  // Check if it's safe to move the instruction.
  if (!isSafeToMove(Inst, AA, Stores))
    return false;

  // FIXME: This should include support for sinking instructions within the
  // block they are currently in to shorten the live ranges.  We often get
  // instructions sunk into the top of a large block, but it would be better to
  // also sink them down before their first use in the block.  This xform has to
  // be careful not to *increase* register pressure though, e.g. sinking
  // "x = y + z" down if it kills y and z would increase the live ranges of y
  // and z and only shrink the live range of x.

  // SuccToSinkTo - This is the successor to sink this instruction to, once we
  // decide.
  BasicBlock *SuccToSinkTo = nullptr;

  // Instructions can only be sunk if all their uses are in blocks
  // dominated by one of the successors.
  // Look at all the postdominators and see if we can sink it in one.
  DomTreeNode *DTN = DT->getNode(Inst->getParent());
  for (DomTreeNode::iterator I = DTN->begin(), E = DTN->end();
      I != E && SuccToSinkTo == nullptr; ++I) {
    BasicBlock *Candidate = (*I)->getBlock();
    if ((*I)->getIDom()->getBlock() == Inst->getParent() &&
        IsAcceptableTarget(Inst, Candidate))
      SuccToSinkTo = Candidate;
  }

  // If no suitable postdominator was found, look at all the successors and
  // decide which one we should sink to, if any.
  for (succ_iterator I = succ_begin(Inst->getParent()),
      E = succ_end(Inst->getParent()); I != E && !SuccToSinkTo; ++I) {
    if (IsAcceptableTarget(Inst, *I))
      SuccToSinkTo = *I;
  }

  // If we couldn't find a block to sink to, ignore this instruction.
  if (!SuccToSinkTo)
    return false;

  DEBUG(dbgs() << "Sink" << *Inst << " (";
        Inst->getParent()->printAsOperand(dbgs(), false);
        dbgs() << " -> ";
        SuccToSinkTo->printAsOperand(dbgs(), false);
        dbgs() << ")\n");

  // Move the instruction.
  /* [OSR] Inst->moveBefore(SuccToSinkTo->getFirstInsertionPt()); */
  Instruction* tmpMoveBefore = SuccToSinkTo->getFirstInsertionPt();
  if (OSR_CM) OSR_CM->sinkInstruction(Inst, tmpMoveBefore);
  Inst->moveBefore(tmpMoveBefore);

  return true;
}
