/* ===============================================================
 * A simple parser for TinyVM's command line.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Parser.hpp"
#include "Lexer.hpp"
#include "MCJITHelper.hpp"
#include "OSRLibrary.hpp"
#include "StateMap.hpp"
#include "timer.h"

#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/Support/raw_os_ostream.h>

#include <cstdio>
#include <cstring>
#include <string>
#include <iostream>

#include <strings.h> // strcasecmp()
#include <unistd.h> // access()

using namespace llvm;

int Parser::start(bool displayHelpMsg) {
    if (displayHelpMsg) {
        std::cerr << "Welcome! Enter 'HELP' to show the list of available commands." << std::endl;
    }

    while (1) {
        fprintf(stderr, "TinyVM> ");
        int token = TheLexer->getNextToken();
        switch (token) {
            case tok_newline:       fprintf(stderr, "\r"); break; // dirty trick :-)
            case tok_help:          handleHelpCommand(); break;
            case tok_begin:         handleBeginCommand(); break;
            case tok_load_IR:       handleLoadIRCommand(); break;
            case tok_insert_osr:    handleInsertOSRCommand(); break;
            case tok_cfg:           handleShowCFGCommand(false); break;
            case tok_cfg_full:      handleShowCFGCommand(true); break;
            case tok_dump:          handleDumpCommand(false); break;
            case tok_show_lids:     handleDumpCommand(true); break;
            case tok_repeat:        handleRepeatCommand(); break;
            case tok_track_asm:     handleTrackAsmCommand(); break;
            case tok_show_addr:     handleShowAddrCommand(); break;
            case tok_show_asm:      TheHelper->showTrackedAsm(); break;
            case tok_show_mods:     TheHelper->showModules(); break;
            case tok_show_funs:     TheHelper->showFunctions(); break;
            case tok_load_lib:      handleLoadLibCommand(); break;
            case tok_opt_cfg:       handleOptCommand(true); break;
            case tok_opt_full:      handleOptCommand(false); break;
            case tok_verbose:       handleVerboseCommand(); break;
            case tok_quit:          std::cerr << "Exiting..." << std::endl; return 0;
            case tok_identifier:    handleFunctionInvocation(1); break;
            case tok_eof:           std::cerr << "CTRL+D or EOF reached." << std::endl; return -1;
            default:                std::cerr << "Unexpected token. Exiting..." << std::endl;; return 1;
        }
    }
}

void Parser::handleBeginCommand() {
    if (TheLexer->getNextToken() != tok_identifier) {
        std::cerr << "[ERROR] You must specify a name for the module!" << std::endl;
        return;
    }
    std::string ModuleName = TheLexer->getIdentifier();

    if ( TheLexer->getNextToken() != tok_newline) {
        std::cerr << "[ERROR] Invalid syntax for typing a module!" << std::endl;
        return;
    }

    char fileName[256];
    sprintf(fileName, "%s.ll", ModuleName.c_str());

    /*if (access(fileName, F_OK) != -1 ) {
        fprintf(stderr, "[ERROR] IR source file \"%s\" already exists!\n", fileName);
        return;
    }*/

    FILE* out = fopen(fileName, "w+");
    if (out == nullptr) {
        std::cerr << "[ERROR] Fatal error when creating IR source file \"" << fileName << "\"." << std::endl;
        exit(1);
    }

    std::cerr << "[MODULE] Press CTRL+D when you've entered all the code." << std::endl;

    std::string *curLine;

    while (1) {
        curLine = TheLexer->getLine();
        if (curLine == nullptr) break;

        //fprintf(out, "%s\n", curLine->c_str()); // TODO
        std::cerr << *(curLine) << std::endl;
        TheLexer->getNextToken();
        delete curLine;
    }

    TheLexer->getNextToken(); // eats the EOF in the Lexer
    //delete curLine;
    std::cerr << "[MODULE] Module parsed and stored into \"" << fileName << "\"." << std::endl,
    fclose(out);

    std::unique_ptr<Module> M = TheHelper->createModuleFromFile(std::string(fileName));
    TheHelper->addModule(std::move(M));
    std::cerr << "[LOAD] The new module has been loaded." << std::endl;
}

void Parser::handleOptCommand(bool CFGSimplificationOnly) {
    if (TheLexer->getNextToken() != tok_identifier) {
        const std::string cmdName = (CFGSimplificationOnly) ? "OPT_FULL" : "OPT_CFG";
        std::cerr << "Invalid syntax for a " << cmdName << "command!" << std::endl
                << "Expected command of the form: " << cmdName<< " <function_name" << std::endl;
        return;
    }
    const std::string Name = TheLexer->getIdentifier();

    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        std::cerr << "Unable to find function named " << Name << "!" << std::endl;
        return;
    } else {
        Module* M = F->getParent();
        assert(M != nullptr);
        FunctionPassManager FPM = TheHelper->createFPM(M, CFGSimplificationOnly);
        FPM.run(*F);
        FPM.doFinalization();
        std::cerr << "Function has been optimized!" << std::endl;
    }
}

void Parser::handleDumpCommand(bool showLineIDs) {
    #define INVALID() do { std::cerr << "Invalid syntax for a DUMP command!" << std::endl \
            << "Expected command of the form: DUMP <function_name>" << std::endl; \
            return; } while (0);

    if (TheLexer->getNextToken() != tok_identifier) INVALID();
    const std::string Name = TheLexer->getIdentifier();
    #undef INVALID

    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        std::cerr << "Unable to find function named " << Name << "!" << std::endl;
        return;
    }

    if (showLineIDs) {
        dumpFunctionWithLineIDs(F);
    } else {
        F->dump();
    }
}

void Parser::handleFunctionInvocation(int iterations) {
    #define INVALID() do { std::cerr << "Invalid syntax for a function invocation!" << std::endl; return; } while (0);
    const std::string &FunctionName = TheLexer->getIdentifier();

    int token = TheLexer->getNextToken();
    if (token != '(') INVALID();

    std::vector<int> Arguments;

    token = TheLexer->getNextToken();

    if (token != ')') {
        if (token != tok_integer) INVALID();
        Arguments.push_back(TheLexer->getInteger());
        token = TheLexer->getNextToken();

        while (token != ')') {
            if (token != ',') INVALID();

            token = TheLexer->getNextToken();
            if (token != tok_integer) INVALID();
            Arguments.push_back(TheLexer->getInteger());

            token = TheLexer->getNextToken();
        }
    }
    #undef INVALID


    int (*fun)() = TheHelper->createAnonymousFunctionForCall(FunctionName, Arguments);

    // run anonymous function and show elapsed time
    tinyvm_timer_t timer;
    if (iterations == 1) {

        timer_start(&timer);
        int result = fun();
        timer_end(&timer);

        timer_print_elapsed(&timer);
        std::cerr << "Evaluated to: " << result << std::endl;
    } else {
        int i, result;
        tinyvm_timer_t iter_timer;

        timer_start(&timer);
        for (i = 0; i < iterations; ) {
            timer_start(&iter_timer);
            result = fun();
            timer_end(&iter_timer);
            std::cerr << "[Iteration " << ++i << "] ";
            timer_print_elapsed(&iter_timer);
        }
        timer_end(&timer);

        timer_print_elapsed(&timer);
        timer_print_avg(&timer, iterations); // TODO includes also iter_timer and print overhead
        std::cerr << "Number of iterations: " << iterations << std::endl;
        std::cerr << "Last call evaluated to: " << result << std::endl;
    }
}

void Parser::handleHelpCommand() {
    // simple commands
    std::cerr << "List of available commands:" << std::endl;
    std::cerr << "--> BEGIN <module_name>" << std::endl << "\tType an IR module from stdin. Press CTRL-D when finished." << std::endl;
    std::cerr << "--> LOAD_IR <file_name>" << std::endl << "\tLoads an IR module from a given file." << std::endl;
    std::cerr << "--> LOAD_LIB <file_name>" << std::endl << "\tLoads the dynamic library at the given path." << std::endl;
    std::cerr << "--> CFG <function_name>" << std::endl << "\tShows a compact view of the CFG of a given function." << std::endl;
    std::cerr << "--> CFG_FULL <function_name>" << std::endl << "\tShows the full CFG (with instructions) of a given function." << std::endl;
    std::cerr << "--> DUMP <function_name>" << std::endl << "\tShows the IR code of a given function." << std::endl;
    std::cerr << "--> OPT_CFG <function_name>" << std::endl << "\tPerforms a CFG simplification pass over a given function." << std::endl;
    std::cerr << "--> OPT_FULL <function_name>" << std::endl << "\tPerforms several optimization passes over a given function." << std::endl;
    std::cerr << "--> REPEAT <iterations> <function call>" << std::endl << "\tPerforms a function call (see next paragraph) repeatedly." << std::endl;
    std::cerr << "--> TRACK_ASM" << std::endl << "\tEnable/disable logging of generated x86-64 assembly code." << std::endl;
    std::cerr << "--> SHOW_ADDR <function_name>" << std::endl << "\tShows compiled-code address of a given function (forces compilation!)." << std::endl;
    std::cerr << "--> SHOW_LINE_IDS <function_name>" << std::endl << "\tShows by-line IR identifiers for a given function." << std::endl;
    std::cerr << "--> SHOW_ASM" << std::endl << "\tShow logged x86-64 assembly code." << std::endl;
    std::cerr << "--> SHOW_FUNS" << std::endl << "\tShow function symbols tracked by MCJITHelper." << std::endl;
    std::cerr << "--> SHOW_MODS" << std::endl << "\tShow loaded modules and their symbols." << std::endl;
    std::cerr << "--> VERBOSE" << std::endl << "\tEnable/disable verbose mode." << std::endl;
    std::cerr << "--> QUIT" << std::endl << "\tExits TinyVM." << std::endl;

    // function invocation
    std::cerr << std::endl << "The TinyVM command line supports the invocation of loaded functions. "
              << "Functions can be invoked as in C, except for the final semi-colon that must not be added." << std::endl
              << "For the time being, only functions with integer arguments and return values are supported." << std::endl;

    // insert_osr
    std::cerr << std::endl << "Demo OSR points can be inserted with one of the following commands:" << std::endl
              << "INSERT_OSR <PROB> <COND> OPEN UPDATE IN <F1> AT <P1>" << std::endl
              << "INSERT_OSR <PROB> <COND> OPEN COPY IN <F1> AT <P1> AS <F1'>" << std::endl
              << "INSERT_OSR <PROB> <COND> SLVD UPDATE IN <F1> AT <P1> TO <F2> AT <P2> AS <F2'>" << std::endl
              << "INSERT_OSR <PROB> <COND> SLVD COPY IN <F1> AT <P1> AS <F1'> TO <F2> AT <P2> AS <F2'>" << std::endl
              << std::endl << "where:" << std::endl
              << "\tPROB is either -1 (no branch weight) or an integer in {0, ..., 100}" << std::endl
              << "\tCOND is either ALWAYS or NEVER" << std::endl
              << "\tF1 and F2 are existing functions" << std::endl
              << "\tP1 and P2 are locations in F1 and F2 respectively" << std::endl;
    std::cerr << std::endl << "The command can either update F1 or generate a new function F1' cloning F1 "
              << "such that when P1 is reached during the execution, an OSR transition is fired. "
              << "For OPEN transitions, the continuation function is generated at run-time. "
              << "For SLVD transitions, a function F2' is generated from F2 to resume the execution at "
              << "P2." << std::endl;
    std::cerr << std::endl << "Program locations can be expressed using an LLVM \'%name\' (including "
              << "numerical IDs for anonymous values) or a line ID \'$i\' reported by SHOW_LINE_IDS. "
              << "For basic block locations OSR points are inserted before the first non-PHI instruction."
              << std::endl;
}

void Parser::openOSRHelper(Function* src, Instruction* OSRSrc, bool update,
        std::string* F1NewName, OSRLibrary::OSRCond &cond, int branchTakenProb) {

    MCJITHelper::MCJITHelperOSRInfo* extra = new MCJITHelper::MCJITHelperOSRInfo();
    extra->TheHelper = TheHelper;

    OSRLibrary::DestFunGenerator generator = MCJITHelper::identityGeneratorForOpenOSR;

    // (verbose, updateF1, branchTakenProb, nameForNewF1, modForNewF1, ptrForF1NewToF1Map, nameForNewF2, nameForNewF2, ptrForF2NewToF2Map)
    StateMap* F1NewToF1Map;
    Module* modToUse = src->getParent();
    OSRLibrary::OSRPointConfig config(verbose, update, branchTakenProb, F1NewName,
            modToUse, &F1NewToF1Map, nullptr, nullptr, nullptr);
    LivenessAnalysis LA(src);

    OSRLibrary::OSRPair pair = OSRLibrary::insertOpenOSR(TheHelper->Context, *src,
        *OSRSrc, extra, cond, nullptr, generator, nullptr, &LA, config);

    std::cerr << "insertOpenOSR succeded!" << std::endl;

    Function *src_new = pair.first, *stub = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << stub->getName().str() << std::endl;

    if (!update) {
        TheHelper->registerFunction(src_new);
    }
    TheHelper->registerFunction(stub);

    TheHelper->trackAsmCodeUtil(modToUse);
}

void Parser::resolvedOSRHelper(Function* src, Instruction* OSRSrc, bool update,
            std::string* F1NewName, const std::string* F2Name, const std::string* LPadName,
            std::string* F2NewName, OSRLibrary::OSRCond &cond, int branchTakenProb) {

    std::pair<Function*, StateMap*> tmpMapPair = StateMap::generateIdentityMapping(src);
    StateMap* M = tmpMapPair.second;
    Function *dest = tmpMapPair.first;
    Instruction* LPad = const_cast<Instruction*>(getOSRLocationFromStrIDs(*dest, *LPadName));
    if (LPad == nullptr) return;

    if (LPad != M->getLandingPad(OSRSrc)) { // TODO
        std::cerr << "I don't know how to perform an OSR transition from P1 to P2, sorry!" << std::endl;
        return;
    }

    // (verbose, updateF1, branchTakenProb, nameForNewF1, modForNewF1, ptrForF1NewToF1Map, nameForNewF2, nameForNewF2, ptrForF2NewToF2Map)
    StateMap* F1NewToF1Map;
    StateMap* F2NewToF2Map;
    Module* modToUse = src->getParent();
    OSRLibrary::OSRPointConfig config(verbose, update, branchTakenProb, F1NewName, modToUse,
            &F1NewToF1Map, F2NewName, modToUse, &F2NewToF2Map);

    OSRLibrary::OSRPair pair = OSRLibrary::insertResolvedOSR(TheHelper->Context, *src, *OSRSrc,
            *dest, *LPad, cond, *M, config);

    std::cerr << "insertResolvedOSR succeded!" << std::endl;

    Function *src_new = pair.first, *dest_new = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << dest_new->getName().str() << std::endl;

    if (!update) {
        TheHelper->registerFunction(src_new);
    }
    TheHelper->registerFunction(dest_new);

    TheHelper->trackAsmCodeUtil(modToUse);
}

void Parser::handleInsertOSRCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for an INSERT_OSR command!" << std::endl\
            << "Error at argument " << numToken << ". Enter HELP to display the right syntax." << std::endl;\
            return; } while (0);

    std::string* tmp = TheLexer->getLine();
    char* cmdLine = strdup(tmp->c_str());
    delete tmp;

    int numToken = 1;
    char* token = strtok(cmdLine, " ");
    if (token == NULL) INVALID();
    #define getToken() do { ++numToken; token = strtok(NULL, " "); if (token == NULL) INVALID();} while (0)

    int branchTakenProb = (int)strtol(token, NULL, 10);
    if (branchTakenProb != -1 && (branchTakenProb < 0 || branchTakenProb > 100)) INVALID();

    getToken();
    OSRLibrary::OSRCond cond;
    if (!strcasecmp(token, "ALWAYS")) {
        cond.push_back(TheHelper->generateAlwaysTrueCond());
    } else if (!strcasecmp(token, "NEVER")) {
        cond.push_back(TheHelper->generateAlwaysFalseCond());
    } else {
        INVALID();
    }

    bool open = false;
    getToken();
    if (!strcasecmp(token, "OPEN")) {
        open = true;
    } else if (strcasecmp(token, "SLVD")) {
        INVALID();
    }

    bool update = false;
    getToken();
    if (!strcasecmp(token, "UPDATE")) {
        update = true;
    } else if (strcasecmp(token, "COPY")) {
        INVALID();
    }

    getToken();
    if (strcasecmp(token, "IN")) INVALID();

    getToken();
    const std::string F1Name(token);

    getToken();
    if (strcasecmp(token, "AT")) INVALID();

    getToken();
    const std::string P1Name(token);

    // look for F1 and P1
    Function* src = TheHelper->getFunction(F1Name);
    if (src == nullptr) {
        std::cerr << "Unable to find function " << F1Name << "!" << std::endl;
        return;
    }
    Instruction* OSRSrc = const_cast<Instruction*>(getOSRLocationFromStrIDs(*src, P1Name));
    if (OSRSrc == nullptr) return;

    std::string F1NewName;
    if (!update) {
        getToken();
        if (strcasecmp(token, "AS")) INVALID();

        getToken();
        F1NewName = std::string(token);
    }

    std::string* tmpForF1NewName = (update) ? nullptr : &F1NewName;

    if (open) {
        openOSRHelper(src, OSRSrc, update, tmpForF1NewName, cond, branchTakenProb);
        delete cmdLine;
        return;
    }

    getToken();
    if (strcasecmp(token, "TO")) INVALID();

    getToken();
    const std::string F2Name(token);

    if (F1Name != F2Name) {
        std::cerr << "Sorry, I don't support OSR transitions for F2 != F1 yet!" << std::endl;
        return;
    }

    getToken();
    if (strcasecmp(token, "AT")) INVALID();

    getToken();
    const std::string P2Name(token);

    getToken();
    if (strcasecmp(token, "AS")) INVALID();

    getToken();
    const std::string F2NewName(token);

    resolvedOSRHelper(src, OSRSrc, update, tmpForF1NewName, &F2Name,
            &P2Name, const_cast<std::string*>(&F2NewName), cond, branchTakenProb);

    delete cmdLine;
    #undef getToken
    #undef INVALID
}


void Parser::handleLoadIRCommand() {
    std::string *FileName = TheLexer->getLine();
    const char* fileName = FileName->c_str();
    if (access(fileName, F_OK) == -1 ) {
        std::cerr << "[ERROR] Cannot locate \"" << fileName << "\" IR source file!" << std::endl;
        return;
    }
    std::cerr << "[LOAD] Opening \"" << fileName << "\" as IR source file..." << std::endl;
    std::unique_ptr<Module> M = TheHelper->createModuleFromFile(*FileName);
    TheHelper->addModule(std::move(M));
    delete FileName;
}

void Parser::handleLoadLibCommand() {
    std::string *FileName = TheLexer->getLine();
    const char* fileName = FileName->c_str();
    if (access(fileName, F_OK) == -1 ) {
        std::cerr << "[ERROR] Cannot locate \"" << fileName << "\" dynamic library!" << std::endl;
        return;
    }
    std::cerr << "[LOAD] Loading dynamic library \"" << fileName << std::endl;
    TheHelper->loadDynamicLibrary(fileName);
    delete FileName;
}

void Parser::handleRepeatCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for a REPEAT command!" << std::endl \
            << "Expected command of the form: REPEAT <iterations> <function call>" << std::endl; \
            return; } while (0);
    if (TheLexer->getNextToken() != tok_integer) INVALID();
    int iterations = TheLexer->getInteger();
    if (TheLexer->getNextToken() != tok_identifier) INVALID();
    #undef INVALID

    handleFunctionInvocation(iterations);
}

void Parser::handleShowAddrCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for a SHOW_ADDR command!" << std::endl \
            << "Expected command of the form: SHOW_ADDR <function_name>" << std::endl; \
            return; } while (0);

    if (TheLexer->getNextToken() != tok_identifier) INVALID();
    const std::string FunctionName = TheLexer->getIdentifier();
    #undef INVALID

    void* ptr = (void*)TheHelper->JIT->getFunctionAddress(FunctionName);
    if (ptr == nullptr) {
        std::cerr << "Cannot locate corresponding compiled function!" << std::endl;
    } else {
        std::cerr << "Compiled code for the function has been loaded at " << ptr << std::endl;
    }
}

void Parser::handleShowCFGCommand(bool showInstructions) {
    #define INVALID() do { std::cerr << "Invalid syntax for a CFG command!" << std::endl \
            << "Expected command of the form: CFG <function_name>" << std::endl; \
            return; } while (0);

    if (TheLexer->getNextToken() != tok_identifier) INVALID();
    const std::string Name = TheLexer->getIdentifier();
    #undef INVALID

    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        std::cerr << "Unable to find function named " << Name << "!" << std::endl;
        return;
    } else {
        if (showInstructions) {
            F->viewCFG();
        } else {
            F->viewCFGOnly();
        }
    }
}

void Parser::handleTrackAsmCommand() {
    bool enabled = TheHelper->toggleTrackAsm();
    if (enabled) {
        std::cerr << "Current status: tracking is enabled. Now disabling it!" << std::endl;
    } else {
        std::cerr << "Current status: tracking is disabled. Now enabling it!" << std::endl;
    }
    std::cerr << "Notice that only modules loaded from now on will be affected by this change." << std::endl;
}

void Parser::handleVerboseCommand() {
    if (verbose) {
        std::cerr << "Current status: verbose mode enabled. Now disabling it!" << std::endl;
    } else {
        std::cerr << "Current status: verbose mode disabled. Now enabling it!" << std::endl;
    }
    verbose = !verbose;
}

Parser::IDToValueVec Parser::computeLineIDs(Function* F) {
    IDToValueVec vec;

    #define REGLINE(val)    vec.push_back(val)
    for (Function::const_iterator B = F->begin(), endB = F->end(); B != endB; ++B) {
        REGLINE(B);

        for (BasicBlock::const_iterator I = B->begin(), endI = B->end(); I != endI; ++I) {
            REGLINE(I);
        }

        vec.push_back(nullptr); // separate blocks as in LLVM's F->dump()
    }
    #undef REGLINE

    return vec;
}

Parser::IDToValueVec Parser::computeSlotIDs(Function* F) {
    IDToValueVec vec;

    #define REGSLOT(val)    vec.push_back(val)

    for (Function::const_arg_iterator arg = F->arg_begin(), endArg = F->arg_end();
            arg != endArg; ++arg) {
        if (!arg->hasName()) REGSLOT(arg);
    }

    for (Function::const_iterator B = F->begin(), endB = F->end(); B != endB; ++B) {
        if (!B->hasName()) REGSLOT(B);

        for (BasicBlock::const_iterator I = B->begin(), endI = B->end(); I != endI; ++I) {
            if (!I->getType()->isVoidTy() && !I->hasName()) REGSLOT(I);
        }
    }

    #undef REGSLOT

    return vec;
}

void Parser::dumpFunctionWithLineIDs(llvm::Function* F) {
    IDToValueVec slotIDs = computeSlotIDs(F);
    IDToValueVec lineIDs = computeLineIDs(F);
    raw_os_ostream errStream(std::cerr);

    std::cerr << MCJITHelper::prototypeToString(*F);

    if (F->isDeclaration()) {
        std::cerr << std::endl;
        return;
    }

    std::cerr << "{" << std::endl;

    // to simplify lookup we build a reverse map for BBs only
    std::map<const BasicBlock*, int> blockToSlotIDMap;
    for (int index = 0, slots = slotIDs.size(); index < slots; ++index) {
        if (const BasicBlock* B = dyn_cast<BasicBlock>(slotIDs[index])) {
            blockToSlotIDMap.insert(std::pair<const BasicBlock*, int>(B, index));
        }
    }

    int lines = lineIDs.size() - 1; // last one is nullptr
    for (int lineID = 0; lineID < lines; ) {
        const Value* v = lineIDs[lineID];
        if (v == nullptr) {
            std::cerr << ++lineID << "> " << std::endl;
        } else if (const BasicBlock* B = dyn_cast<BasicBlock>(v)) {
            if (B->hasName()) {
                std::cerr << ++lineID << "> " << B->getName().str() << ":";
            } else {
                std::cerr << ++lineID << "> " << "; <label>:" << blockToSlotIDMap[B];
            }
            if (B == &F->getEntryBlock()) {
                std::cerr << "\t\t\t; Entrypoint" << std::endl;
                continue;
            }
            const_pred_iterator PB = pred_begin(B), PE = pred_end(B);
            if (PB == PE) {
                std::cerr << "\t\t\t; No predecessors!" << std::endl;
                continue;
            } else {
                std::cerr << "\t\t\t; preds = ";
                while (1) {
                    const BasicBlock* pred = *PB;
                    if (pred->hasName()) {
                        std::cerr << "%" << pred->getName().str();
                    } else {
                        std::cerr << "%" << blockToSlotIDMap[pred];
                    }
                    if (++PB == PE) {
                        std::cerr << std::endl;
                        break;
                    } else {
                        std::cerr << ", ";
                    }
                }
            }
        } else {
            const Instruction* I = cast<Instruction>(v);
            std::cerr << ++lineID << ">   ";
            I->print(errStream);
            std::cerr << std::endl;
        }
    }

    std::cerr << "}" << std::endl;
}

const llvm::Value* Parser::getValueFromStrID(llvm::Function &F, std::string &str,
        Parser::IDToValueVec &slotIDs, Parser::IDToValueVec &lineIDs) {
    int length = str.length();
    if (length < 2) return nullptr;

    bool isLineNumber = false;

    if (str[0] == '$') isLineNumber = true;
    else if (str[0] != '%') return nullptr;

    std::string::const_iterator it = ++str.begin(); // skip first char
    while (it != str.end() && std::isdigit(*it)) ++it;
    bool isNumber = (it == str.end());

    // line number
    if (isLineNumber) {
        if (!isNumber) return nullptr;
        int ID = (int)strtol(str.c_str()+1, NULL, 10);

        if (ID >= lineIDs.size()) return nullptr;
        return lineIDs[ID];
    }

    // anonymous LLVM Value
    if (isNumber) {
        int ID = (int)strtol(str.c_str()+1, NULL, 10);
        if (ID >= slotIDs.size()) return nullptr;
        return slotIDs[ID];
    }

    // named LLVM Value
    std::string name = str.substr(1, length - 1);
    llvm::StringRef nameRef(name);

    for (Function::const_arg_iterator arg = F.arg_begin(), endArg = F.arg_end();
            arg != endArg; ++arg) {
        if (arg->hasName() && arg->getName().equals(nameRef)) return arg;
    }

    for (Function::const_iterator B = F.begin(), endB = F.end(); B != endB; ++B) {
        if (B->hasName() && B->getName().equals(nameRef)) return B;

        for (BasicBlock::const_iterator I = B->begin(), endI = B->end(); I != endI; ++I) {
            if (I->hasName() && I->getName().equals(nameRef)) return I;
        }
    }

    return nullptr;
}

const Instruction* Parser::getOSRLocationFromStrIDs(Function &F, const std::string &LocID) {
    IDToValueVec slotIDs = computeSlotIDs(&F);
    IDToValueVec lineIDs = computeLineIDs(&F);

    const Value* v = getValueFromStrID(F, const_cast<std::string&>(LocID), slotIDs, lineIDs);
    if (v == nullptr) {
        std::cerr << "Unable to find location " << LocID << " in function " << F.getName().str()
                  << ". Did you forget to put the \'%\' (or \'$\') prefix?" << std::endl;
        return nullptr;
    }

    if (const BasicBlock* B = dyn_cast<BasicBlock>(v)) {
        return B->getFirstNonPHI();
    }

    if (const Instruction* I = dyn_cast<Instruction>(v)) {
        if (isa<PHINode>(I)) {
            std::cerr << "ERROR: PHI instructions can't be used as OSR locations!" << std::endl;
            return nullptr;
        }

        if (I != I->getParent()->getFirstNonPHI()) {
            std::cerr << "Sorry, for the time being only firstNonPHI instructions are supported." << std::endl;
            return nullptr;
        }

        return I;
    }

    std::cerr << "ERROR: only instructions and basic blocks are valid OSR locations!" << std::endl;
    return nullptr;
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
