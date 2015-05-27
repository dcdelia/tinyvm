#include "OSRLibrary.hpp"
#include "StateMap.hpp"

#include "llvm/PassManager.h"
#include "llvm/Analysis/DominanceFrontier.h"
#include "llvm/Analysis/DomPrinter.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/SSAUpdater.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <iostream>

#include <vector>

using namespace llvm;

/**
 * Global TODO list
 * - check hasName() before setName()
 * - use better aliases for types
 * - use const references more?
 * - nomi strani in OSRDestFun
 */

/**
 * Public methods
 */

static bool verifyAux(Function* F, raw_os_ostream* OS) {
    //fprintf(stderr, "WHD!!!!!\n");
    bool ret = verifyFunction(*F, OS); // according to the docs (which version??), returns false if there are no errors
    if (ret) F->dump();
    return ret;
}

OSRLibrary::OSRPair OSRLibrary::insertFinalizedOSR(Function &F1, BasicBlock &B1, Function &F2,
                        BasicBlock &B2, OSRLibrary::OSRCond &cond, StateMap &M,
                        const Twine& F1NewName, const Twine& F2NewName) { // default value for the last two parameters is ""
    // common stuff for the generation of F1' and F2'
    Function *newSrcFun, *OSRDestFun;
    raw_os_ostream errStream(std::cerr);
    StateMap::BBSrcDestPair srcDestBlocks = std::pair<BasicBlock*, BasicBlock*>(&B1, &B2);
    std::vector<Value*> valuesToPass = M.getValuesToFetchFromSrcFunction(srcDestBlocks);
    assert(F1.getReturnType() == F2.getReturnType());

    // workaround: verifyFunction() segfaults if a Function is not in a Module
    Module *tmpMod = new Module("OSRtmpMod", getGlobalContext());

    /* [Prepare F2' aka OSRDest] Workflow:
     * (1)  Generate prototype for OSRDest function
     * (2)  Generate OSRDest function and set argument names
     * (3)  Duplicate the body of F2 inside OSRDest
     * (4)  Apply attributes (e.g., by value) to "copied" live arguments when required
     * (5)  Compute information for dead arguments in dest
     * (6)  Generate new entrypoint and retrieve mapping for live values
     * (7)  Perform updates of uses using ValueToValueMapTy information
     * (8)  Insert new entrypoint
     * (9)  Replace all updated uses and insert phi nodes
     * (10) Check generated function for correctness
     */
    ValueToValueMapTy destToOSRDestVMap;
    ValueToValueMapTy updatesForDestToOSRDestVMap;
    Function* dest = &F2;
    BasicBlock* dest_block = &B2;
    LivenessAnalysis::LiveValues& liveInAtDestBlock = M.getLivenessResultsForDestFunction().getLiveInValues(srcDestBlocks.second);

    FunctionType* OSRDestFTy = generatePrototypeForOSRDest(&F1, valuesToPass); // (1)
    Twine OSRDestFunName = F2NewName.isTriviallyEmpty() ? Twine("OSR", dest->getName()) : const_cast<Twine&>(F2NewName); // TODO index or f1@l1TOf2@l2

    OSRDestFun = Function::Create(OSRDestFTy, dest->getLinkage(), OSRDestFunName); // (2)
    Function::arg_iterator OSRDestArgIt = OSRDestFun->arg_begin();
    for (Value* src_v: valuesToPass) {
        (OSRDestArgIt++)->setName(Twine(src_v->getName(), "_osr")); // maybe from dest rather than src function???
    }
    assert(OSRDestArgIt == OSRDestFun->arg_end());

    copyBodyIntoNewFunction(dest, OSRDestFun, destToOSRDestVMap); // (3)

    applyAttributesToArguments(OSRDestFun, dest, valuesToPass); // (4)

    std::map<const Argument*, Value*> deadArgsMap = getMapForDeadArgs(dest, valuesToPass); // (5)
    // TODO this is broken: should use SSAUpdater! (see simple_loop_SSA.ll with missing phi node entry)

    BasicBlock* oldEntryPoint = &OSRDestFun->getEntryBlock();  // (6)
    BasicBlock* newEntryPoint = M.createEntryPointForOSRDestFunction(srcDestBlocks,
                OSRDestFun, destToOSRDestVMap, updatesForDestToOSRDestVMap, valuesToPass);

    updateDestToOSRDestVMapForArguments(dest, destToOSRDestVMap, deadArgsMap, updatesForDestToOSRDestVMap); // (7)
    updateOpMappingForClonedBody(OSRDestFun, dest, destToOSRDestVMap);

    newEntryPoint->insertInto(OSRDestFun, oldEntryPoint); // (8)
    assert(&OSRDestFun->getEntryBlock() == newEntryPoint);

    replaceUsesWithNewValues(OSRDestFun, dest_block, liveInAtDestBlock, destToOSRDestVMap, updatesForDestToOSRDestVMap); // (9)

    tmpMod->getFunctionList().push_back(OSRDestFun); // (10)
    verifyAux(OSRDestFun, &errStream);

    /* [Prepare F1' aka newSrc] Workflow:
     * (1) Duplicate F1 into newSrc
     * (2) Regenerate OSRCond using information from VMap (updates the map too!)
     * (3) Generate OSRBlock to invoke OSRDestFun and return its result
     * (4) Insert code to compute OSR condition and jump to OSRBlock
     * (5) Check generated function for correctness
     */
    Function* src = &F1;
    ValueToValueMapTy srcToNewSrcVMap;

    Twine newSrcFunName = F1NewName.isTriviallyEmpty() ? Twine(src->getName(), "WithOSR") : const_cast<Twine&>(F1NewName); // (1) TODO use better names
    newSrcFun = duplicateFunction(src, newSrcFunName, srcToNewSrcVMap);
    std::vector<Value*> newValuesToPass; // I have to regenerate valuesToPass as well!
    for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
        newValuesToPass.push_back(srcToNewSrcVMap[*it]);
    }

    OSRCond newCond = regenerateOSRCond(cond, srcToNewSrcVMap); // (2)

    BasicBlock* OSR_B = generateTriggerOSRBlock(OSRDestFun, newValuesToPass); // (3)
    OSR_B->insertInto(newSrcFun);

    Twine splitBlockName("splitBlockForOSRTo", OSRDestFun->getName()); // (4)
    BasicBlock* srcBlock = cast<BasicBlock>(srcToNewSrcVMap[srcDestBlocks.second]);
    BasicBlock* splittedBlock = insertOSRCond (newSrcFun, srcBlock, OSR_B, newCond, splitBlockName);

    tmpMod->getFunctionList().push_back(newSrcFun); // (5)
    verifyAux(newSrcFun, &errStream);

    //newSrcFun->viewCFG();

    if (true) {
        legacy::FunctionPassManager *FPM = new legacy::FunctionPassManager(tmpMod);
        //FPM->add(createDomOnlyPrinterPass()); // broken
        FPM->add(createCFGSimplificationPass());

        FPM->run(*OSRDestFun); // will remove the old entrypoint and fix PHI nodes
        verifyAux(OSRDestFun, &errStream);

        FPM->run(*newSrcFun);
        verifyAux(newSrcFun, &errStream);
    }


    OSRDestFun->removeFromParent();
    newSrcFun->removeFromParent();

    return OSRPair(newSrcFun, OSRDestFun);
}

Function* OSRLibrary::insertOpenOSR(Function &F, BasicBlock&B, OSRLibrary::OSRCond &cond,
                        OSRLibrary::DestFunGenerator callback) {
    return nullptr;
}

Function* OSRLibrary::prepareForRedirection(Function &F) {
    return nullptr;
}

void OSRLibrary::enableRedirection(uint64_t f, uint64_t destination) {
    // NOTE: I-cache invalidation does not belong to the OSR Library
}


/**
 * Auxiliary methods
 */

FunctionType* OSRLibrary::generatePrototypeForOSRDest(Function* src, std::vector<Value*> &valuesToPass) {
    std::vector<Type*> ArgTypes;
    for (Value* v: valuesToPass) {
        ArgTypes.push_back(v->getType());
    }
    FunctionType *NFTy = FunctionType::get(src->getReturnType(), ArgTypes, false);

    return NFTy;
}

void OSRLibrary::applyAttributesToArguments(Function* NF, Function* F, std::vector<Value*> &valuesToPass) {
    // check CloneFunctionInto() from CloneFunction.cpp for more details
    AttributeSet FunAttrs = F->getAttributes();
    for (const Argument &OldArg: F->args()) {
        const Value& old_v = cast<Value>(OldArg);
        std::vector<Value*>::iterator it = std::find(valuesToPass.begin(), valuesToPass.end(), &old_v);
        if (it == valuesToPass.end()) continue; // argument is not live at the OSR point
        Value* v = *it;
        AttributeSet attrs = FunAttrs.getParamAttributes(OldArg.getArgNo() + 1); // 0 is for the function?
        if (attrs.getNumSlots() > 0) {
            Argument* arg = cast<Argument>(v);
            arg->addAttr(attrs);
        }
    }
}

std::map<const Argument*, Value*> OSRLibrary::getMapForDeadArgs(Function *orig, std::vector<Value*> &valuesToPass) {
    std::map<const Argument*, Value*> deadArgsStorageMap;

    for (const Argument &arg_ref: orig->args()) {
        std::vector<Value*>::iterator it = std::find(valuesToPass.begin(), valuesToPass.end(), &(cast<Value>(arg_ref)));
        if (it == valuesToPass.end()) { // argument is not live at the OSR point
            const Argument* arg = &arg_ref;
            Value* v = UndefValue::get(arg->getType()); // see also DeleteDeadBlock() in BasicBlockUtils.cpp
            deadArgsStorageMap.insert(std::pair<const Argument*, Value*>(arg, v));
        }
    }

    return deadArgsStorageMap;
}

void OSRLibrary::copyBodyIntoNewFunction(Function* F, Function *NF, ValueToValueMapTy& VMap) {
    // NOTE: unfortunately I can't clone debug info metadata at the moment :-(

    /** The following block is borrowed from CloneFunctionInto() in CloneFunction.cpp **/
    Function *OldFunc = F, *NewFunc = NF;
    const char* NameSuffix = "";
    ClonedCodeInfo *CodeInfo = nullptr;
    /* SmallVector<ReturnInst*, 8> Returns; // ignore returns cloned */
    for (Function::const_iterator BI = OldFunc->begin(), BE = OldFunc->end();
        BI != BE; ++BI) {
        const BasicBlock &BB = *BI;

        // Create a new basic block and copy instructions into it!
        BasicBlock *CBB = CloneBasicBlock(&BB, VMap, NameSuffix, NewFunc, CodeInfo);

        // Add basic block mapping.
        VMap[&BB] = CBB;

        // It is only legal to clone a function if a block address within that
        // function is never referenced outside of the function.  Given that, we
        // want to map block addresses from the old function to block addresses in
        // the clone. (This is different from the generic ValueMapper
        // implementation, which generates an invalid blockaddress when
        // cloning a function.)
        if (BB.hasAddressTaken()) {
            Constant *OldBBAddr = BlockAddress::get(const_cast<Function*>(OldFunc),
                                                    const_cast<BasicBlock*>(&BB));
            VMap[OldBBAddr] = BlockAddress::get(NewFunc, CBB);
        }

        /*
        // Note return instructions for the caller.
        if (ReturnInst *RI = dyn_cast<ReturnInst>(CBB->getTerminator()))
            Returns.push_back(RI);
        */
    }

    /* NOTE: do not forget to execute updateOpMappingForClonedBody() as
     * you still have to fix all the uses of values using VMap! */
}

void OSRLibrary::updateOpMappingForClonedBody(Function* NF, Function* F, ValueToValueMapTy &VMap) {
    // Credits: CloneFunctionInto() from CloneFunction.cpp
    bool ModuleLevelChanges = false;

    // Loop over all of the instructions in the function, fixing up operand
    // references as we go.  This uses VMap to do all the hard work.
    for (Function::iterator BB = cast<BasicBlock>(VMap[F->begin()]), BE = NF->end(); BB != BE; ++BB) {
        // Loop over all instructions, fixing each one as we find it...
        for (BasicBlock::iterator II = BB->begin(); II != BB->end(); ++II) {
            RemapInstruction(II, VMap, ModuleLevelChanges ? RF_None : RF_NoModuleLevelChanges);
        }
    }
}

void OSRLibrary::updateDestToOSRDestVMapForArguments(Function* dest, ValueToValueMapTy &destToOSRDestVMap,
        std::map<const Argument*, Value*> &deadArgsMap, ValueToValueMapTy &updatesForDestToOSRDestVMap) {
    size_t num_args = dest->getArgumentList().size();
    size_t index = 0;
    std::map<const Argument*, Value*>::iterator deadIter;
    for (deadIter = deadArgsMap.begin(); deadIter != deadArgsMap.end(); ++deadIter) {
        destToOSRDestVMap[deadIter->first] = deadIter->second;
        ++index;
    }
    assert(index <= num_args);
    ValueToValueMapTy::iterator liveIter;
    for (liveIter = updatesForDestToOSRDestVMap.begin(); liveIter != updatesForDestToOSRDestVMap.end(); ) {
        if (isa<Argument>(liveIter->first)) {
            destToOSRDestVMap[liveIter->first] = liveIter->second;
            updatesForDestToOSRDestVMap.erase(liveIter++); // and also remove entry from map
            ++index;
        } else {
            ++liveIter;
        }
    }
    assert(index == num_args);
}

void OSRLibrary::replaceUsesWithNewValues(Function* NF, BasicBlock* origBlock, LivenessAnalysis::LiveValues &liveInForOrigBlock, ValueToValueMapTy &VMap, ValueToValueMapTy &updatesForVMap) {
    BasicBlock* entryPoint = &NF->getEntryBlock();
    BasicBlock* resumeBlock = cast<BasicBlock>(VMap[origBlock]);
    Instruction* oldFirstInstInResumeBlock = resumeBlock->getInstList().begin();

    /* For each live value at the target basic block, I have three cases:
     * 1) value is defined through a PHI node
     * 2) value is uniquely defined in the body
     * 3) value is an argument
     * In the first case, I have only to add an edge to the PHI node. In
     * the second case, I will create a PHI node at the beginning of the
     * target block and I will replace all the uses of the value with
     * uses of the value defined at the newly created PHI node. The third
     * case has already been handled in a previous step. */
    int replacedUses = 0;

    // use SSAUpdater to fix the CFG to keep the SSA form consistent
    SmallVector<PHINode*, 8> insertedPHINodes;
    SSAUpdater updateSSA(&insertedPHINodes); // TODO: use argument instead

    for (LivenessAnalysis::LiveValues::const_iterator it = liveInForOrigBlock.begin(), end = liveInForOrigBlock.end();
         it != end; ++it) {
        Value* origValue = const_cast<Value*>(*it);
        if (isa<Argument>(origValue)) continue; // case 3

        Value* oldValue = VMap[origValue];
        Instruction* oldInst = cast<Instruction>(oldValue); // TODO what about constants?
        BasicBlock* oldBlock = oldInst->getParent();

        Value* newValue = updatesForVMap[origValue];
        BasicBlock* newBlock = entryPoint;

        updateSSA.Initialize(oldValue->getType(), StringRef(Twine(oldValue->getName(), "_join").str())); // TODO cleaner code for name
        updateSSA.AddAvailableValue(oldBlock, oldValue);
        updateSSA.AddAvailableValue(newBlock, newValue);

        for (Value::use_iterator UI = oldValue->use_begin(), UE = oldValue->use_end(); UI != UE; ) {
            // Grab the use before incrementing the iterator.
            Use &U = *UI;

            // Increment the iterator before removing the use from the list.
            ++UI;

            // SSAUpdater can't handle a non-PHI use in the same block as an
            // earlier def. We can easily handle those cases manually.
            Instruction *UserInst = cast<Instruction>(U.getUser());
            if (!isa<PHINode>(UserInst)) {
                BasicBlock *UserBB = UserInst->getParent();
                if (UserBB == oldBlock) {
                    U = oldValue; // TODO check!!!!!!!!!
                    continue;
                }
            }

            // Anything else can be handled by SSAUpdater.
            updateSSA.RewriteUse(U);
        }
        ++replacedUses;
    }
    assert(replacedUses == updatesForVMap.size());
}

Function* OSRLibrary::duplicateFunction(Function* F, const Twine &Name, ValueToValueMapTy &VMap) {
    Function* dup = CloneFunction(F, VMap, false, nullptr); // TODO moduleLevelChanges true?
    dup->setName(Name);
    return dup;
}

OSRLibrary::OSRCond OSRLibrary::regenerateOSRCond(OSRLibrary::OSRCond &cond, ValueToValueMapTy &VMap) {
    OSRCond newCond;

    // clone instructions
    for (Instruction* I: cond) { // CloneBasicBlock() from CloneFunction.cpp
        Instruction *NewInst = I->clone();
        VMap[I] = NewInst;
        newCond.push_back(NewInst);
    }

    // then remap them
    bool ModuleLevelChanges = false;
    for (Instruction* II: newCond) {
        RemapInstruction(II, VMap, ModuleLevelChanges ? RF_None : RF_NoModuleLevelChanges);
    }

    return newCond;
}

BasicBlock* OSRLibrary::generateTriggerOSRBlock(Function* OSRDest, std::vector<Value*> &valuesToPass) {
    StringRef OSRFunName = OSRDest->getName();
    Type* retTy = OSRDest->getReturnType();

    // generate basic block to trigger the OSR transition
    Twine OSRBlockName("OSRBlockTo", OSRFunName);
    BasicBlock* OSR_B = BasicBlock::Create(getGlobalContext(), OSRBlockName);

    // generate call instruction for the finalized OSR transition
    Twine OSRCallName("OSRCallTo", OSRFunName);
    CallInst* callInst = CallInst::Create(OSRDest, valuesToPass, OSRCallName);
    OSR_B->getInstList().push_back(callInst);

    // if OSRDest is non-void we should return the value it computes
    ReturnInst* retInst;
    if (retTy->isVoidTy()) {
        retInst = ReturnInst::Create(getGlobalContext());
    } else {
        retInst = ReturnInst::Create(getGlobalContext(), callInst);
    }
    OSR_B->getInstList().push_back(retInst);

    return OSR_B;
}

BasicBlock* OSRLibrary::insertOSRCond(Function* F, BasicBlock* B, BasicBlock* OSR_B, OSRLibrary::OSRCond& cond, const Twine& BBName) {
    // split the block after the first non-PHI insruction
    BasicBlock::iterator firstNonPHIInstr = B->getFirstNonPHI();
    BasicBlock* NB = B->splitBasicBlock(firstNonPHIInstr, BBName);

    /* Note from LLVM documentation: split() doesn't preserve any passes.
     * To split blocks while keeping loop information consistent, use the
     * SplitBlock utility function. */

    // remove the unconditional branch to NB inside B
    TerminatorInst* oldTerminator = B->getTerminator();
    oldTerminator->eraseFromParent();

    // add instructions from OSRCond to the new block
    for (Instruction* I: cond) {
        B->getInstList().push_back(I);
    }

    // insert a conditional branch on the value computed by the last inserted instruction
    BranchInst* br = BranchInst::Create(OSR_B, NB, cond.back());
    B->getInstList().push_back(br);

    return NB;
}
