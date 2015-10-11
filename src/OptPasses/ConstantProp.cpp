/*
 * OSR-enabled version of lib/Transform/Scalar/ConstantProp.cpp (LLVM 3.6.2)
 */
#include "CodeMapper.hpp"
#include "OptPasses.hpp"

#include <llvm/Transforms/Scalar.h>
#include <llvm/ADT/Statistic.h>
#include <llvm/Analysis/ConstantFolding.h>
#include <llvm/IR/Constant.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/InstIterator.h>
#include <llvm/IR/Instruction.h>
#include <llvm/Pass.h>
#include <llvm/Target/TargetLibraryInfo.h>
#include <set>

using namespace llvm;

#define DEBUG_TYPE "OSR_constprop"

STATISTIC(NumInstKilled, "Number of instructions killed");

void initializeOSR_ConstantPropagationPass(PassRegistry&);

namespace {
  struct OSR_ConstantPropagation : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    CodeMapper* OSR_CM; /* OSR */
    OSR_ConstantPropagation() : FunctionPass(ID) {
      initializeOSR_ConstantPropagationPass(*PassRegistry::getPassRegistry());
    }

    bool runOnFunction(Function &F) override;

    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesCFG();
      AU.addRequired<TargetLibraryInfo>();
    }
  };
}

char OSR_ConstantPropagation::ID = 0;
OSR_INITIALIZE_PASS_BEGIN(OSR_ConstantPropagation, "OSR_constprop",
                "[OSR] Simple constant propagation", false, false)
OSR_INITIALIZE_PASS_DEPENDENCY(TargetLibraryInfo)
OSR_INITIALIZE_PASS_END(OSR_ConstantPropagation, "OSR_constprop",
                "[OSR] Simple constant propagation", false, false)

FunctionPass* OSR_createConstantPropagationPass() {
  return new OSR_ConstantPropagation();
}

bool OSR_ConstantPropagation::runOnFunction(Function &F) {
  OSR_CM = CodeMapper::getCodeMapper(F); /* OSR */

  // Initialize the worklist to all of the instructions ready to process...
  std::set<Instruction*> WorkList;
  for(inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i) {
      WorkList.insert(&*i);
  }
  bool Changed = false;
  DataLayoutPass *DLP = getAnalysisIfAvailable<DataLayoutPass>();
  const DataLayout *DL = DLP ? &DLP->getDataLayout() : nullptr;
  TargetLibraryInfo *TLI = &getAnalysis<TargetLibraryInfo>();

  while (!WorkList.empty()) {
    Instruction *I = *WorkList.begin();
    WorkList.erase(WorkList.begin());    // Get an element from the worklist...

    if (!I->use_empty())                 // Don't muck with dead instructions...
      if (Constant *C = ConstantFoldInstruction(I, DL, TLI)) {
        // Add all of the users of this instruction to the worklist, they might
        // be constant propagatable now...
        for (User *U : I->users())
          WorkList.insert(cast<Instruction>(U));

        // Replace all of the uses of a variable with uses of the constant.
        if (OSR_CM) OSR_CM->replaceInstruction(I, C); /* OSR */
        I->replaceAllUsesWith(C);

        // Remove the dead instruction.
        WorkList.erase(I);
        if (OSR_CM) OSR_CM->deleteInstruction(I); /* OSR */
        I->eraseFromParent();

        // We made a change to the function...
        Changed = true;
        ++NumInstKilled;
      }
  }
  return Changed;
}
