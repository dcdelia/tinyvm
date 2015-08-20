/* ===============================================================
 * Main core of the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "OSRLibrary.hpp"
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
 * - use better aliases for types
 * - use const references more
 * - fix names in OSRDestFun
 * - live values vs OSRCond
 * - Context parameter
 * - verbose mode
 * - what would happen to a reassigned Argument??
 * - general attributes of the Function? (http://llvm.org/docs/HowToUseAttributes.html)
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

Function* OSRLibrary::generateOSRDestFun(Function &F1, Function &F2, StateMap::BlockPair &srcDestBlocks,
                                std::vector<Value*> &valuesToPass, StateMap &M, const Twine& F2NewName) {

    /* [Prepare F2' aka OSRDest] Workflow:
     * (1)  Generate prototype for OSRDest function
     * (2)  Generate OSRDest function and set argument names
     * (3)  Duplicate the body of F2 inside OSRDest
     * (4)  Apply attributes to fetched Argument values
     * (5)  Ask the StateMap to generate the new entrypoint and retrieve mapping for [reconstructed] live values
     * (6)  Replace dead arguments with a default null value and match live arguments
     * (7)  Fix operand references using destToOSRDestVMap
     * (8)  Insert new entrypoint
     * (9)  Replace each updated Use in updatesForDestToOSRDestVMap and insert PHI nodes where needed
     */
    ValueToValueMapTy fetchedValuesToOSRDestArgs;
    ValueToValueMapTy destToOSRDestVMap;
    Function* OSRDestFun;
    Function* dest = &F2;
    BasicBlock* dest_block = srcDestBlocks.second;

    std::vector<Value*> &origValuesToSetAtDestBlock = M.getValuesToSetForDestFunction(srcDestBlocks);

    // step (1): generate prototype for OSRDest function
    std::vector<Type*> ArgTypes;
    for (Value* v: valuesToPass) {
        ArgTypes.push_back(v->getType());
    }
    FunctionType *OSRDestFTy = FunctionType::get(dest->getReturnType(), ArgTypes, false);

    // step (2): generate OSRDest function and set argument names
    Twine OSRDestFunName = F2NewName.isTriviallyEmpty() ?
                            Twine(dest->getName(), "DestOSR") : const_cast<Twine&>(F2NewName); // TODO index or f1@l1TOf2@l2
    OSRDestFun = Function::Create(OSRDestFTy, dest->getLinkage(), OSRDestFunName); // (2)
    Function::arg_iterator OSRDestArgIt = OSRDestFun->arg_begin();
    for (Value* src_v: valuesToPass) {
        fetchedValuesToOSRDestArgs[src_v] = OSRDestArgIt;
        if (src_v->hasName()) {
            (OSRDestArgIt++)->setName(Twine(src_v->getName(), "_osr"));
        } else {
            ++OSRDestArgIt;
        }
    }
    assert(OSRDestArgIt == OSRDestFun->arg_end());

    // step (3): duplicate the body of F2 inside OSRDest
    duplicateBodyIntoNewFunction(dest, OSRDestFun, destToOSRDestVMap);

    // step (4): apply attributes to fetched Argument values
    applyAttributesToArguments(OSRDestFun, dest, valuesToPass);

    // step (5): ask the StateMap to generate the new entrypoint and retrieve
    //           mapping for [reconstructed] live values
    BasicBlock* oldEntryPoint = &OSRDestFun->getEntryBlock();
    BasicBlock* newDestBlock = cast<BasicBlock>(destToOSRDestVMap[dest_block]);

    std::vector<Value*>& valuesToSetAtDest = M.getValuesToSetForDestFunction(srcDestBlocks);
    std::pair<BasicBlock*, ValueToValueMapTy*> entryPointPair = M.createEntryPointForNewDestFunction(srcDestBlocks,
            newDestBlock, valuesToSetAtDest, fetchedValuesToOSRDestArgs, getGlobalContext());

    BasicBlock* newEntryPoint = entryPointPair.first;
    ValueToValueMapTy *updatesForDestToOSRDestVMap = entryPointPair.second;

    // step (6): replace dead arguments with a default null value and match live arguments
    size_t dead_args = 0, live_args = 0;
    for (const Argument &destArg: dest->args()) {
        ValueToValueMapTy::iterator it = updatesForDestToOSRDestVMap->find(&destArg);
        if (it == updatesForDestToOSRDestVMap->end()) { // argument is dead
            Value* v = UndefValue::get(destArg.getType());
            destToOSRDestVMap.insert(std::pair<const Argument*, Value*>(&destArg, v));
            dead_args++;
        } else { // argument is live
            destToOSRDestVMap.insert(std::pair<const Argument*, Value*>(&destArg, it->second));
            // updateOpMappingForClonedBody() will update each Use of this argument
            updatesForDestToOSRDestVMap->erase(it);
            live_args++;
        }
    }
    assert(dead_args + live_args == dest->getArgumentList().size());

    // step (7): fix operand references using destToOSRDestVMap
    fixOperandReferencesFromVMap(OSRDestFun, dest, destToOSRDestVMap);

    // step (8): insert new entrypoint
    newEntryPoint->insertInto(OSRDestFun, oldEntryPoint);
    assert(&OSRDestFun->getEntryBlock() == newEntryPoint);

    // step (9): replace each updated Use in updatesForDestToOSRDestVMap and insert PHI nodes where needed
    SmallVector<PHINode*, 8> insertedPHINodes;
    replaceUsesWithNewValuesAndUpdatePHINodes(OSRDestFun, dest_block, origValuesToSetAtDestBlock,
            destToOSRDestVMap, *updatesForDestToOSRDestVMap, &insertedPHINodes);
    std::cerr << "Inserted PHI nodes: %lu" << insertedPHINodes.size() << std::endl;

    delete updatesForDestToOSRDestVMap;

    return OSRDestFun;

}

OSRLibrary::OSRPair OSRLibrary::insertFinalizedOSR(Function &F1, BasicBlock &B1, Function &F2,
                        BasicBlock &B2, OSRLibrary::OSRCond &cond, StateMap &M, bool updateF1,
                        const Twine& F1NewName, const Twine& F2NewName) { // default value for the last two parameters is ""
    // common stuff for the generation of F1' and F2'
    raw_os_ostream errStream(std::cerr);
    bool preventOptimize = false; // set by verifyAux in case of error
    StateMap::BlockPair srcDestBlocks = std::pair<BasicBlock*, BasicBlock*>(&B1, &B2);
    std::vector<Value*> valuesToPass = M.getValuesToFetchFromSrcFunction(srcDestBlocks);
    assert(F1.getReturnType() == F2.getReturnType());

    // verifyFunction() needs a Module
    Module tmpMod("OSRtmpMod", getGlobalContext());

    /* Prepare F2' aka OSRDestFun */
    Function* OSRDestFun = generateOSRDestFun(F1, F2, srcDestBlocks, valuesToPass, M, F2NewName);

    /* Check generated OSRDestFun for well-formedness */
    tmpMod.getFunctionList().push_back(OSRDestFun);
    verifyAux(OSRDestFun, &errStream, &preventOptimize);

    /* [Prepare F1' aka newSrc] Workflow:
     * (1) Duplicate F1 into newSrc
     * (2) Regenerate OSRCond using information from VMap (updates the map too!)
     * (3) Generate OSRBlock to invoke OSRDestFun and return its result
     * (4) Insert code to compute OSR condition and jump to OSRBlock
     * (5) Check generated function for well-formedness
     *
     * Steps (1) and (2) are not performed when updateF1 == true
     */
    Function*   src = &F1;

    Function*   newSrcFun;
    std::vector<Value*>* ptrToValuesToPass;
    OSRCond*    ptrToOSRCond;
    BasicBlock* ptrToSrcBlock;
    Module*     parentForSrc;

    // TODO rewrite this part
    std::vector<Value*> newValuesToPass;
    OSRCond newCond;
    ValueToValueMapTy srcToNewSrcVMap;

    if (!updateF1) {
        Twine newSrcFunName = F1NewName.isTriviallyEmpty() ?
                                Twine(src->getName(), "WithOSR") : const_cast<Twine&>(F1NewName); // (1) TODO use better names
        newSrcFun = duplicateFunction(src, newSrcFunName, srcToNewSrcVMap);
         // I have to regenerate valuesToPass as well!
        for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
            newValuesToPass.push_back(srcToNewSrcVMap[*it]);
        }

        newCond = regenerateOSRCond(cond, srcToNewSrcVMap); // (2)

        ptrToValuesToPass = &newValuesToPass;
        ptrToOSRCond = &newCond;
        ptrToSrcBlock = cast<BasicBlock>(srcToNewSrcVMap[srcDestBlocks.first]);
        parentForSrc = nullptr;
    } else {
        newSrcFun = src;
        ptrToValuesToPass = &valuesToPass;
        ptrToOSRCond = &cond;
        ptrToSrcBlock = srcDestBlocks.first;
        parentForSrc = src->getParent();
    }

    BasicBlock* OSR_B = generateTriggerOSRBlock(OSRDestFun, *ptrToValuesToPass); // (3)
    OSR_B->insertInto(newSrcFun);

    Twine splitBlockName("splitBlockForOSRTo", OSRDestFun->getName()); // (4)

    BasicBlock* splittedBlock = insertOSRCond (newSrcFun, ptrToSrcBlock, OSR_B, *ptrToOSRCond, splitBlockName);

    if (parentForSrc == nullptr) { // (!updateF1) term in || is redundant
        tmpMod.getFunctionList().push_back(newSrcFun); // (5)
        verifyAux(newSrcFun, &errStream, &preventOptimize);
    } else {
        verifyAux(src, &errStream, &preventOptimize);
        FunctionPassManager FPM(parentForSrc);
        FPM.add(createCFGSimplificationPass());
        FPM.doInitialization();
        FPM.run(*src);
    }

    FunctionPassManager FPM(&tmpMod);
    FPM.add(createCFGSimplificationPass());
    FPM.doInitialization();
    FPM.run(*OSRDestFun); // will remove the old entrypoint and fix PHI nodes

    if (parentForSrc == nullptr) { // (!updateF1) term in || is redundant
        FPM.run(*newSrcFun);
        newSrcFun->removeFromParent();
    }

    OSRDestFun->removeFromParent();

    return OSRPair(newSrcFun, OSRDestFun);
}

OSRLibrary::OSRPair OSRLibrary::insertOpenOSR(OSRLibrary::OpenOSRInfo& info, OSRLibrary::OSRCond& cond,
        Value* profDataVal, OSRLibrary::DestFunGenerator destFunGenerator, bool updateF1,
        const Twine& F1NewName, std::vector<Value*>* valuesToTransfer) {

    LLVMContext& Context = getGlobalContext();
    PointerType* i8PointerTy = PointerType::get(IntegerType::get(Context, 8), 0);

    Module tmpMod("OSRtmpMod", Context);
    Function *stub;
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
        if ((*it)->hasName()) {
            (stubArgIt++)->setName(Twine((*it)->getName(), "_osr"));
        } else {
            ++stubArgIt;
        }
    }

    applyAttributesToArguments(stub, src, valuesToPass);

    // step (3)
    std::vector<Type*> rawOpenOSRInfoTypes;
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // f1
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // b1
    rawOpenOSRInfoTypes.push_back(i8PointerTy); // extra
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

    IntegerType* int64Ty = Type::getInt64Ty(Context); // TODO macro for x86
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 0, "f1_ptr", info.f1, int64Ty, i8PointerTy);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 1, "b1_ptr", info.b1, int64Ty, i8PointerTy);
    lambdaForGEPAndStore(Context, infoAlloca, stubEntryPoint, &Idxs, 2, "extra_ptr", info.extra, int64Ty, i8PointerTy);


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

    Value* destFunGenArgs[2];
    destFunGenArgs[0] = infoAlloca;
    destFunGenArgs[1] = stub->arg_begin();
    //std::cerr << "Arguments for the first call: " << destFunGenArgs[0]->getName().str() << " " << destFunGenArgs[1]->getName().str() << std::endl;
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
     *
     * Step (1) is not performed when updateF1 == true
     */

    std::vector<Value*> newValuesToPass;
    ValueToValueMapTy srcToNewSrcVMap; // used only when updateF1 = false

    Function* newSrcFun;
    OSRCond* ptrToOSRCond;
    BasicBlock* ptrToSrcBlock;
    Module* parentForSrc;

    // TODO rewrite this part
    OSRCond newCond;

    if (!updateF1) {
        // step (1)
        newSrcFun = duplicateFunction(src, newFunName, srcToNewSrcVMap);
        newCond = regenerateOSRCond(cond, srcToNewSrcVMap);

        ptrToOSRCond = &newCond;
        ptrToSrcBlock = cast<BasicBlock>(srcToNewSrcVMap[srcBlock]);
        parentForSrc = nullptr;
    } else {
        newSrcFun = src;
        ptrToOSRCond = &cond;
        ptrToSrcBlock = srcBlock;
        parentForSrc = src->getParent();
    }

    // step (2)
    Value* newProfDataVal;
    if (profDataVal != nullptr) {
        Value* v = (!updateF1) ? cast<Value>(srcToNewSrcVMap[profDataVal]) : profDataVal; // TODO check cast

        // TODO
        newProfDataVal = nullptr; // what if I have to insert new instructions in the code? should I do it inside the new OSR block?

        std::cerr << "Sorry, this has not been implemented yet!" << std::endl;
        exit(1);
    } else {
        newProfDataVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, 0), i8PointerTy); // we pass 0 as NULL value
    }
    newValuesToPass.push_back(newProfDataVal);
    for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
        if (!updateF1) {
            newValuesToPass.push_back(srcToNewSrcVMap[*it]);
        } else {
            newValuesToPass.push_back(*it);
        }
    }

    // step (3)
    BasicBlock* OSR_B = generateTriggerOSRBlock(stub, newValuesToPass);
    OSR_B->insertInto(newSrcFun);

    // step (4)
    Twine splitBlockName("splitBlockForOSRTo", stub->getName());
    BasicBlock* splittedBlock = insertOSRCond (newSrcFun, ptrToSrcBlock, OSR_B, *ptrToOSRCond, splitBlockName);

    /* Now we verify both generated functions */
    raw_os_ostream errStream(std::cerr);
    bool preventOptimize = false;

    tmpMod.getFunctionList().push_back(stub);
    verifyAux(stub, &errStream, &preventOptimize);

    if (parentForSrc == nullptr) {
        tmpMod.getFunctionList().push_back(newSrcFun);
        verifyAux(newSrcFun, &errStream, &preventOptimize);

        FunctionPassManager FPM(&tmpMod);
        FPM.add(createCFGSimplificationPass());
        FPM.doInitialization();
        FPM.run(*newSrcFun);

        newSrcFun->removeFromParent();
    } else {
        verifyAux(src, &errStream, &preventOptimize);

        FunctionPassManager FPM(parentForSrc);
        FPM.add(createCFGSimplificationPass());
        FPM.doInitialization();
        FPM.run(*src);
    }

    stub->removeFromParent();

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
void OSRLibrary::applyAttributesToArguments(Function* NF, Function* F, std::vector<Value*> &valuesToPass) {
    AttributeSet srcFunAttrs = F->getAttributes();
    int index = 0;
    for (Argument &arg: NF->args()) {
        Value* src_v = valuesToPass[index];
        if (Argument* src_arg = dyn_cast<Argument>(src_v)) {
            AttributeSet attrs = srcFunAttrs.getParamAttributes(src_arg->getArgNo() + 1); // 0 is for the function
            if (attrs.getNumSlots() > 0) {
                arg.addAttr(attrs);
            }
        }
        ++index;
    }
}

void OSRLibrary::duplicateBodyIntoNewFunction(Function* F, Function *NF, ValueToValueMapTy& VMap) {
    // TODO manually clone debug info metadata (LLVM's method is not visible!)

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
     * you still have to fix all the uses of values through a VMap! */
}

void OSRLibrary::fixOperandReferencesFromVMap(Function* NF, Function* F, ValueToValueMapTy &VMap) {
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
    size_t updatedNodes = 0;
    size_t replacedUses = 0;

    SSAUpdater updateSSA(insertedPHINodes);

    for (std::vector<Value*>::const_iterator it = origValuesToSetForDestBlock.begin(), end = origValuesToSetForDestBlock.end();
         it != end; ++it) {
        Value* origValue = const_cast<Value*>(*it);
        if (isa<Argument>(origValue)) continue; // case 1

        if (origValue->hasName()) {
            std::cerr << "Processing value: " << origValue->getName().str() << std::endl;
        } else {
            std::cerr << "Processing anonymous value: " << std::endl;
        }

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
        if (oldValue->hasName()) {
            updateSSA.Initialize(oldValue->getType(), StringRef(Twine(oldValue->getName(), "_fixSSA").str()));
        } else {
            updateSSA.Initialize(oldValue->getType(), StringRef("anonymousVal_fixSSA"));
        }
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

/*
 * OSR library for LLVM. Copyright (C) 2015 Daniele Cono D'Elia
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 3 of the License, or (at your option) any
 * later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
*/