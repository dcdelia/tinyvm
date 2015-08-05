#include "OSRLibrary.hpp"
#include "OldStateMap.hpp"
#include "StateMap.hpp"

#include "llvm/PassManager.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
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
 * - controllare che liveness analisis non includa valori di OSRCond
 * - Context
 * - verbose mode
 */

/**
 * Public methods
 */

static bool verifyAux(Function* F, raw_os_ostream* OS, bool* preventOptimize = nullptr) {
    bool ret = verifyFunction(*F, OS); // returns false if there are no errors
    if (ret) {
        F->dump();
        if (preventOptimize != nullptr) *preventOptimize = true;
    }
    return ret;
}

Function* OSRLibrary::generateOSRDestFun(Function &F1, Function &F2, OldStateMap::BBSrcDestPair &srcDestBlocks,
                                std::vector<Value*> &valuesToPass, OldStateMap &M, const Twine& F2NewName) {

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
    Function* OSRDestFun;
    Function* dest = &F2;
    BasicBlock* dest_block = srcDestBlocks.second;
    std::vector<Value*> &origValuesToSetAtDestBlock = M.getValuesToSetForDestFunction(srcDestBlocks);

    FunctionType* OSRDestFTy = generatePrototypeForOSRDest(&F1, valuesToPass); // (1)
    Twine OSRDestFunName = F2NewName.isTriviallyEmpty() ? Twine(dest->getName(), "DestOSR") : const_cast<Twine&>(F2NewName); // TODO index or f1@l1TOf2@l2

    OSRDestFun = Function::Create(OSRDestFTy, dest->getLinkage(), OSRDestFunName); // (2)
    Function::arg_iterator OSRDestArgIt = OSRDestFun->arg_begin();
    for (Value* src_v: valuesToPass) {
        (OSRDestArgIt++)->setName(Twine(src_v->getName(), "_osr")); // maybe from dest rather than src function???
    }
    assert(OSRDestArgIt == OSRDestFun->arg_end());

    copyBodyIntoNewFunction(dest, OSRDestFun, destToOSRDestVMap); // (3)

    applyAttributesToArguments(OSRDestFun, dest, valuesToPass); // (4)

    std::map<const Argument*, Value*> deadArgsMap = getMapForDeadArgs(dest, valuesToPass); // (5)

    BasicBlock* oldEntryPoint = &OSRDestFun->getEntryBlock();  // (6)
    BasicBlock* newEntryPoint = M.createEntryPointForOSRDestFunction(srcDestBlocks,
                OSRDestFun, destToOSRDestVMap, updatesForDestToOSRDestVMap, valuesToPass);

    updateDestToOSRDestVMapForArguments(dest, destToOSRDestVMap, deadArgsMap, updatesForDestToOSRDestVMap); // (7)
    updateOpMappingForClonedBody(OSRDestFun, dest, destToOSRDestVMap);

    newEntryPoint->insertInto(OSRDestFun, oldEntryPoint); // (8)
    assert(&OSRDestFun->getEntryBlock() == newEntryPoint);

    SmallVector<PHINode*, 8> insertedPHINodes; // (9)
    replaceUsesWithNewValuesAndUpdatePHINodes(OSRDestFun, dest_block, origValuesToSetAtDestBlock,
            destToOSRDestVMap, updatesForDestToOSRDestVMap, &insertedPHINodes);
    std::cerr << "Inserted PHI nodes: %lu" << insertedPHINodes.size() << std::endl;

    return OSRDestFun;

}

OSRLibrary::OSRPair OSRLibrary::insertFinalizedOSR(Function &F1, BasicBlock &B1, Function &F2,
                        BasicBlock &B2, OSRLibrary::OSRCond &cond, OldStateMap &M,
                        const Twine& F1NewName, const Twine& F2NewName) { // default value for the last two parameters is ""
    // common stuff for the generation of F1' and F2'
    Function *newSrcFun, *OSRDestFun;
    raw_os_ostream errStream(std::cerr);
    bool preventOptimize = false; // set by verifyAux in case of error
    OldStateMap::BBSrcDestPair srcDestBlocks = std::pair<BasicBlock*, BasicBlock*>(&B1, &B2);
    std::vector<Value*> &valuesToPass = M.getValuesToFetchFromSrcFunction(srcDestBlocks);
    assert(F1.getReturnType() == F2.getReturnType());

    // verifyFunction() segfaults if a Function is not in a Module
    Module *tmpMod = new Module("OSRtmpMod", getGlobalContext());

    /* Prepare F2' aka OSRDestFun */
    OSRDestFun = generateOSRDestFun(F1, F2, srcDestBlocks, valuesToPass, M, F2NewName);

    tmpMod->getFunctionList().push_back(OSRDestFun); // (10)
    verifyAux(OSRDestFun, &errStream, &preventOptimize);

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
    BasicBlock* srcBlock = cast<BasicBlock>(srcToNewSrcVMap[srcDestBlocks.first]); // TODO check this, srcDestBlocks.second was a bug?!?
    BasicBlock* splittedBlock = insertOSRCond (newSrcFun, srcBlock, OSR_B, newCond, splitBlockName);

    tmpMod->getFunctionList().push_back(newSrcFun); // (5)
    verifyAux(newSrcFun, &errStream, &preventOptimize);

    if (!preventOptimize) {
        legacy::FunctionPassManager *FPM = new legacy::FunctionPassManager(tmpMod);

        FPM->add(createCFGSimplificationPass()); // will remove the old entrypoint and fix PHI nodes

        FPM->run(*OSRDestFun);
        verifyAux(OSRDestFun, &errStream);

        FPM->run(*newSrcFun);
        verifyAux(newSrcFun, &errStream);
    }


    OSRDestFun->removeFromParent();
    newSrcFun->removeFromParent();

    // TODO delete tmpMod?

    return OSRPair(newSrcFun, OSRDestFun);
}

OSRLibrary::OSRPair OSRLibrary::insertOpenOSR(OSRLibrary::OpenOSRInfo& info, OSRLibrary::OSRCond& cond,
        Value* profDataVal, OSRLibrary::DestFunGenerator destFunGenerator, const Twine& F1NewName,
        std::vector<Value*>* valuesToTransfer) {

    LLVMContext& Context = getGlobalContext();
    PointerType* i8PointerTy = PointerType::get(IntegerType::get(Context, 8), 0);

    Module tmpMod("OSRtmpMod", Context);
    Function *stub, *newSrcFun;
    Function *src = info.f1;
    BasicBlock* srcBlock = info.b1;
    Type* retTy = src->getReturnType();
    std::string newFunName = F1NewName.isTriviallyEmpty() ? src->getName().str() + "WithOSR" : F1NewName.str();

    /* [Prepare F1'_stub aka stub] Workflow
     * (1) Generate prototype for stub
     * (2) Generate stub function and set argument names and attributes
     * (3) Get a rawOpenOSRInfo struct type from LLVM Context
     * (4) Create entry block for the new function and allocate a rawOpenOSRInfo object
     * (5) Create pointers to access fields in rawOpenOSRInfo and store values from info
     * (6) Create call to destFunGenerator
     * (7) Create a prototype for the generated function and make an indirect call
     * (8) Return the computed value
     */

    // step (1)
    std::vector<Value*>* valuesToPasstmp = valuesToTransfer;
    if (valuesToTransfer == nullptr) {
        LivenessAnalysis livenessAnalysisForSrcFunction = LivenessAnalysis(src);
        LivenessAnalysis::LiveValues& liveInAtSrcBlock = livenessAnalysisForSrcFunction.getLiveInValues(srcBlock);
        valuesToPasstmp = StateMap::getValuesToSetForBlock(*srcBlock, liveInAtSrcBlock);
    }
    std::vector<Value*> &valuesToPass = *valuesToPasstmp;

    std::vector<Type*> stubArgTypes;
    stubArgTypes.push_back(i8PointerTy); // profDataAddr is an i8*
    for (Value* v: valuesToPass) {
        stubArgTypes.push_back(v->getType());
    }
    FunctionType *stubFTy = FunctionType::get(retTy, stubArgTypes, false);

    // step (2)
    Twine stubName = Twine(newFunName, "_stub"); // TODO provide stubName as argument to insertOpenOSR
    stub = Function::Create(stubFTy, src->getLinkage(), stubName);

    Function::arg_iterator stubArgIt = stub->arg_begin();
    (stubArgIt++)->setName("profDataAddr");
    for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
        (stubArgIt++)->setName(Twine((*it)->getName(), "_osr"));
    }

    applyAttributesToArguments(stub, src, valuesToPass);

    // step (3)
    std::vector<Type*> rawOpenOSRInfoTypes;
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // f1
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // b1
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // f2_pp
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // b2_pp
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // m
    StructType* rawOSRInfoTy = StructType::get(Context, rawOpenOSRInfoTypes);

    // step (4)
    BasicBlock* stubEntryPoint = BasicBlock::Create(Context, "entry", stub);

    AllocaInst* infoAlloca = new AllocaInst(rawOSRInfoTy, "info");
    stubEntryPoint->getInstList().push_back(infoAlloca);

    // step (5)
    Value* Idxs[2];
    Idxs[0] = ConstantInt::get(Context, APInt(32, 0, 10));

    auto lambdaForGEPAndStore = [](LLVMContext& C, AllocaInst* A, BasicBlock* B, Value* (*v)[2], int index, StringRef name,
            void* field, Type* srcType, Type* destType) -> GetElementPtrInst* {
        (*v)[1] = ConstantInt::get(C, APInt(32, index, 10));
        GetElementPtrInst* GEP = GetElementPtrInst::Create(A, *v, name);
        B->getInstList().push_back(GEP);
        Value* V = ConstantExpr::getIntToPtr(ConstantInt::get(srcType, (uintptr_t)field), destType);
        new StoreInst(V, GEP, B);
        return GEP;
    };

    IntegerType* int64Ty = Type::getInt64Ty(Context);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 0, "f1_ptr", info.f1, int64Ty, i8PointerTy);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 1, "b1_ptr", info.b1, int64Ty, i8PointerTy);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 2, "f2_pp_ptr", info.f2_pp, int64Ty, i8PointerTy);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 3, "b2_pp_ptr", info.b2_pp, int64Ty, i8PointerTy);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 4, "m_pp_ptr", info.m_pp, int64Ty, i8PointerTy);

    // step (6)
    std::vector<Type*> argTypesForFunToGenerate;
    std::vector<Value*> argsForFunToGenerate;
    for (Function::arg_iterator it = ++(stub->arg_begin()), end = stub->arg_end(); it != end; ++it) {
        argsForFunToGenerate.push_back(it);
        argTypesForFunToGenerate.push_back(it->getType());
    }
    FunctionType* funToGenerateTy = FunctionType::get(retTy, argTypesForFunToGenerate, false);

    PointerType* pointerToFunToGenerateTy = PointerType::getUnqual(funToGenerateTy);
    PointerType* pointerToRawOSRInfoTy = PointerType::getUnqual(rawOSRInfoTy);

    Type* destFunGenArgTypes[2];
    destFunGenArgTypes[0] = pointerToRawOSRInfoTy;
    destFunGenArgTypes[1] = i8PointerTy;
    FunctionType* destFunGeneratorTy = FunctionType::get(pointerToFunToGenerateTy, destFunGenArgTypes, false);

    //LoadInst* loadInfo = new LoadInst(infoAlloca, "info_ptr", stubEntryPoint);
    Value* destFunGenArgs[2];
    destFunGenArgs[0] = infoAlloca;
    destFunGenArgs[1] = stub->arg_begin();
    std::cerr << "Arguments for the first call: " << destFunGenArgs[0]->getName().str() << " " << destFunGenArgs[1]->getName().str() << std::endl;
    Constant* destFunGenVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, (uintptr_t)destFunGenerator),
                                                        PointerType::getUnqual(destFunGeneratorTy)); // I need a pointer to function!
    CallInst* destFunGeneratorCall = CallInst::Create(destFunGenVal, destFunGenArgs, "destFunGenCall", stubEntryPoint); // direct call to absolute address

    // make an indirect call to the generated function
    CallInst* generatedFunCall = CallInst::Create(destFunGeneratorCall, argsForFunToGenerate, "generatedFunCall");
    stubEntryPoint->getInstList().push_back(generatedFunCall);

    // step (7)
    ReturnInst* retInst;
    if (retTy->isVoidTy()) {
        retInst = ReturnInst::Create(Context);
    } else {
        retInst = ReturnInst::Create(Context, generatedFunCall);
    }
    stubEntryPoint->getInstList().push_back(retInst);

    /* [Prepare F1' aka newSrc] Workflow
     * (1) Duplicate F1 into newSrc and regenerate OSRCond
     * (2) Generate newValuesToPass (including the address of profDataVal)
     * (3) Generate OSRBlock to invoke stub and return its result
     * (4) Insert code to compute OSR condition and jump to OSRBlock
     */

    ValueToValueMapTy srcToNewSrcVMap;

    // step (1)
    newSrcFun = duplicateFunction(src, newFunName, srcToNewSrcVMap);
    OSRCond newCond = regenerateOSRCond(cond, srcToNewSrcVMap);

    // step (2)
    std::vector<Value*> newValuesToPass;
    Value* newProfDataVal;
    if (profDataVal != nullptr) {
        Value* v = srcToNewSrcVMap[profDataVal];

        // TODO
        newProfDataVal = nullptr; // what if I have to insert new instructions in the code? should I do it inside the new OSR block?

        std::cerr << "Sorry, this has not been implemented yet!" << std::endl;
        exit(1);
    } else {
        //newProfDataVal = ConstantPointerNull::get(i8PointerTy);
        newProfDataVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, 0), i8PointerTy);
    }
    newValuesToPass.push_back(newProfDataVal);
    for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
        newValuesToPass.push_back(srcToNewSrcVMap[*it]);
    }

    // step (3)
    BasicBlock* OSR_B = generateTriggerOSRBlock(stub, newValuesToPass);
    OSR_B->insertInto(newSrcFun);

    // step (4)
    Twine splitBlockName("splitBlockForOSRTo", stub->getName());
    BasicBlock* newSrcBlock = cast<BasicBlock>(srcToNewSrcVMap[srcBlock]);
    BasicBlock* splittedBlock = insertOSRCond (newSrcFun, newSrcBlock, OSR_B, newCond, splitBlockName);


    /* Now we verify both generated functions */
    raw_os_ostream errStream(std::cerr);
    bool preventOptimize = false;

    tmpMod.getFunctionList().push_back(stub);
    verifyAux(stub, &errStream, &preventOptimize);

    tmpMod.getFunctionList().push_back(newSrcFun);
    verifyAux(newSrcFun, &errStream, &preventOptimize);

    stub->removeFromParent();
    newSrcFun->removeFromParent();

    if (valuesToTransfer == nullptr) {
        delete valuesToPasstmp;
    }

    return OSRPair(newSrcFun, stub);
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

void OSRLibrary::replaceUsesWithNewValuesAndUpdatePHINodes(Function* NF, BasicBlock* origDestBlock, std::vector<Value*> &origValuesToSetForDestBlock, ValueToValueMapTy &VMap, ValueToValueMapTy &updatesForVMap, SmallVectorImpl<PHINode*> *insertedPHINodes) {
    BasicBlock* entryPoint = &NF->getEntryBlock();
    BasicBlock* OSRdestBlock = cast<BasicBlock>(VMap[origDestBlock]);

    /* For each value to set at the target basic block, I have three cases:
     * 1) value is an argument
     * 2) value is a PHI node defined in the target block
     * 3) value is defined elsewhere (univocally or through a PHI node)
     *
     * The first case has already been handled in a previous step.
     *
     * The second case is handled by adding a PHI edge for the available
     * value coming from the OSR entrypoint.
     *
     * The third case can be handled using SSAUpdater to account for the
     * the new available value coming from the OSR entrypoint and to fix
     * the CFG to keep the SSA form consistent. */
    int updatedNodes = 0;
    int replacedUses = 0;

    SSAUpdater updateSSA(insertedPHINodes);

    for (std::vector<Value*>::const_iterator it = origValuesToSetForDestBlock.begin(), end = origValuesToSetForDestBlock.end();
         it != end; ++it) {
        Value* origValue = const_cast<Value*>(*it);
        if (isa<Argument>(origValue)) continue; // case 1

        std::cerr << "Processing value: " << origValue->getName().str() << std::endl;

        Value* oldValue = VMap[origValue];
        Instruction* oldInst = cast<Instruction>(oldValue); // TODO what about constants?
        BasicBlock* oldBlock = oldInst->getParent();

        Value* newValue = updatesForVMap[origValue];
        BasicBlock* newBlock = entryPoint;

        if (oldBlock == OSRdestBlock) { // case 2
            if (PHINode* node = dyn_cast<PHINode>(oldInst)) {
                std::cerr << "--> value is a PHI node defined in the target block" << std::endl;

                node->addIncoming(newValue, newBlock);

                ++updatedNodes;
                continue;
            }
        }

        std::cerr << "--> I will use SSAUpdater to fix the CFG where required!" << std::endl;
        updateSSA.Initialize(oldValue->getType(), StringRef(Twine(oldValue->getName(), "_join").str())); // TODO cleaner code for name
        updateSSA.AddAvailableValue(oldBlock, oldValue);
        updateSSA.AddAvailableValue(newBlock, newValue);

        for (Value::use_iterator UI = oldValue->use_begin(), UE = oldValue->use_end(); UI != UE; ) {
            // Grab the use before incrementing the iterator.
            Use &U = *UI;

            // Increment the iterator before removing the use from the list.
            ++UI;

            Instruction *UserInst = cast<Instruction>(U.getUser());

            // SSAUpdater can't handle a non-PHI use in the same block as an
            // earlier def: we can handle those cases manually (see code in
            // Transforms/Scalar/LoopRotation.cpp for an example). */
            if (!isa<PHINode>(UserInst)) {
                BasicBlock *UserBB = UserInst->getParent();
                // use in the same block as the definition of oldValue
                if (UserBB == oldBlock) {
                    std::cerr << "----> manually handling a use in the same block of the original value" << std::endl;
                    U = oldValue;
                    //updateSSA.RewriteUseAfterInsertions(U); // wrong!
                    continue;
                }

                /** TODO: check this code again :) **/
            }

            // Anything else can be handled by SSAUpdater.
            std::cerr << "----> use being rewritten using SSAUpdater::RewriteUse()" << std::endl;
            updateSSA.RewriteUse(U);
        }
        ++replacedUses;
    }
    assert(replacedUses + updatedNodes == updatesForVMap.size());
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