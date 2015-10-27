/*
 * OSR-enabled version of lib/Transform/Scalar/DCE.cpp (LLVM 3.6.2)
 */
#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Transforms/Scalar.h>
#include <llvm/ADT/Statistic.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Instruction.h>
#include <llvm/Pass.h>
#include <llvm/Target/TargetLibraryInfo.h>
#include <llvm/Transforms/Utils/Local.h>
using namespace llvm;

#define DEBUG_TYPE "dce"

OSR_STATISTIC(DCEEliminated, "Number of insts removed");

namespace {
  //===--------------------------------------------------------------------===//
  // DeadCodeElimination pass implementation
  //
  struct OSR_DCE : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    CodeMapper* OSR_CM; /* OSR */
    OSR_DCE() : FunctionPass(ID) {
      initializeOSR_DCEPass(*PassRegistry::getPassRegistry());
    }

    bool runOnFunction(Function &F) override;

    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesCFG();
    }
 };
}

char OSR_DCE::ID = 0;
OSR_INITIALIZE_PASS(OSR_DCE, "OSR_dce", "[OSR] Dead Code Elimination", false, false)

bool OSR_DCE::runOnFunction(Function &F) {
  if (skipOptnoneFunction(F))
    return false;

  OSR_CM = CodeMapper::getCodeMapper(F); /* OSR */
  if (OSR_CM) OSR_CM->beginOptimization("DCE");

  TargetLibraryInfo *TLI = getAnalysisIfAvailable<TargetLibraryInfo>();

  // Start out with all of the instructions in the worklist...
  std::vector<Instruction*> WorkList;
  for (inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i)
    WorkList.push_back(&*i);

  // Loop over the worklist finding instructions that are dead.  If they are
  // dead make them drop all of their uses, making other instructions
  // potentially dead, and work until the worklist is empty.
  //
  bool MadeChange = false;
  while (!WorkList.empty()) {
    Instruction *I = WorkList.back();
    WorkList.pop_back();

    if (isInstructionTriviallyDead(I, TLI)) { // If the instruction is dead.
      // Loop over all of the values that the instruction uses, if there are
      // instructions being used, add them to the worklist, because they might
      // go dead after this one is removed.
      //
      for (User::op_iterator OI = I->op_begin(), E = I->op_end(); OI != E; ++OI)
        if (Instruction *Used = dyn_cast<Instruction>(*OI))
          WorkList.push_back(Used);

      // Remove the instruction.
      if (OSR_CM) OSR_CM->deleteInstruction(I); /* OSR */
      I->eraseFromParent();

      // Remove the instruction from the worklist if it still exists in it.
      WorkList.erase(std::remove(WorkList.begin(), WorkList.end(), I),
                     WorkList.end());

      MadeChange = true;
      ++DCEEliminated;
    }
  }
  return MadeChange;
}

FunctionPass* OSR_createDeadCodeEliminationPass() {
  return new OSR_DCE();
}

