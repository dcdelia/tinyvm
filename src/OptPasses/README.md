# Quick guide

If you got here, you're probably an OOPSLA reviewer. Hi :-)

This repository hosts OSR-aware versions of the LLVM passes used in the article. Each pass is contained in a separate file, with LCSSA and LoopSimplify being located in the Utils folder.

Lines annotated with __/* OSR */__ have been added to the original LLVM passes in order to track primitive actions (Section 4.3). Each LLVM pass is augmented with a __CodeMapper__ object (../CodeMapper.cpp) that records all performed actions. The object is retrieved in the __OSR_CM__ variable at the beginning of the _runOnFunction_ method that encodes the core of the transformation, and handlers for primitive actions are called over it, e.g., _OSR_CM->deleteInstruction(I);_.

All-caps methods with the _OSR__ prefix in the name (e.g., _OSR_STATISTIC_, _OSR_DEBUG_) are essentially refactored versions of LLVM helper methods used to collect statistics and to specify dependencies/prerequisites for passes and analyses.

Source files Utils/PassUtils.cpp and Utils/SimplifyCFG.cpp contain shared code among LLVM passes that is used to perform recurrent tasks, such as recursive removal of dead instructions or basic-block manipulation. Some of these methods needed to be made OSR-aware themselves, so we imported them from LLVM's codebase and renamed them by adding _OSR__ as prefix. Edits to their bodiesare marked with __/* OSR */__ and involve the updating of a CodeMapper object.

Furthermore, some utility methods in turn called methods that are OSR-transparent but, due to their auxiliary nature, were not visible in LLVM headers. We thus had to copy them as-is in the code, keeping their original name so we could easily distinguish them from those edited to support OSR.

The three main algorithms from the paper are implemented in ../BuildComp.cpp, which essentially takes as input a mapping between program versions assembled by processing the sequence of primitive actions stored in the CodeMapper object across optimization passes.
