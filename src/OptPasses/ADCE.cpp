/*
 * OSR-enabled version of lib/Transform/Scalar/ADCE.cpp (LLVM 3.6.2)
 */
#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Transforms/Scalar.h>
#include <llvm/ADT/DepthFirstIterator.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/ADT/Statistic.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/Pass.h>
using namespace llvm;

#define DEBUG_TYPE "adce"

OSR_STATISTIC(NumRemoved, "Number of instructions removed");

namespace {
  struct OSR_ADCE : public FunctionPass {

    static char ID; // Pass identification, replacement for typeid
    CodeMapper* OSR_CM; /* OSR */
    OSR_ADCE() : FunctionPass(ID) {
      initializeOSR_ADCEPass(*PassRegistry::getPassRegistry());
    }

    bool runOnFunction(Function& F) override;

    void getAnalysisUsage(AnalysisUsage& AU) const override {
      AU.setPreservesCFG();
    }
  };
}

char OSR_ADCE::ID = 0;
OSR_INITIALIZE_PASS(OSR_ADCE, "OSR_adce", "[OSR] Aggressive Dead Code Elimination", false, false)

bool OSR_ADCE::runOnFunction(Function& F) {
  if (skipOptnoneFunction(F))
    return false;

  OSR_CM = CodeMapper::getCodeMapper(F); /* OSR */
  if (OSR_CM) OSR_CM->beginOptimization("ADCE");

  SmallPtrSet<Instruction*, 128> alive;
  SmallVector<Instruction*, 128> worklist;

  // Collect the set of "root" instructions that are known live.
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I)
    if (isa<TerminatorInst>(I.getInstructionIterator()) ||
        isa<DbgInfoIntrinsic>(I.getInstructionIterator()) ||
        isa<LandingPadInst>(I.getInstructionIterator()) ||
        I->mayHaveSideEffects()) {
      alive.insert(I.getInstructionIterator());
      worklist.push_back(I.getInstructionIterator());
    }

  // Propagate liveness backwards to operands.
  while (!worklist.empty()) {
    Instruction* curr = worklist.pop_back_val();
    for (Instruction::op_iterator OI = curr->op_begin(), OE = curr->op_end();
         OI != OE; ++OI)
      if (Instruction* Inst = dyn_cast<Instruction>(OI))
        if (alive.insert(Inst).second)
          worklist.push_back(Inst);
  }

  // The inverse of the live set is the dead set.  These are those instructions
  // which have no side effects and do not influence the control flow or return
  // value of the function, and may therefore be deleted safely.
  // NOTE: We reuse the worklist vector here for memory efficiency.
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I)
    if (!alive.count(I.getInstructionIterator())) {
      worklist.push_back(I.getInstructionIterator());
      I->dropAllReferences();
    }

  for (SmallVectorImpl<Instruction *>::iterator I = worklist.begin(),
       E = worklist.end(); I != E; ++I) {
    ++NumRemoved;
    if (OSR_CM) OSR_CM->deleteInstruction(*I); /* OSR */
    (*I)->eraseFromParent();
  }

  return !worklist.empty();
}

FunctionPass* OSR_createAggressiveDCEPass() {
    return new OSR_ADCE();
}