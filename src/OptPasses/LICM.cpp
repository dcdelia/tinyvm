/*
 * OSR-enabled version of lib/Transform/Scalar/LICM.cpp (LLVM 3.6.2)
 */
#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Transforms/Scalar.h>
#include <llvm/ADT/Statistic.h>
#include <llvm/Analysis/AliasAnalysis.h>
#include <llvm/Analysis/AliasSetTracker.h>
#include <llvm/Analysis/ConstantFolding.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/LoopPass.h>
#include <llvm/Analysis/ScalarEvolution.h>
#include <llvm/Analysis/ValueTracking.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Metadata.h>
#include <llvm/IR/PredIteratorCache.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Target/TargetLibraryInfo.h>
#include <llvm/Transforms/Utils/Local.h>
#include <llvm/Transforms/Utils/LoopUtils.h>
#include <llvm/Transforms/Utils/SSAUpdater.h>
#include <algorithm>
using namespace llvm;

#define DEBUG_TYPE "licm"

// [OSR] added NumDCE and NumFolded
OSR_STATISTIC(NumDCE       , "Number of instructions DCE'd");
OSR_STATISTIC(NumFolded    , "Number of instructions constant-folded");
OSR_STATISTIC(NumSunk      , "Number of instructions sunk out of loop");
OSR_STATISTIC(NumHoisted   , "Number of instructions hoisted out of loop");
OSR_STATISTIC(NumMovedLoads, "Number of load insts hoisted or sunk");
OSR_STATISTIC(NumMovedCalls, "Number of call insts hoisted or sunk");

/* [OSR] Memory promotion */
//STATISTIC(NumPromoted  , "Number of memory locations promoted to registers");

namespace {
  struct OSR_LICM : public LoopPass {
    static char ID; // Pass identification, replacement for typeid
    CodeMapper* OSR_CM; /* OSR */
    OSR_LICM() : LoopPass(ID) {
      initializeOSR_LICMPass(*PassRegistry::getPassRegistry());
    }

    bool runOnLoop(Loop *L, LPPassManager &LPM) override;

    /// This transformation requires natural loop information & requires that
    /// loop preheaders be inserted into the CFG...
    ///
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesCFG();
      AU.addRequired<DominatorTreeWrapperPass>();
      AU.addRequired<LoopInfo>();
      AU.addRequiredID(OSR_LoopSimplifyID);
      AU.addPreservedID(OSR_LoopSimplifyID);
      AU.addRequiredID(OSR_LCSSAID);
      AU.addPreservedID(OSR_LCSSAID);
      AU.addRequired<AliasAnalysis>();
      AU.addPreserved<AliasAnalysis>();
      AU.addPreserved<ScalarEvolution>();
      AU.addRequired<TargetLibraryInfo>();
    }

    using llvm::Pass::doFinalization;

    bool doFinalization() override {
      assert(LoopToAliasSetMap.empty() && "Didn't free loop alias sets");
      return false;
    }

  private:
    AliasAnalysis *AA;       // Current AliasAnalysis information
    LoopInfo      *LI;       // Current LoopInfo
    DominatorTree *DT;       // Dominator Tree for the current Loop.

    const DataLayout *DL;    // DataLayout for constant folding.
    TargetLibraryInfo *TLI;  // TargetLibraryInfo for constant folding.

    // State that is updated as we process loops.
    bool Changed;            // Set to true when we change anything.
    BasicBlock *Preheader;   // The preheader block of the current loop...
    Loop *CurLoop;           // The current loop we are working on...
    AliasSetTracker *CurAST; // AliasSet information for the current loop...
    bool MayThrow;           // The current loop contains an instruction which
                             // may throw, thus preventing code motion of
                             // instructions with side effects.
    bool HeaderMayThrow;     // Same as previous, but specific to loop header
    DenseMap<Loop*, AliasSetTracker*> LoopToAliasSetMap;

    /// cloneBasicBlockAnalysis - Simple Analysis hook. Clone alias set info.
    void cloneBasicBlockAnalysis(BasicBlock *From, BasicBlock *To,
                                 Loop *L) override;

    /// deleteAnalysisValue - Simple Analysis hook. Delete value V from alias
    /// set.
    void deleteAnalysisValue(Value *V, Loop *L) override;

    /// Simple Analysis hook. Delete loop L from alias set map.
    void deleteAnalysisLoop(Loop *L) override;

    /// SinkRegion - Walk the specified region of the CFG (defined by all blocks
    /// dominated by the specified block, and that are in the current loop) in
    /// reverse depth first order w.r.t the DominatorTree.  This allows us to
    /// visit uses before definitions, allowing us to sink a loop body in one
    /// pass without iteration.
    ///
    void SinkRegion(DomTreeNode *N);

    /// HoistRegion - Walk the specified region of the CFG (defined by all
    /// blocks dominated by the specified block, and that are in the current
    /// loop) in depth first order w.r.t the DominatorTree.  This allows us to
    /// visit definitions before uses, allowing us to hoist a loop body in one
    /// pass without iteration.
    ///
    void HoistRegion(DomTreeNode *N);

    /// inSubLoop - Little predicate that returns true if the specified basic
    /// block is in a subloop of the current one, not the current one itself.
    ///
    bool inSubLoop(BasicBlock *BB) {
      assert(CurLoop->contains(BB) && "Only valid if BB is IN the loop");
      return LI->getLoopFor(BB) != CurLoop;
    }

    /// sink - When an instruction is found to only be used outside of the loop,
    /// this function moves it to the exit blocks and patches up SSA form as
    /// needed.
    ///
    void sink(Instruction &I);

    /// hoist - When an instruction is found to only use loop invariant operands
    /// that is safe to hoist, this instruction is called to do the dirty work.
    ///
    void hoist(Instruction &I);

    /// isSafeToExecuteUnconditionally - Only sink or hoist an instruction if it
    /// is not a trapping instruction or if it is a trapping instruction and is
    /// guaranteed to execute.
    ///
    bool isSafeToExecuteUnconditionally(Instruction &I);

    /// isGuaranteedToExecute - Check that the instruction is guaranteed to
    /// execute.
    ///
    bool isGuaranteedToExecute(Instruction &I);

    /// pointerInvalidatedByLoop - Return true if the body of this loop may
    /// store into the memory location pointed to by V.
    ///
    bool pointerInvalidatedByLoop(Value *V, uint64_t Size,
                                  const AAMDNodes &AAInfo) {
      // Check to see if any of the basic blocks in CurLoop invalidate *V.
      return CurAST->getAliasSetForPointer(V, Size, AAInfo).isMod();
    }

    bool canSinkOrHoistInst(Instruction &I);
    bool isNotUsedInLoop(Instruction &I);

    /// \brief Create a copy of the instruction in the exit block and patch up
    /// SSA.
    /// PN is a user of I in ExitBlock that can be used to get the number and
    /// list of predecessors fast.
    Instruction *CloneInstructionInExitBlock(Instruction &I,
                                             BasicBlock &ExitBlock,
                                             PHINode &PN);
  };
}

char OSR_LICM::ID = 0;
OSR_INITIALIZE_PASS_BEGIN(OSR_LICM, "OSR_licm", "[OSR] Loop Invariant Code Motion", false, false)
OSR_INITIALIZE_PASS_DEPENDENCY(DominatorTreeWrapperPass)
OSR_INITIALIZE_PASS_DEPENDENCY(LoopInfo)
OSR_INITIALIZE_PASS_DEPENDENCY(OSR_LoopSimplify)
OSR_INITIALIZE_PASS_DEPENDENCY(OSR_LCSSA)
OSR_INITIALIZE_PASS_DEPENDENCY(ScalarEvolution)
OSR_INITIALIZE_PASS_DEPENDENCY(TargetLibraryInfo)
OSR_INITIALIZE_AG_DEPENDENCY(AliasAnalysis)
OSR_INITIALIZE_PASS_END(OSR_LICM, "OSR_licm", "[OSR] Loop Invariant Code Motion", false, false)

Pass* OSR_createLICMPass() { return new OSR_LICM(); }

/// Hoist expressions out of the specified loop. Note, alias info for inner
/// loop is not preserved so it is not a good idea to run LICM multiple
/// times on one loop.
///
bool OSR_LICM::runOnLoop(Loop *L, LPPassManager &LPM) {
  if (skipOptnoneFunction(L))
    return false;

  OSR_CM = CodeMapper::getCodeMapper(*L->getHeader()->getParent()); /* OSR */
  if (OSR_CM) OSR_CM->beginOptimization("LICM");

  Changed = false;

  // Get our Loop and Alias Analysis information...
  LI = &getAnalysis<LoopInfo>();
  AA = &getAnalysis<AliasAnalysis>();
  DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();

  DataLayoutPass *DLP = getAnalysisIfAvailable<DataLayoutPass>();
  DL = DLP ? &DLP->getDataLayout() : nullptr;
  TLI = &getAnalysis<TargetLibraryInfo>();

  assert(L->isLCSSAForm(*DT) && "Loop is not in LCSSA form.");

  CurAST = new AliasSetTracker(*AA);
  // Collect Alias info from subloops.
  for (Loop::iterator LoopItr = L->begin(), LoopItrE = L->end();
       LoopItr != LoopItrE; ++LoopItr) {
    Loop *InnerL = *LoopItr;
    AliasSetTracker *InnerAST = LoopToAliasSetMap[InnerL];
    assert(InnerAST && "Where is my AST?");

    // What if InnerLoop was modified by other passes ?
    CurAST->add(*InnerAST);

    // Once we've incorporated the inner loop's AST into ours, we don't need the
    // subloop's anymore.
    delete InnerAST;
    LoopToAliasSetMap.erase(InnerL);
  }

  CurLoop = L;

  // Get the preheader block to move instructions into...
  Preheader = L->getLoopPreheader();

  // Loop over the body of this loop, looking for calls, invokes, and stores.
  // Because subloops have already been incorporated into AST, we skip blocks in
  // subloops.
  //
  for (Loop::block_iterator I = L->block_begin(), E = L->block_end();
       I != E; ++I) {
    BasicBlock *BB = *I;
    if (LI->getLoopFor(BB) == L)        // Ignore blocks in subloops.
      CurAST->add(*BB);                 // Incorporate the specified basic block
  }

  HeaderMayThrow = false;
  BasicBlock *Header = L->getHeader();
  for (BasicBlock::iterator I = Header->begin(), E = Header->end();
       (I != E) && !HeaderMayThrow; ++I)
    HeaderMayThrow |= I->mayThrow();
  MayThrow = HeaderMayThrow;
  // TODO: We've already searched for instructions which may throw in subloops.
  // We may want to reuse this information.
  for (Loop::block_iterator BB = L->block_begin(), BBE = L->block_end();
       (BB != BBE) && !MayThrow ; ++BB)
    for (BasicBlock::iterator I = (*BB)->begin(), E = (*BB)->end();
         (I != E) && !MayThrow; ++I)
      MayThrow |= I->mayThrow();

  // We want to visit all of the instructions in this loop... that are not parts
  // of our subloops (they have already had their invariants hoisted out of
  // their loop, into this loop, so there is no need to process the BODIES of
  // the subloops).
  //
  // Traverse the body of the loop in depth first order on the dominator tree so
  // that we are guaranteed to see definitions before we see uses.  This allows
  // us to sink instructions in one pass, without iteration.  After sinking
  // instructions, we perform another pass to hoist them out of the loop.
  //
  if (L->hasDedicatedExits())
    SinkRegion(DT->getNode(L->getHeader()));
  if (Preheader)
    HoistRegion(DT->getNode(L->getHeader()));

  // Now that all loop invariants have been removed from the loop, promote any
  // memory references to scalars that we can.

  /* OSR: no Promotion at the moment */

  // Check that neither this loop nor its parent have had LCSSA broken. LICM is
  // specifically moving instructions across the loop boundary and so it is
  // especially in need of sanity checking here.
  assert(L->isLCSSAForm(*DT) && "Loop not left in LCSSA form after LICM!");
  assert((!L->getParentLoop() || L->getParentLoop()->isLCSSAForm(*DT)) &&
         "Parent loop not left in LCSSA form after LICM!");

  // Clear out loops state information for the next iteration
  CurLoop = nullptr;
  Preheader = nullptr;

  // If this loop is nested inside of another one, save the alias information
  // for when we process the outer loop.
  if (L->getParentLoop())
    LoopToAliasSetMap[L] = CurAST;
  else
    delete CurAST;
  return Changed;
}

/// SinkRegion - Walk the specified region of the CFG (defined by all blocks
/// dominated by the specified block, and that are in the current loop) in
/// reverse depth first order w.r.t the DominatorTree.  This allows us to visit
/// uses before definitions, allowing us to sink a loop body in one pass without
/// iteration.
///
void OSR_LICM::SinkRegion(DomTreeNode *N) {
  assert(N != nullptr && "Null dominator tree node?");
  BasicBlock *BB = N->getBlock();

  // If this subregion is not in the top level loop at all, exit.
  if (!CurLoop->contains(BB)) return;

  // We are processing blocks in reverse dfo, so process children first.
  const std::vector<DomTreeNode*> &Children = N->getChildren();
  for (unsigned i = 0, e = Children.size(); i != e; ++i)
    SinkRegion(Children[i]);

  // Only need to process the contents of this block if it is not part of a
  // subloop (which would already have been processed).
  if (inSubLoop(BB)) return;

  for (BasicBlock::iterator II = BB->end(); II != BB->begin(); ) {
    Instruction &I = *--II;

    // If the instruction is dead, we would try to sink it because it isn't used
    // in the loop, instead, just delete it.
    if (isInstructionTriviallyDead(&I, TLI)) {
      DEBUG(dbgs() << "LICM deleting dead inst: " << I << '\n');
      ++II;
      CurAST->deleteValue(&I);
      if (OSR_CM) OSR_CM->deleteInstruction(&I); /* OSR */
      I.eraseFromParent();
      ++NumDCE;
      Changed = true;
      continue;
    }

    // Check to see if we can sink this instruction to the exit blocks
    // of the loop.  We can do this if the all users of the instruction are
    // outside of the loop.  In this case, it doesn't even matter if the
    // operands of the instruction are loop invariant.
    //
    if (isNotUsedInLoop(I) && canSinkOrHoistInst(I)) {
      ++II;
      sink(I);
    }
  }
}

/// HoistRegion - Walk the specified region of the CFG (defined by all blocks
/// dominated by the specified block, and that are in the current loop) in depth
/// first order w.r.t the DominatorTree.  This allows us to visit definitions
/// before uses, allowing us to hoist a loop body in one pass without iteration.
///
void OSR_LICM::HoistRegion(DomTreeNode *N) {
  assert(N != nullptr && "Null dominator tree node?");
  BasicBlock *BB = N->getBlock();

  // If this subregion is not in the top level loop at all, exit.
  if (!CurLoop->contains(BB)) return;

  // Only need to process the contents of this block if it is not part of a
  // subloop (which would already have been processed).
  if (!inSubLoop(BB))
    for (BasicBlock::iterator II = BB->begin(), E = BB->end(); II != E; ) {
      Instruction &I = *II++;

      // Try constant folding this instruction.  If all the operands are
      // constants, it is technically hoistable, but it would be better to just
      // fold it.
      if (Constant *C = ConstantFoldInstruction(&I, DL, TLI)) {
        DEBUG(dbgs() << "LICM folding inst: " << I << "  --> " << *C << '\n');
        CurAST->copyValue(&I, C);
        CurAST->deleteValue(&I);
        if (OSR_CM) { /* OSR */
            OSR_CM->replaceAllUsesWith(&I, C);
            OSR_CM->deleteInstruction(&I);
        }
        I.replaceAllUsesWith(C);
        I.eraseFromParent();
        ++NumFolded;
        continue;
      }

      // Try hoisting the instruction out to the preheader.  We can only do this
      // if all of the operands of the instruction are loop invariant and if it
      // is safe to hoist the instruction.
      //
      if (CurLoop->hasLoopInvariantOperands(&I) && canSinkOrHoistInst(I) &&
          isSafeToExecuteUnconditionally(I))
        hoist(I);
    }

  const std::vector<DomTreeNode*> &Children = N->getChildren();
  for (unsigned i = 0, e = Children.size(); i != e; ++i)
    HoistRegion(Children[i]);
}

/// canSinkOrHoistInst - Return true if the hoister and sinker can handle this
/// instruction.
///
bool OSR_LICM::canSinkOrHoistInst(Instruction &I) {
  // Loads have extra constraints we have to verify before we can hoist them.
  if (LoadInst *LI = dyn_cast<LoadInst>(&I)) {
    if (!LI->isUnordered())
      return false;        // Don't hoist volatile/atomic loads!

    // Loads from constant memory are always safe to move, even if they end up
    // in the same alias set as something that ends up being modified.
    if (AA->pointsToConstantMemory(LI->getOperand(0)))
      return true;
    if (LI->getMetadata(LLVMContext::MD_invariant_load))
      return true;

    // Don't hoist loads which have may-aliased stores in loop.
    uint64_t Size = 0;
    if (LI->getType()->isSized())
      Size = AA->getTypeStoreSize(LI->getType());

    AAMDNodes AAInfo;
    LI->getAAMetadata(AAInfo);

    return !pointerInvalidatedByLoop(LI->getOperand(0), Size, AAInfo);
  } else if (CallInst *CI = dyn_cast<CallInst>(&I)) {
    // Don't sink or hoist dbg info; it's legal, but not useful.
    if (isa<DbgInfoIntrinsic>(I))
      return false;

    // Handle simple cases by querying alias analysis.
    AliasAnalysis::ModRefBehavior Behavior = AA->getModRefBehavior(CI);
    if (Behavior == AliasAnalysis::DoesNotAccessMemory)
      return true;
    if (AliasAnalysis::onlyReadsMemory(Behavior)) {
      // If this call only reads from memory and there are no writes to memory
      // in the loop, we can hoist or sink the call as appropriate.
      bool FoundMod = false;
      for (AliasSetTracker::iterator I = CurAST->begin(), E = CurAST->end();
           I != E; ++I) {
        AliasSet &AS = *I;
        if (!AS.isForwardingAliasSet() && AS.isMod()) {
          FoundMod = true;
          break;
        }
      }
      if (!FoundMod) return true;
    }

    // FIXME: This should use mod/ref information to see if we can hoist or
    // sink the call.

    return false;
  }

  // Only these instructions are hoistable/sinkable.
  if (!isa<BinaryOperator>(I) && !isa<CastInst>(I) && !isa<SelectInst>(I) &&
      !isa<GetElementPtrInst>(I) && !isa<CmpInst>(I) &&
      !isa<InsertElementInst>(I) && !isa<ExtractElementInst>(I) &&
      !isa<ShuffleVectorInst>(I) && !isa<ExtractValueInst>(I) &&
      !isa<InsertValueInst>(I))
    return false;

  return isSafeToExecuteUnconditionally(I);
}

/// \brief Returns true if a PHINode is a trivially replaceable with an
/// Instruction.
///
/// This is true when all incoming values are that instruction. This pattern
/// occurs most often with LCSSA PHI nodes.
static bool isTriviallyReplacablePHI(PHINode &PN, Instruction &I) {
  for (unsigned i = 0, e = PN.getNumIncomingValues(); i != e; ++i)
    if (PN.getIncomingValue(i) != &I)
      return false;

  return true;
}

/// isNotUsedInLoop - Return true if the only users of this instruction are
/// outside of the loop.  If this is true, we can sink the instruction to the
/// exit blocks of the loop.
///
bool OSR_LICM::isNotUsedInLoop(Instruction &I) {
  for (User *U : I.users()) {
    Instruction *UI = cast<Instruction>(U);
    if (PHINode *PN = dyn_cast<PHINode>(UI)) {
      // A PHI node where all of the incoming values are this instruction are
      // special -- they can just be RAUW'ed with the instruction and thus
      // don't require a use in the predecessor. This is a particular important
      // special case because it is the pattern found in LCSSA form.
      if (isTriviallyReplacablePHI(*PN, I)) {
        if (CurLoop->contains(PN))
          return false;
        else
          continue;
      }

      // Otherwise, PHI node uses occur in predecessor blocks if the incoming
      // values. Check for such a use being inside the loop.
      for (unsigned i = 0, e = PN->getNumIncomingValues(); i != e; ++i)
        if (PN->getIncomingValue(i) == &I)
          if (CurLoop->contains(PN->getIncomingBlock(i)))
            return false;

      continue;
    }

    if (CurLoop->contains(UI))
      return false;
  }
  return true;
}

Instruction *OSR_LICM::CloneInstructionInExitBlock(Instruction &I,
                                               BasicBlock &ExitBlock,
                                               PHINode &PN) {
  Instruction *New = I.clone();
  ExitBlock.getInstList().insert(ExitBlock.getFirstInsertionPt(), New);
  if (!I.getName().empty()) New->setName(I.getName() + ".le");

  // Build LCSSA PHI nodes for any in-loop operands. Note that this is
  // particularly cheap because we can rip off the PHI node that we're
  // replacing for the number and blocks of the predecessors.
  // OPT: If this shows up in a profile, we can instead finish sinking all
  // invariant instructions, and then walk their operands to re-establish
  // LCSSA. That will eliminate creating PHI nodes just to nuke them when
  // sinking bottom-up.
  for (User::op_iterator OI = New->op_begin(), OE = New->op_end(); OI != OE;
       ++OI)
    if (Instruction *OInst = dyn_cast<Instruction>(*OI))
      if (Loop *OLoop = LI->getLoopFor(OInst->getParent()))
        if (!OLoop->contains(&PN)) {
          PHINode *OpPN =
              PHINode::Create(OInst->getType(), PN.getNumIncomingValues(),
                              OInst->getName() + ".lcssa", ExitBlock.begin());
          for (unsigned i = 0, e = PN.getNumIncomingValues(); i != e; ++i)
            OpPN->addIncoming(OInst, PN.getIncomingBlock(i));
          if (OSR_CM) OSR_CM->addInstruction(OpPN); /* OSR */
          *OI = OpPN;
        }
  return New;
}

/// sink - When an instruction is found to only be used outside of the loop,
/// this function moves it to the exit blocks and patches up SSA form as needed.
/// This method is guaranteed to remove the original instruction from its
/// position, and may either delete it or move it to outside of the loop.
///
void OSR_LICM::sink(Instruction &I) {
  DEBUG(dbgs() << "LICM sinking instruction: " << I << "\n");

  if (isa<LoadInst>(I)) ++NumMovedLoads;
  else if (isa<CallInst>(I)) ++NumMovedCalls;
  ++NumSunk;
  Changed = true;

#ifndef NDEBUG
  SmallVector<BasicBlock *, 32> ExitBlocks;
  CurLoop->getUniqueExitBlocks(ExitBlocks);
  SmallPtrSet<BasicBlock *, 32> ExitBlockSet(ExitBlocks.begin(), ExitBlocks.end());
#endif

  // Clones of this instruction. Don't create more than one per exit block!
  SmallDenseMap<BasicBlock *, Instruction *, 32> SunkCopies;

  // If this instruction is only used outside of the loop, then all users are
  // PHI nodes in exit blocks due to LCSSA form. Just RAUW them with clones of
  // the instruction.
  while (!I.use_empty()) {
    Instruction *User = I.user_back();
    if (!DT->isReachableFromEntry(User->getParent())) {
      /* OSR: no action taken */
      User->replaceUsesOfWith(&I, UndefValue::get(I.getType()));
      continue;
    }
    // The user must be a PHI node.
    PHINode *PN = cast<PHINode>(User);

    BasicBlock *ExitBlock = PN->getParent();
    assert(ExitBlockSet.count(ExitBlock) &&
           "The LCSSA PHI is not in an exit block!");

    Instruction *New;
    auto It = SunkCopies.find(ExitBlock);
    if (It != SunkCopies.end())
      New = It->second;
    else
      New = SunkCopies[ExitBlock] =
          CloneInstructionInExitBlock(I, *ExitBlock, *PN);

    if (OSR_CM) { /* OSR */
        OSR_CM->replaceAllUsesWith(PN, New);
        OSR_CM->deleteInstruction(PN);
    }
    PN->replaceAllUsesWith(New);
    PN->eraseFromParent();
  }

  CurAST->deleteValue(&I);
  if (OSR_CM) OSR_CM->deleteInstruction(&I); /* OSR */
  I.eraseFromParent();
}

/// hoist - When an instruction is found to only use loop invariant operands
/// that is safe to hoist, this instruction is called to do the dirty work.
///
void OSR_LICM::hoist(Instruction &I) {
  DEBUG(dbgs() << "LICM hoisting to " << Preheader->getName() << ": "
        << I << "\n");

  // Move the new node to the Preheader, before its terminator.
  /* [OSR] I.moveBefore(Preheader->getTerminator()); */
  Instruction* tmpMoveBefore = Preheader->getTerminator();
  if (OSR_CM) OSR_CM->hoistInstruction(&I, tmpMoveBefore);
  I.moveBefore(tmpMoveBefore);

  if (isa<LoadInst>(I)) ++NumMovedLoads;
  else if (isa<CallInst>(I)) ++NumMovedCalls;
  ++NumHoisted;
  Changed = true;
}

/// isSafeToExecuteUnconditionally - Only sink or hoist an instruction if it is
/// not a trapping instruction or if it is a trapping instruction and is
/// guaranteed to execute.
///
bool OSR_LICM::isSafeToExecuteUnconditionally(Instruction &Inst) {
  // If it is not a trapping instruction, it is always safe to hoist.
  if (isSafeToSpeculativelyExecute(&Inst, DL))
    return true;

  return isGuaranteedToExecute(Inst);
}

bool OSR_LICM::isGuaranteedToExecute(Instruction &Inst) {

  // We have to check to make sure that the instruction dominates all
  // of the exit blocks.  If it doesn't, then there is a path out of the loop
  // which does not execute this instruction, so we can't hoist it.

  // If the instruction is in the header block for the loop (which is very
  // common), it is always guaranteed to dominate the exit blocks.  Since this
  // is a common case, and can save some work, check it now.
  if (Inst.getParent() == CurLoop->getHeader())
    // If there's a throw in the header block, we can't guarantee we'll reach
    // Inst.
    return !HeaderMayThrow;

  // Somewhere in this loop there is an instruction which may throw and make us
  // exit the loop.
  if (MayThrow)
    return false;

  // Get the exit blocks for the current loop.
  SmallVector<BasicBlock*, 8> ExitBlocks;
  CurLoop->getExitBlocks(ExitBlocks);

  // Verify that the block dominates each of the exit blocks of the loop.
  for (unsigned i = 0, e = ExitBlocks.size(); i != e; ++i)
    if (!DT->dominates(Inst.getParent(), ExitBlocks[i]))
      return false;

  // As a degenerate case, if the loop is statically infinite then we haven't
  // proven anything since there are no exit blocks.
  if (ExitBlocks.empty())
    return false;

  return true;
}

/// cloneBasicBlockAnalysis - Simple Analysis hook. Clone alias set info.
void OSR_LICM::cloneBasicBlockAnalysis(BasicBlock *From, BasicBlock *To, Loop *L) {
  AliasSetTracker *AST = LoopToAliasSetMap.lookup(L);
  if (!AST)
    return;

  AST->copyValue(From, To);
}

/// deleteAnalysisValue - Simple Analysis hook. Delete value V from alias
/// set.
void OSR_LICM::deleteAnalysisValue(Value *V, Loop *L) {
  AliasSetTracker *AST = LoopToAliasSetMap.lookup(L);
  if (!AST)
    return;

  AST->deleteValue(V);
}

/// Simple Analysis hook. Delete value L from alias set map.
void OSR_LICM::deleteAnalysisLoop(Loop *L) {
  AliasSetTracker *AST = LoopToAliasSetMap.lookup(L);
  if (!AST)
    return;

  delete AST;
  LoopToAliasSetMap.erase(L);
}
