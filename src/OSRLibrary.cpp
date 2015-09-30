/* ===============================================================
 * Main core of the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Liveness.hpp"
#include "OSRLibrary.hpp"
#include "StateMap.hpp"

#include <llvm/PassManager.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/MDBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_os_ostream.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Utils/Cloning.h>
#include <llvm/Transforms/Utils/SSAUpdater.h>
#include <llvm/Transforms/Utils/ValueMapper.h>

#include <iostream>
#include <vector>

#ifdef PROFILE_TIME
#include "timer.h"
tinyvm_timer_t   my_timer;
#endif

using namespace llvm;

/**
 * Global TODO list
 * - use better aliases for types?
 * - use const references more?
 * - fix names in OSRDestFun
 * - what would happen to a reassigned Argument??
 * - helper method to generate prototypes of called functions and update references when a new Module is used
 * - general attributes of the Function? (http://llvm.org/docs/HowToUseAttributes.html)
 */

/**
 * Helper methods
 */
static inline void verifyAux(Function* F) {
    if (llvm::verifyFunction(*F, &llvm::outs())) {
        F->dump();
        llvm::report_fatal_error("ill-formed function!");
    }
}

/**
 * Public methods
 */
Function* OSRLibrary::genContinuationFunc(LLVMContext &Context, Function &F1, Function &F2,
        BasicBlock& OSRSrc, BasicBlock& LPad, std::vector<Value*> &valuesToPass, StateMap &M,
        const std::string* F2NewName, bool verbose, StateMap** ptrForF2NewToF2Map) {

    #ifdef PROFILE_TIME
    timer_start(&my_timer);
    #endif

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
    BasicBlock* dest_block = &LPad;
    StateMap::BlockPair srcDestBlocks = std::pair<BasicBlock*, BasicBlock*>(&OSRSrc, &LPad);

    std::vector<Value*> &origValuesToSetAtDestBlock = M.getValuesToSetForDestFunction(srcDestBlocks);

    // step (1): generate prototype for OSRDest function
    std::vector<Type*> ArgTypes;
    for (Value* v: valuesToPass) {
        ArgTypes.push_back(v->getType());
    }
    FunctionType *OSRDestFTy = FunctionType::get(dest->getReturnType(), ArgTypes, false);

    // step (2): generate OSRDest function and set argument names
    if (F2NewName == nullptr) {
        OSRDestFun = Function::Create(OSRDestFTy, dest->getLinkage(), Twine("OSRDest", dest->getName()));
    } else {
        OSRDestFun = Function::Create(OSRDestFTy, dest->getLinkage(), Twine(*F2NewName));
    }
    Function::arg_iterator OSRDestArgIt = OSRDestFun->arg_begin();
    for (Value* src_v: valuesToPass) {
        fetchedValuesToOSRDestArgs[src_v] = OSRDestArgIt;
        if (src_v->hasName()) {
            (OSRDestArgIt++)->setName(Twine(src_v->getName(), "_osr"));
        } else {
            (OSRDestArgIt++)->setName(Twine("temp"));
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
            newDestBlock, valuesToSetAtDest, fetchedValuesToOSRDestArgs, Context);

    BasicBlock* newEntryPoint = entryPointPair.first;
    ValueToValueMapTy *updatesForDestToOSRDestVMap = entryPointPair.second;

    // step (6): replace dead arguments with a default null value and match live arguments
    size_t dead_args = 0, live_args = 0;
    for (const Argument &destArg: dest->args()) {
        ValueToValueMapTy::iterator it = updatesForDestToOSRDestVMap->find(&destArg);
        if (it == updatesForDestToOSRDestVMap->end()) { // argument is dead
            Value* v = UndefValue::get(destArg.getType());
            if (verbose) {
                if (destArg.hasName()) {
                    std::cerr << "Argument " << destArg.getName().str() <<
                        " has become dead: I will replace any reference to it with undef" << std::endl;
                } else {
                    std::cerr << "Anonymous argument has become dead: I will replace any "
                        << "reference to it with undef" << std::endl;
                }
            }
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

    // compute (part of) unidirectional state mapping from OSRDestFun to dest
    if (ptrForF2NewToF2Map != nullptr) {
        *ptrForF2NewToF2Map = new StateMap(OSRDestFun, dest);
        for (ValueToValueMapTy::iterator it = destToOSRDestVMap.begin(),
                end = destToOSRDestVMap.end(); it != end; ++it) {
            Value* OSRDest_v = it->second;
            Value* dest_v = const_cast<Value*>(it->first);
            if (BasicBlock* OSRDest_Block = cast<BasicBlock>(OSRDest_v)) {
                (*ptrForF2NewToF2Map)->registerCorrespondingBlock(OSRDest_Block, cast<BasicBlock>(dest_v), false);
            } else {
                (*ptrForF2NewToF2Map)->registerOneToOneValue(OSRDest_v, dest_v, false);
            }
        }
    }

    // step (9): replace each updated Use in updatesForDestToOSRDestVMap and insert PHI nodes where needed
    SmallVector<PHINode*, 8> insertedPHINodes;
    replaceUsesWithNewValuesAndUpdatePHINodes(OSRDestFun, dest_block, origValuesToSetAtDestBlock,
            destToOSRDestVMap, *updatesForDestToOSRDestVMap, &insertedPHINodes, verbose, ptrForF2NewToF2Map);
    if (verbose) {
        std::cerr << "Inserted PHI nodes: %lu" << insertedPHINodes.size() << std::endl;
    }

    delete updatesForDestToOSRDestVMap;

    #ifdef PROFILE_TIME
    timer_end(&my_timer);
    double elapsed = timer_get_elapsed(&my_timer);
    fprintf(stderr, "Time spent in creating continuation function: %.9f seconds\n", elapsed);
    #endif

    return OSRDestFun;

}

OSRLibrary::OSRPair OSRLibrary::insertResolvedOSR(LLVMContext &Context, Function &F1, BasicBlock &OSRSrc, Function &F2,
                        BasicBlock &LPad, OSRLibrary::OSRCond &cond, StateMap &M, OSRLibrary::OSRPointConfig &config) {
    // common stuff for the generation of F1' and F2'
    std::vector<Value*> valuesToPass;

    Instruction* OSRSrcInstr = OSRSrc.getFirstNonPHI();
    LivenessAnalysis &LA = M.getLivenessResults().first;
    LivenessAnalysis::LiveValues liveInAtOSRSrc = getLiveValsAtInstr(OSRSrcInstr, LA);

    //std::vector<Value*> valuesToPass = M.getValuesToFetchFromSrcFunction(srcDestBlocks);
    for (const Value* v: liveInAtOSRSrc) {
        valuesToPass.push_back(const_cast<Value*>(v));
    }

    if (config.verbose) {
        printLiveVarInfoForDebug(LA.getLiveInValues(&OSRSrc), LA.getLiveOutValues(&OSRSrc), valuesToPass);
    }

    assert(F1.getReturnType() == F2.getReturnType());

    /* Prepare F2' aka OSRDestFun */
    Function* OSRDestFun = genContinuationFunc(Context, F1, F2, OSRSrc, LPad, valuesToPass,
                                M, config.nameForNewF2, config.verbose, config.ptrForF2NewToF2Map);

    #ifdef PROFILE_TIME
    timer_start(&my_timer);
    #endif

    Function* OSRDestFunProt;
    if (config.modForNewF2 != config.modForNewF1) {
        if (config.modForNewF1 == nullptr) {
            llvm::report_fatal_error("Cannot generate F2' and F1' for different modules if no module is provided for F1'");
        }
        if (config.verbose) {
            std::cerr << "Generating prototype for calling F2' from F1' as they might be in different modules" << std::endl;
        }
        OSRDestFunProt = llvm::Function::Create(OSRDestFun->getFunctionType(),
                                                llvm::Function::ExternalLinkage,
                                                OSRDestFun->getName().str(),
                                                config.modForNewF1);
    } else {
        OSRDestFunProt = OSRDestFun;
    }

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
    Module*     parentForSrc = src->getParent();

    Function*   newSrcFun;

    OSRCond*    ptrToOSRCond;
    BasicBlock* ptrToSrcBlock;

    // TODO rewrite this part
    OSRCond newCond;
    ValueToValueMapTy srcToNewSrcVMap;

    if (!config.updateF1) {
        if (config.nameForNewF1 == nullptr) {
            newSrcFun = duplicateFunction(src, Twine(src->getName(), "WithOSR"), srcToNewSrcVMap); // (1)
        } else {
            newSrcFun = duplicateFunction(src, Twine(*config.nameForNewF1), srcToNewSrcVMap); // (1)
        }

        // generate state mapping between src and newSrcFun
        if (config.ptrForF1NewToF1Map != nullptr) {
            *(config.ptrForF1NewToF1Map) = new StateMap(newSrcFun, src, srcToNewSrcVMap, true); // bidirectional mapping
        }

        // I have to regenerate valuesToPass as well!
        for (int i = 0, n = valuesToPass.size(); i < n; ++i) {
            valuesToPass[i] = srcToNewSrcVMap[valuesToPass[i]];
        }

        newCond = regenerateOSRCond(cond, srcToNewSrcVMap); // (2)

        ptrToOSRCond = &newCond;
        ptrToSrcBlock = cast<BasicBlock>(srcToNewSrcVMap[&OSRSrc]);
    } else {
        newSrcFun = src;
        ptrToOSRCond = &cond;
        ptrToSrcBlock = &OSRSrc;
    }

    BasicBlock* OSR_B = generateTriggerOSRBlock(Context, OSRDestFunProt, valuesToPass); // (3)
    OSR_B->insertInto(newSrcFun);

    insertOSRCond(Context, newSrcFun, ptrToSrcBlock, OSR_B, *ptrToOSRCond,
            Twine("splitBlockForOSRTo", OSRDestFunProt->getName()),
            config.branchTakenProb); /* BasicBlock* splittedBlock = ... */

    #ifdef PROFILE_TIME
    timer_end(&my_timer);
    double elapsed = timer_get_elapsed(&my_timer);
    fprintf(stderr, "Time spent in OSR point insertion: %.9f seconds\n", elapsed);
    #endif

    /* Code verification and insertion into modules */

    #ifdef PROFILE_TIME
    timer_start(&my_timer);
    #endif

    // verify OSRDestFun and add it to the proper module
    if (config.modForNewF2 == nullptr) {
        if (config.verbose) {
            std::cerr << "WARNING: No LLVM Module supplied for F2'!" << std::endl;
        }
        Module tmpMod("OSRtmpMod", Context);
        tmpMod.getFunctionList().push_back(OSRDestFun);
        verifyAux(OSRDestFun);
        OSRDestFun->removeFromParent();
    } else {
        if (config.verbose) {
            std::cerr << "WARNING: replacement of references to functions and "
                    << "globals for F2' has not been implemented yet!" << std::endl;
        }
        config.modForNewF1->getFunctionList().push_back(OSRDestFun);
        verifyAux(OSRDestFun);
    }

    // verify newSrcFun and add it to the proper module
    if (config.updateF1) {
        if (parentForSrc == nullptr) {
            if (config.verbose) {
                std::cerr << "WARNING: supplied F1 does not belong to any LLVM Module!" << std::endl;
            }
            Module tmpMod("OSRtmpMod", Context);
            tmpMod.getFunctionList().push_back(src);
            verifyAux(src);
            src->removeFromParent();
        } else {
            verifyAux(src);
        }
    } else {
        if (config.modForNewF1 == nullptr) {
            if (config.verbose) {
                std::cerr << "WARNING: no LLVM Module supplied for F1'!" << std::endl;
            }
            Module tmpMod("OSRtmpMod", Context);
            tmpMod.getFunctionList().push_back(newSrcFun);
            verifyAux(newSrcFun);
            newSrcFun->removeFromParent();
        } else {
            if (config.verbose) {
                std::cerr << "WARNING: replacement of references to functions and "
                        << "globals for F1' has not been implemented yet!" << std::endl;
            }
            config.modForNewF1->getFunctionList().push_back(newSrcFun);
            verifyAux(newSrcFun);
        }
    }

    #ifdef PROFILE_TIME
    timer_end(&my_timer);
    elapsed = timer_get_elapsed(&my_timer);
    fprintf(stderr, "Time spent in IR verification: %.9f seconds\n", elapsed);
    #endif

    return OSRPair(newSrcFun, OSRDestFun);
}

OSRLibrary::OSRPair OSRLibrary::insertOpenOSR(LLVMContext& Context, Function &F,
        BasicBlock &OSRSrc, void* extraInfo, OSRLibrary::OSRCond& cond,
        Value* profDataVal, OSRLibrary::DestFunGenerator destFunGenerator,
        std::vector<Value*> *valuesToTransfer, LivenessAnalysis *LA,
        OSRLibrary::OSRPointConfig &config) {

    PointerType* i8PointerTy = PointerType::get(IntegerType::get(Context, 8), 0);

    Function *stub;
    Function *src = &F;
    BasicBlock* srcBlock = &OSRSrc;
    Type* retTy = src->getReturnType();
    std::string newFunName = (config.updateF1) ?
                                src->getName().str() :
                                (config.nameForNewF1 == nullptr) ?
                                    src->getName().str() + "WithOSR" :
                                    *config.nameForNewF1;



    /* [Prepare F1'_stub aka stub] Workflow
     * (1) Generate prototype for stub
     * (2) Generate stub function and set argument names and attributes
     * (3) Create call to destFunGenerator
     * (4) Create an indirect call to the generated function
     * (5) Return the computed value
     */
    #ifdef PROFILE_TIME
    timer_start(&my_timer);
    #endif

    // step (1)
    std::vector<Value*>* valuesToPassTmp = valuesToTransfer;
    if (valuesToTransfer == nullptr) {
        valuesToPassTmp = getLiveValsVecAtInstr(srcBlock->getFirstNonPHI(), *LA);
        if (config.verbose) {
            printLiveVarInfoForDebug(LA->getLiveInValues(srcBlock), LA->getLiveOutValues(srcBlock), *valuesToPassTmp);
        }
    }
    std::vector<Value*> &valuesToPass = *valuesToPassTmp;

    std::vector<Type*> stubArgTypes;
    stubArgTypes.push_back(i8PointerTy); // profDataAddr is an i8*
    for (Value* v: valuesToPass) {
        stubArgTypes.push_back(v->getType());
    }
    FunctionType *stubFTy = FunctionType::get(retTy, stubArgTypes, false);

    // step (2)

    // TODO: check why allocating a local Twine variable leads to a segfault in McVM
    if (config.nameForNewF2 == nullptr) {
        stub = Function::Create(stubFTy, src->getLinkage(), Twine(newFunName, "_stub")); // TODO provide name as argument
    } else {
        stub = Function::Create(stubFTy, src->getLinkage(), Twine(*config.nameForNewF2));
    }

    Function::arg_iterator stubArgIt = stub->arg_begin();
    (stubArgIt++)->setName("profDataAddr");
    for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
        if ((*it)->hasName()) {
            (stubArgIt++)->setName(Twine((*it)->getName(), "_osr"));
        } else {
            ++stubArgIt;
        }
    }

    applyAttributesToArguments(stub, src, valuesToPass, true); // skip first argument!

    BasicBlock* stubEntryPoint = BasicBlock::Create(Context, "entry", stub);

    // step (3)
    std::vector<Type*> argTypesForFunToGenerate;
    std::vector<Value*> argsForFunToGenerate;
    for (Function::arg_iterator it = ++(stub->arg_begin()), end = stub->arg_end(); it != end; ++it) {
        argsForFunToGenerate.push_back(it);
        argTypesForFunToGenerate.push_back(it->getType());
    }
    FunctionType* funToGenerateTy = FunctionType::get(retTy, argTypesForFunToGenerate, false);

    PointerType* pointerToFunToGenerateTy = PointerType::getUnqual(funToGenerateTy);

    Type* destFunGenArgTypes[4];
    destFunGenArgTypes[0] = i8PointerTy;
    destFunGenArgTypes[1] = i8PointerTy;
    destFunGenArgTypes[2] = i8PointerTy;
    destFunGenArgTypes[3] = i8PointerTy;
    FunctionType* destFunGeneratorTy = FunctionType::get(pointerToFunToGenerateTy, destFunGenArgTypes, false);

    // generate inttoptr instructions for hard-wired parameters passed to the generator
    IntegerType* int64Ty = Type::getInt64Ty(Context);
    Constant* f1PtrVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, (uintptr_t)src), i8PointerTy);
    Constant* OSRSrcPtrVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, (uintptr_t)srcBlock), i8PointerTy);
    Constant* extraPtrVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, (uintptr_t)extraInfo), i8PointerTy);
    Constant* destFunGenVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, (uintptr_t)destFunGenerator),
                                PointerType::getUnqual(destFunGeneratorTy)); // I need a pointer to function!

    Value* destFunGenArgs[4];
    destFunGenArgs[0] = f1PtrVal;
    destFunGenArgs[1] = OSRSrcPtrVal;
    destFunGenArgs[2] = extraPtrVal;
    destFunGenArgs[3] = stub->arg_begin();

    CallInst* destFunGeneratorCall = CallInst::Create(destFunGenVal, destFunGenArgs, "destFunGenCall", stubEntryPoint); // direct call to absolute address

    // step (4)
    CallInst* generatedFunCall;
    if (retTy->isVoidTy()) {
        generatedFunCall = CallInst::Create(destFunGeneratorCall, argsForFunToGenerate);
    } else {
        generatedFunCall = CallInst::Create(destFunGeneratorCall, argsForFunToGenerate, "generatedFunCall");
    }

    stubEntryPoint->getInstList().push_back(generatedFunCall);

    // step (5)
    ReturnInst* retInst;
    if (retTy->isVoidTy()) {
        retInst = ReturnInst::Create(Context);
    } else {
        retInst = ReturnInst::Create(Context, generatedFunCall);
    }
    stubEntryPoint->getInstList().push_back(retInst);

    #ifdef PROFILE_TIME
    timer_end(&my_timer);
    double elapsed = timer_get_elapsed(&my_timer);
    fprintf(stderr, "Time spent in stub generation: %.9f seconds\n", elapsed);
    #endif

    /* [Prepare F1' aka newSrc] Workflow
     * (1) Duplicate F1 into newSrc and regenerate OSRCond
     * (2) Generate newValuesToPass (including the address of profDataVal)
     * (3) Generate OSRBlock to invoke stub and return its result
     * (4) Insert code to compute OSR condition and jump to OSRBlock
     *
     * Step (1) is not performed when updateF1 == true
     */

    #ifdef PROFILE_TIME
    timer_start(&my_timer);
    #endif

    Module* parentForSrc = src->getParent();

    std::vector<Value*> newValuesToPass;
    ValueToValueMapTy srcToNewSrcVMap; // used only when updateF1 = false

    Function* newSrcFun;
    OSRCond* ptrToOSRCond;
    BasicBlock* ptrToSrcBlock;

    // TODO rewrite this part
    OSRCond newCond;

    if (!config.updateF1) {
        // step (1)
        newSrcFun = duplicateFunction(src, newFunName, srcToNewSrcVMap);

        // generate state mapping between src and newSrcFun
        if (config.ptrForF1NewToF1Map != nullptr) {
            *(config.ptrForF1NewToF1Map) = new StateMap(newSrcFun, src, srcToNewSrcVMap, true); // bidirectional mapping
        }

        newCond = regenerateOSRCond(cond, srcToNewSrcVMap);

        ptrToOSRCond = &newCond;
        ptrToSrcBlock = cast<BasicBlock>(srcToNewSrcVMap[srcBlock]);
    } else {
        newSrcFun = src;
        ptrToOSRCond = &cond;
        ptrToSrcBlock = srcBlock;
    }

    // step (2)
    Value* newProfDataVal;
    if (profDataVal != nullptr) {
        newProfDataVal = (!config.updateF1) ? cast<Value>(srcToNewSrcVMap[profDataVal]) : profDataVal; // TODO check cast
        if (!newProfDataVal->getType()->isPointerTy()) {
            // TODO
            llvm::report_fatal_error("Sorry, I don't know yet how to pass non-pointer profiling values!");
        }
    } else {
        newProfDataVal = ConstantExpr::getIntToPtr(ConstantInt::get(int64Ty, 0), i8PointerTy); // we pass 0 as NULL value
    }
    newValuesToPass.push_back(newProfDataVal);
    for (std::vector<Value*>::iterator it = valuesToPass.begin(), end = valuesToPass.end(); it != end; ++it) {
        if (!config.updateF1) {
            newValuesToPass.push_back(srcToNewSrcVMap[*it]);
        } else {
            newValuesToPass.push_back(*it);
        }
    }

    // step (3)
    BasicBlock* OSR_B = generateTriggerOSRBlock(Context, stub, newValuesToPass);
    OSR_B->insertInto(newSrcFun);

    // step (4)
    insertOSRCond(Context, newSrcFun, ptrToSrcBlock, OSR_B, *ptrToOSRCond,
            Twine("splitBlockForOSRTo", stub->getName()),
            config.branchTakenProb); /* BasicBlock* splittedBlock = ... */

    #ifdef PROFILE_TIME
    timer_end(&my_timer);
    elapsed = timer_get_elapsed(&my_timer);
    fprintf(stderr, "Time spent in OSR point insertion: %.9f seconds\n", elapsed);
    #endif

    /* Code verification and insertion into modules */

    #ifdef PROFILE_TIME
    timer_start(&my_timer);
    #endif

    // verify newSrcFun and stub add them to the proper module
    if (config.updateF1) {
        // newSrcFun == src here
        if (parentForSrc == nullptr) {
            if (config.verbose) {
                std::cerr << "WARNING: Supplied F1 does not belong to any LLVM Module!" << std::endl;
            }
            Module tmpMod("OSRtmpMod", Context);
            tmpMod.getFunctionList().push_back(stub);
            verifyAux(stub);
            tmpMod.getFunctionList().push_back(src);
            verifyAux(src);
            stub->removeFromParent();
            src->removeFromParent();
        } else {
            parentForSrc->getFunctionList().push_back(stub);
            verifyAux(stub);
            verifyAux(src);
        }
    } else {
        if (config.modForNewF1 == nullptr) {
            if (config.verbose) {
                std::cerr << "WARNING: No LLVM Module supplied for F1'!" << std::endl;
            }
            Module tmpMod("OSRtmpMod", Context);
            tmpMod.getFunctionList().push_back(stub);
            verifyAux(stub);
            tmpMod.getFunctionList().push_back(src);
            verifyAux(src);
            stub->removeFromParent();
            src->removeFromParent();
        } else {
            if (config.verbose) {
                std::cerr << "WARNING : Replacement of references to functions and "
                        << "globals for F1' has not been implemented yet!" << std::endl;;
            }
            config.modForNewF1->getFunctionList().push_back(stub);
            verifyAux(stub);
            config.modForNewF1->getFunctionList().push_back(newSrcFun);
            verifyAux(newSrcFun);
        }
    }

    // cleanup
    if (valuesToTransfer == nullptr) {
        delete valuesToPassTmp;
    }

    #ifdef PROFILE_TIME
    timer_end(&my_timer);
    elapsed = timer_get_elapsed(&my_timer);
    fprintf(stderr, "Time spent in IR verification: %.9f seconds\n", elapsed);
    #endif

    return OSRPair(newSrcFun, stub);
}

/**
 * Auxiliary methods
 */
void OSRLibrary::applyAttributesToArguments(Function* NF, Function* F, std::vector<Value*> &valuesToPass, bool skipFirst) {
    AttributeSet srcFunAttrs = F->getAttributes();
    Function::arg_iterator argIt = NF->arg_begin(), argEnd = NF->arg_end();
    if (skipFirst) argIt++;
    for (Value* src_v: valuesToPass) {
        Argument *arg = argIt++;
        if (Argument* src_arg = dyn_cast<Argument>(src_v)) {
            AttributeSet attrs = srcFunAttrs.getParamAttributes(src_arg->getArgNo() + 1); // 0 is for the function
            if (attrs.getNumSlots() > 0) {
                arg->addAttr(attrs);
            }
        }
    }
    assert(argIt == argEnd);
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

void OSRLibrary::replaceUsesWithNewValuesAndUpdatePHINodes(Function* NF, BasicBlock* origDestBlock,
        std::vector<Value*> &origValuesToSetForDestBlock, ValueToValueMapTy &VMap,
        ValueToValueMapTy &updatesForVMap, SmallVectorImpl<PHINode*> *insertedPHINodes,
        bool verbose, StateMap** ptrForF2NewToF2Map) {
    BasicBlock* entryPoint = &NF->getEntryBlock();
    BasicBlock* OSRdestBlock = cast<BasicBlock>(VMap[origDestBlock]);

    /* For each value to set at the target basic block, we have three cases:
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

    PHINode* lastInserted = nullptr;

    std::vector<Value*> valuesForSSAUpdater;

    // treat case 1 & 2 first
    for (std::vector<Value*>::iterator it = origValuesToSetForDestBlock.begin(),
            end = origValuesToSetForDestBlock.end(); it != end; ++it) {
        Value* origValue = *it;
        if (isa<Argument>(origValue)) continue; // it has already been handled

        Value* oldValue = VMap[origValue];
        Instruction* oldInst = cast<Instruction>(oldValue);
        BasicBlock* oldBlock = oldInst->getParent();

        if (oldBlock == OSRdestBlock) {
            if (PHINode* node = dyn_cast<PHINode>(oldInst)) {
                if (verbose) {
                    if (origValue->hasName()) {
                        std::cerr << "Processing value: " << origValue->getName().str() << std::endl;
                    } else {
                        std::cerr << "Processing anonymous value: " << std::endl;
                    }
                    std::cerr << "--> value is a PHI node defined in the target block" << std::endl;
                }

                Value* newValue = updatesForVMap[origValue];
                BasicBlock* newBlock = entryPoint;

                node->addIncoming(newValue, newBlock);

                if (ptrForF2NewToF2Map != nullptr) { // update state mapping
                    (*ptrForF2NewToF2Map)->registerOneToOneValue(oldValue, origValue);
                }

                ++updatedNodes;

                continue;
            }
        }

        valuesForSSAUpdater.push_back(origValue);
    }

    if (!valuesForSSAUpdater.empty()) {
        // split OSRdest block at first non-PHI instruction
        BasicBlock::iterator firstNonPHIInstr = OSRdestBlock->getFirstNonPHI();
        BasicBlock* splitBlock = OSRdestBlock->splitBasicBlock(firstNonPHIInstr, "tmpSSAUpdaterBlock");

        for (Value* origValue: valuesForSSAUpdater) {
            if (verbose) {
                if (origValue->hasName()) {
                    std::cerr << "Processing value: " << origValue->getName().str() << std::endl;
                } else {
                    std::cerr << "Processing anonymous value: " << std::endl;
                }
            }

            Value* oldValue = VMap[origValue];
            Instruction* oldInst = cast<Instruction>(oldValue);
            BasicBlock* oldBlock = oldInst->getParent();

            Value* newValue = updatesForVMap[origValue];

            if (oldValue->hasName()) {
                updateSSA.Initialize(oldValue->getType(), StringRef(Twine(oldValue->getName(), "_fixSSA").str()));
            } else {
                updateSSA.Initialize(oldValue->getType(), StringRef("anon_fixSSA"));
            }
            updateSSA.AddAvailableValue(oldBlock, oldValue);
            updateSSA.AddAvailableValue(entryPoint, newValue);

            if (verbose) {
                std::cerr << "----> uses being rewritten using SSAUpdater::RewriteUse()" << std::endl;
            }

            for (Value::use_iterator UI = oldValue->use_begin(), UE = oldValue->use_end(); UI != UE; ) {
                // Grab the use before incrementing the iterator.
                Use &U = *UI;

                // Increment the iterator before removing the use from the list.
                ++UI;

                updateSSA.RewriteUse(U);
            }

            ++replacedUses;

            // update state mapping
            if (ptrForF2NewToF2Map != nullptr && !insertedPHINodes->empty()) {
                PHINode* tmp = insertedPHINodes->back();
                if (tmp != lastInserted) {
                    lastInserted = tmp; // TODO check if at most one PHI node can be inserted
                    (*ptrForF2NewToF2Map)->registerOneToOneValue(lastInserted, origValue, false);
                }
            }
        }

        // merge newBlock and OSRdestBlock back together
        splitBlock->replaceAllUsesWith(OSRdestBlock);
        OSRdestBlock->getInstList().back().eraseFromParent();
        OSRdestBlock->getInstList().splice(OSRdestBlock->end(), splitBlock->getInstList());
        splitBlock->eraseFromParent();
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

BasicBlock* OSRLibrary::generateTriggerOSRBlock(llvm::LLVMContext &Context, Function* OSRDest,
        std::vector<Value*> &valuesToPass) {
    StringRef OSRFunName = OSRDest->getName();
    Type* retTy = OSRDest->getReturnType();

    // generate basic block to trigger the OSR transition
    BasicBlock* OSR_B = BasicBlock::Create(Context, Twine("OSRBlockTo", OSRFunName));

    // generate call instruction for the resolved OSR transition
    CallInst* callInst;
    if (OSRDest->getReturnType()->isVoidTy()) {
        callInst = CallInst::Create(OSRDest, valuesToPass);
    } else {
        callInst = CallInst::Create(OSRDest, valuesToPass, Twine("OSRCallTo", OSRFunName));
    }

    OSR_B->getInstList().push_back(callInst);

    // if OSRDest is non-void we should return the value it computes
    ReturnInst* retInst;
    if (retTy->isVoidTy()) {
        retInst = ReturnInst::Create(Context);
    } else {
        retInst = ReturnInst::Create(Context, callInst);
    }
    OSR_B->getInstList().push_back(retInst);

    return OSR_B;
}

BasicBlock* OSRLibrary::insertOSRCond(LLVMContext &Context, Function* F, BasicBlock* B, BasicBlock* OSR_B,
        OSRLibrary::OSRCond& cond, const Twine& BBName, int branchTakenProb) {
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

    if (branchTakenProb != -1) {
        MDBuilder builder(Context);
        MDNode* weightsNode = builder.createBranchWeights(branchTakenProb, 100 - branchTakenProb);
        br->setMetadata(LLVMContext::MD_prof, weightsNode);
    }

    B->getInstList().push_back(br);

    return NB;
}

std::vector<llvm::Value*>* OSRLibrary::getLiveValsVecAtInstr(const Instruction* I, LivenessAnalysis &LA) {
    std::vector<Value*>* vec = new std::vector<Value*>();

    LivenessAnalysis::LiveValues liveInAtOSRSrc = getLiveValsAtInstr(I, LA);
    for (const Value* v: liveInAtOSRSrc) {
        vec->push_back(const_cast<Value*>(v));
    }

    return vec;
}

LivenessAnalysis::LiveValues OSRLibrary::getLiveValsAtInstr(const Instruction* I, LivenessAnalysis &LA) {
    const BasicBlock* B = I->getParent();

    LivenessAnalysis::LiveValues &liveOutAtB = LA.getLiveOutValues(B);

    return LivenessAnalysis::analyzeLiveInForSeq(B, liveOutAtB, I, nullptr);
}

void OSRLibrary::printLiveVarInfoForDebug(LivenessAnalysis::LiveValues &liveIn,
        LivenessAnalysis::LiveValues &liveOut, std::vector<llvm::Value*> &valuesToFetch) {
    std::cerr << "LIVE_IN at block: (" << liveIn.size() << ")   ";
    std::cerr << liveIn << std::endl;
    std::cerr << "LIVE_OUT at block: (" << liveOut.size() << ")  ";
    std::cerr << liveOut << std::endl;

    std::cerr << "Values to fetch: (" << valuesToFetch.size() << ")    { ";
    for (Value* v: valuesToFetch) {
        std::cerr <<  v->getName().str() << " ";
    }
    std::cerr << "}" << std::endl;
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