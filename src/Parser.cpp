/* ===============================================================
 * A simple parser for TinyVM's command line.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Parser.hpp"
#include "Lexer.hpp"
#include "BuildComp.hpp"
#include "CodeMapper.hpp"
#include "Liveness.hpp"
#include "MCJITHelper.hpp"
#include "OptPasses.hpp"
#include "OSRLibrary.hpp"
#include "StateMap.hpp"
#include "history.h"
#include "timer.h"

#include <llvm/ADT/Statistic.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_os_ostream.h>

#undef NDEBUG
#include <cassert>
#include <cstdio>
#include <cstring>
#include <string>
#include <iostream>

#include <libgen.h> // basename()
#include <strings.h> // strcasecmp()
#include <unistd.h> // access()

using namespace llvm;

// INIT_TOKENIZER relies on function-local scope as it declares variables! The
// calling function should also declare an INVALID() macro for error messages.
// INIT_TOKENIZER also puts the first token inside the variable token. GET_TOKEN
// can be used instead at any point of the function to get subsequent tokens.
#define INIT_TOKENIZER(cmdLine) int numToken = 1; char* token = strtok((cmdLine), " ");
#define GET_TOKEN() do { ++numToken; token = strtok(NULL, " "); if (token == NULL) INVALID();} while (0)
#define GET_TOKEN_OR_NULL() do { ++numToken; token = strtok(NULL, " "); } while(0)

static BuildComp::Heuristic compCodeStrategy = BuildComp::Heuristic::BC_NONE;

int Parser::start(bool displayHelpMsg) {
    if (displayHelpMsg) {
        std::cerr << "Welcome! Enter 'HELP' to show the list of available commands."
                  << std::endl;
    }

    while (1) {
        fprintf(stderr, "TinyVM> ");
        int token = TheLexer->getNextToken();
        if (TheHistory != nullptr) restore_term(TheHistory);
        switch (token) {
            case tok_newline:       fprintf(stderr, "\r"); break; // dirty trick :-)
            case tok_help:          handleHelpCommand(); break;
            case tok_begin:         handleBeginCommand(); break;
            case tok_cfg:           handleShowCFGCommand(false); break;
            case tok_cfg_full:      handleShowCFGCommand(true); break;
            case tok_clone_fun:     handleCloneFunCommand(); break;
            case tok_comp_code:     handleCompCodeCommand(); break;
            case tok_dump:          handleDumpCommand(false); break;
            case tok_insert_osr:    handleInsertOSRCommand(); break;
            case tok_load_IR:       handleLoadIRCommand(); break;
            case tok_load_lib:      handleLoadLibCommand(); break;
            case tok_maps:          handleMapsCommand(); break;
            case tok_opt:           handleOptCommand(); break;
            case tok_opt_cfg:       handleOldOptCommand(true); break;
            case tok_opt_full:      handleOldOptCommand(false); break;
            case tok_repeat:        handleRepeatCommand(); break;
            case tok_show_addr:     handleShowAddrCommand(); break;
            case tok_show_asm:      TheHelper->showTrackedAsm(); break;
            case tok_show_funs:     TheHelper->showFunctions(); break;
            case tok_show_lids:     handleDumpCommand(true); break;
            case tok_show_mods:     TheHelper->showModules(); break;
            case tok_track_asm:     handleTrackAsmCommand(); break;
            case tok_verbose:       handleVerboseCommand(); break;
            case tok_quit:          std::cerr << "Exiting..." << std::endl; return 0;
            case tok_identifier:    handleFunctionInvocation(1); break;
            case tok_eof:           std::cerr << "CTRL+D or EOF reached." << std::endl; return -1;
            default:                std::cerr << "Unexpected token. Exiting..." << std::endl;; return 1;
        }
        if (TheHistory != nullptr) set_term(TheHistory);
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
        std::cerr << "[ERROR] Fatal error when creating IR source file \""
                  << fileName << "\"." << std::endl;
        exit(1);
    }

    std::cerr << "[MODULE] Press CTRL+D when you've entered all the code."
              << std::endl;

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
    std::cerr << "[MODULE] Module parsed and stored into \"" << fileName
              << "\"." << std::endl,
    fclose(out);

    std::unique_ptr<Module> M = TheHelper->createModuleFromFile(std::string(fileName));
    TheHelper->addModule(std::move(M));
    std::cerr << "[LOAD] The new module has been loaded." << std::endl;
}

void Parser::handleMapsCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for a MAPS command!" \
        << std::endl << "Enter HELP MAPS to display the right syntax." \
        << std::endl; return; } while(0)

    std::string *tmpStr = TheLexer->getLine();
    std::string LexerStr(std::move(*tmpStr));
    delete tmpStr;
    INIT_TOKENIZER(const_cast<char*>(LexerStr.c_str()));
    if (token == NULL) INVALID();

    // anonymous enum to encode actions
    enum { analyzeMap, showMaps, updateMap };
    int action;

    if (!strcasecmp(token, "SHOW")) {
        action = showMaps;
    } else if (!strcasecmp(token, "ANALYZE")) {
        action = analyzeMap;
    } else if (!strcasecmp(token, "UPDATE")) {
        action = updateMap;
    } else {
        INVALID();
    }

    if (action == showMaps) {
        TheHelper->showStateMaps();
        return;
    }

    // action is either updateMap or analyzeMap

    GET_TOKEN();
    const std::string F1Name(token);

    GET_TOKEN();
    const std::string F2Name(token);

    Function* F1 = TheHelper->getFunction(F1Name);
    if (F1 == nullptr) {
        std::cerr << "Unable to find function " << F1Name << "!" << std::endl;
        return;
    }

    Function* F2 = TheHelper->getFunction(F2Name);
    if (F2 == nullptr) {
        std::cerr << "Unable to find function " << F2Name << "!" << std::endl;
        return;
    }

    StateMap* M = TheHelper->getStateMap(F1, F2);
    if (M == nullptr) {
        std::cerr << "Could not find a StateMap for the two functions!"
                  << std::endl;
        return;
    }

    if (action == updateMap) {
        // process F1
        CodeMapper* CM_F1 = CodeMapper::getCodeMapper(*F1);
        if (CM_F1 == nullptr) {
            std::cerr << "Nothing to do for " << F1Name << "." << std::endl;
        } else {
            CM_F1->updateStateMapping(M, TheHelper->verbose);
            std::cerr << "StateMap updated to reflect changes in " << F1Name
                      << "." << std::endl;
        }

        // process F2
        CodeMapper* CM_F2 = CodeMapper::getCodeMapper(*F2);
        if (CM_F2 == nullptr) {
            std::cerr << "Nothing to do for " << F2Name << "." << std::endl;
        } else {
            CM_F2->updateStateMapping(M, TheHelper->verbose);
            std::cerr << "StateMap updated to reflect changes in " << F2Name
                      << "." << std::endl;
        }
    } else if (action == analyzeMap) {
        BuildComp::printStatistics(M, compCodeStrategy, TheHelper->verbose);
    }

    #undef INVALID

}

void Parser::handleOptCommand() {
    int token;
    #define EAT_LEXER_TOKENS() do { token = TheLexer->getNextToken(); } \
        while(token != tok_newline && token != tok_eof)
    #define INVALID() do { std::cerr << "Invalid syntax for an OPT command!" \
        << std::endl << "Enter HELP OPT to display the right syntax." \
        << std::endl; return; } while(0)

    token = TheLexer->getNextToken();
    if (token == tok_newline || token == tok_eof) INVALID();
    if (token != tok_identifier) {
        EAT_LEXER_TOKENS();
        INVALID();
    }

    const std::string Name = TheLexer->getIdentifier();
    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        std::cerr << "Unable to find function " << Name << "!" << std::endl;
        EAT_LEXER_TOKENS();
        return;
    }

    Module* M = F->getParent();
    if (!TheHelper->canModifyModule(M)) {
        std::cerr << "Cannot update a possibly already-JITted function!" << std::endl;
        EAT_LEXER_TOKENS();
        return;
    }

    token = TheLexer->getNextToken();
    if (token == tok_newline || token == tok_eof) {
        std::cerr << "At least one transformation should be specified!" << std::endl;
        return;
    }

    // create a CodeMapper for F
    if (CodeMapper::hasCodeMapper(*F)) {
        std::cerr << "WARNING: discarding CodeMapper from previous "
                  << "optimizations..." << std::endl;
        CodeMapper::removeCodeMapper(*F);
    }
    CodeMapper::createCodeMapper(*F);

    // create a FunctionPassManager with optimizations specified by the user
    FunctionPassManager FPM(M);

    do {
        if (token != tok_identifier) {
            EAT_LEXER_TOKENS();
            INVALID();
        }
        const std::string OptName = TheLexer->getIdentifier();
        const char* optName = OptName.c_str();

        if (!strcmp(optName, "ADCE")) {
            FPM.add(OSR_createAggressiveDCEPass());
        } else if (!strcasecmp(optName, "ConstProp")) {
            FPM.add(OSR_createConstantPropagationPass());
        } else if (!strcasecmp(optName, "DCE")) {
            FPM.add(OSR_createDeadCodeEliminationPass());
        } else if (!strcasecmp(optName, "EarlyCSE")) {
            FPM.add(OSR_createEarlyCSEPass());
        } else if (!strcasecmp(optName, "LCSSA")) {
            FPM.add(OSR_createLCSSAPass());
        } else if (!strcasecmp(optName, "LoopSimplify")) {
            FPM.add(OSR_createLoopSimplifyPass());
        } else if (!strcasecmp(optName, "LICM")) {
            FPM.add(OSR_createLICMPass());
        } else if (!strcasecmp(optName, "SCCP")) {
            FPM.add(OSR_createSCCPPass());
        } else if (!strcasecmp(optName, "Sink")) {
            FPM.add(OSR_createSinkingPass());
        } else {
            std::cerr << "Unknown \'" << OptName << "\' function pass!" << std::endl;
            EAT_LEXER_TOKENS();
            goto EXIT;
        }

        token = TheLexer->getNextToken();
    }
    while (token != tok_newline && token != tok_eof);

    if (TheHelper->verbose) OSR_Statistic::resetStats();

    FPM.doInitialization();
    FPM.run(*F);
    FPM.doFinalization();

    if (TheHelper->verbose) OSR_Statistic::printStats();

    EXIT: return;

    #undef INVALID
    #undef EAT_LEXER_TOKENS
}

void Parser::handleOldOptCommand(bool CFGSimplificationOnly) {
    if (TheLexer->getNextToken() != tok_identifier) {
        const std::string cmdName = (CFGSimplificationOnly) ? "OPT_FULL" : "OPT_CFG";
        std::cerr << "Invalid syntax for a " << cmdName << "command!" << std::endl
                  << "Expected command of the form: " << cmdName  << " <function_name"
                  << std::endl;
        return;
    }
    const std::string Name = TheLexer->getIdentifier();

    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        std::cerr << "Unable to find function " << Name << "!" << std::endl;
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
    #define INVALID() do { std::cerr << "Invalid syntax for a DUMP command!" \
            << std::endl << "Expected command of the form: DUMP <function_name>" \
            << std::endl; return; } while (0)

    std::string* tmp = TheLexer->getLine();
    if (tmp == nullptr) INVALID();
    else {
        // strip string first
        std::string::const_iterator b = tmp->begin(), e = tmp->end();
        while (std::isspace(*b)) ++b;
        if (b == e) INVALID();
        while (std::isspace(*(e-1))) --e;
        tmp->assign(b, e);
        if (tmp->size() < 2) INVALID(); // TODO check empty || containing spaces
    }
    std::string &Name = *tmp;

    if (TheLexer->getNextToken() != tok_identifier)
    const std::string Name = TheLexer->getIdentifier();
    #undef INVALID

    if (!showLineIDs) {
        std::vector<Module*> &Modules = TheHelper->getLoadedModules();
        for (Module* M: Modules) {
            std::cerr << M->getModuleIdentifier() << std::endl;
            if (M->getModuleIdentifier() == Name) {
                M->dump();
                return;
            }
        }
    }

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

    delete tmp;
}

void Parser::handleFunctionInvocation(int iterations) {
    // unknown commands are treated as function identifiers
    #define INVALID() do { std::cerr << \
        "Invalid syntax for a function invocation or unknown command!" \
        << std::endl; return; } while (0);
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


    int (*fun)() = TheHelper->createAnonFunctionForCall(FunctionName, Arguments);
    if (fun == nullptr) return;

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
    int token = TheLexer->getNextToken();

    if (token != tok_newline && token != tok_eof) {
        std::string CommandName = TheLexer->getIdentifier();
        const char* commandName = CommandName.c_str();
        if (!strcasecmp("COMP_CODE", commandName)) goto COMP_CODE;
        if (!strcasecmp("INSERT_OSR", commandName)) goto INSERT_OSR;
        if (!strcasecmp("MAPS", commandName)) goto MAPS;
        if (!strcasecmp("OPT", commandName)) goto OPT;
    }

    std::cerr << "List of available commands:" << std::endl;
    std::cerr << "--> BEGIN <module_name>" << std::endl
              << "\tType an IR module (from stdin). Press CTRL-D when finished."
              << std::endl;
    std::cerr << "--> CFG <function_name>" << std::endl
              << "\tShow a compact view of the CFG of a given function."
              << std::endl;
    std::cerr << "--> CFG_FULL <function_name>" << std::endl
              << "\tShow the CFG (with instructions) of a given function."
              << std::endl;
    std::cerr << "--> CLONE_FUN <function_name> AS <clone_name>" << std::endl
              << "\tClone a given function and generate a StateMap for the two "
              << "functions." << std::endl;
    std::cerr << "--> COMP_CODE [...]" << std::endl
              << "\tManipulate compensation code for OSR points." << std::endl
              << "\tEnter HELP COMP_CODE to find out more." << std::endl;
    std::cerr << "--> DUMP [<function_name> | <module_name>]" << std::endl
              << "\tShow the IR code of a given function or module."
              << std::endl;
    std::cerr << "--> INSERT_OSR [...]" << std::endl
              << "\tInsert an OSR point in a function." << std::endl
              << "\tEnter HELP INSERT_OSR to find out more." << std::endl;
    std::cerr << "--> LOAD_IR <file_name>" << std::endl
              << "\tLoad an IR module from a given file." << std::endl;
    std::cerr << "--> LOAD_LIB <file_name>" << std::endl
              << "\tLoad the dynamic library at the given path." << std::endl;
    std::cerr << "--> MAPS [...]" << std::endl
              << "\tManipulate StateMap objects." << std::endl
              << "\tEnter HELP MAPS to find out more." << std::endl;
    std::cerr << "--> OPT <function_name> { <opt1> ... } " << std::endl
              << "\tPerform optimization passes on a given function." << std::endl
              << "\tEnter HELP OPT to find out which optimizations are supported."
              << std::endl;
    std::cerr << "--> OPT_CFG <function_name>" << std::endl
              << "\tPerform a CFG simplification pass over a given function."
              << std::endl;
    std::cerr << "--> OPT_FULL <function_name>" << std::endl
              << "\tPerform several optimization passes over a given function."
              << std::endl;
    std::cerr << "--> REPEAT <iterations> <function call>" << std::endl
              << "\tPerform a function call (see next paragraph) repeatedly."
              << std::endl;
    std::cerr << "--> SHOW_ADDR <function_name>" << std::endl
              << "\tShow compiled-code address for a given function symbol."
              << std::endl;
    std::cerr << "--> SHOW_ASM" << std::endl
              << "\tShow logged x86-64 assembly code." << std::endl;
    std::cerr << "--> SHOW_FUNS" << std::endl
              << "\tShow function symbols tracked by MCJITHelper." << std::endl;
    std::cerr << "--> SHOW_LINE_IDS <function_name>" << std::endl
              << "\tShow by-line IR identifiers for a given function."
              << std::endl;
    std::cerr << "--> SHOW_MODS" << std::endl
              << "\tShow loaded modules and their symbols." << std::endl;
    std::cerr << "--> TRACK_ASM" << std::endl
              << "\tEnable/disable logging of generated x86-64 assembly code."
              << std::endl;
    std::cerr << "--> VERBOSE" << std::endl
              << "\tEnable/disable verbose mode." << std::endl;
    std::cerr << "--> QUIT" << std::endl << "\tExits TinyVM." << std::endl;

    // function invocation
    std::cerr << std::endl << "The TinyVM command line supports the invocation "
              << "of loaded functions. Functions can be invoked as in C, except "
              << "for the final semi-colon that must not be added." << std::endl
              << "For the time being, only functions with integer arguments and "
              << "return values are supported." << std::endl;

    #define SHOW_HELP_FOR_LOCATIONS() std::cerr << std::endl << \
        "Program locations can be expressed using an LLVM \'%name\' (including"\
        << " numerical IDs for anonymous values) or a line ID \'$i\' reported "\
        << "by SHOW_LINE_IDS. When a basic block is specified, its first "\
        << "non-PHI instruction is picked as location." << std::endl;

    goto EXIT;

    COMP_CODE:
    std::cerr << "Manipulate compensation code for OSR points:" << std::endl
              << "--> COMP_CODE <OP> FOR <F1> AT <P1> TO <F2> AT <P2>" << std::endl
              << "--> COMP_CODE <OP> FOR <F1> TO <F2>" << std::endl
              << "--> COMP_CODE STRATEGY [<NUM>]"
              << std::endl << std::endl << "where:" << std::endl
              << "\tOP is one of the following actions: CHECK, CAN_BUILD, "
              << "BUILD, SHOW, TEST" << std::endl
              << "\tF1 and F2 are existing functions" << std::endl
              << "\tP1 and P2 are locations in F1 and F2 respectively"
              << std::endl << std::endl;
    std::cerr << "COMP_CODE can CHECK whether a compensation code is required"
              << " to perform an OSR transition from P1 to P2, verify if OSRKit"
              << " CAN_BUILD it automatically and actually BUILD it. For "
              << "debugging purposes, COMP_CODE can SHOW a built compensation "
              << "code and also TEST if an OSR continuation funtion can be "
              << "successfully generated from it."
              << std::endl << std::endl;
    std::cerr << "When P1 and P2 are not specified, the required action is "
              << "performed on all the candidate OSR source locations in F1 "
              << "encoded in the StateMap."
              << std::endl;
    SHOW_HELP_FOR_LOCATIONS();
    std::cerr << std::endl
              << "Different strategies are available to build compensation code"
              << ". The STRATEGY option shows the available strategies and the "
              << "one currently in use, which can be changed by specifying a "
              << "strategy number as argument to STRATEGY."
              << std::endl;
    goto EXIT;

    INSERT_OSR:
    std::cerr << "OSR points can be inserted with one of the following commands:" << std::endl
              << "--> INSERT_OSR <PROB> <COND> OPEN UPDATE IN <F1> AT <P1> CLONE" << std::endl
              << "--> INSERT_OSR <PROB> <COND> OPEN COPY IN <F1> AT <P1> AS <F1'> CLONE" << std::endl
              << "--> INSERT_OSR <PROB> <COND> OPEN UPDATE IN <F1> AT <P1> DYN_INLINE <V1>" << std::endl
              << "--> INSERT_OSR <PROB> <COND> OPEN COPY IN <F1> AT <P1> AS <F1'> DYN_INLINE <V1>" << std::endl
              << "--> INSERT_OSR <PROB> <COND> SLVD UPDATE IN <F1> AT <P1> TO <F2> AT <P2> AS <F2'>" << std::endl
              << "--> INSERT_OSR <PROB> <COND> SLVD COPY IN <F1> AT <P1> AS <F1'> TO <F2> AT <P2> AS <F2'>" << std::endl
              << std::endl << "where:" << std::endl
              << "\tPROB is either -1 (no branch weight) or an integer in {0, ..., 100}" << std::endl
              << "\tCOND is either ALWAYS or NEVER" << std::endl
              << "\tF1 and F2 are existing functions" << std::endl
              << "\tP1 and P2 are locations in F1 and F2 respectively" << std::endl
              << "\tV1 is the target of one or more calls in F1" << std::endl;
    std::cerr << std::endl << "The command can either update F1 or generate a new function F1' cloning F1 "
              << "such that when P1 is reached during the execution, an OSR transition is fired." << std::endl;
    std::cerr << std::endl << "For OPEN transitions, a continuation function C is generated at run-time. "
              << std::endl << "In CLONE mode, C is generated by cloning and manipulating F1 to resume "
              << "the execution at P1. In DYN_INLINE mode, C is generated as in clone mode, then a "
              << "dynamic inliner attempts to inline calls whose target is contained in V1." << std::endl;
    std::cerr << std::endl << "For SLVD transitions, a continuation function F2' is statically "
                 "generated from F2 to resume the execution at P2." << std::endl;
    SHOW_HELP_FOR_LOCATIONS();
    goto EXIT;

    MAPS:
    std::cerr << "Manipulate StateMap objects:" << std::endl
              << "--> MAPS SHOW" << std::endl
              << "--> MAPS ANALYZE <F1> <F2>" << std::endl
              << "--> MAPS UPDATE <F1> <F2>"
              << std::endl << std::endl;
    std::cerr << "MAPS can SHOW all the available StateMap objects, and for a "
              << "specific StateMap on functions F1 and F2 it can either "
              << "ANALYZE it to show which pairs of locations are feasible for "
              << "OSR, or UPDATE it to reflect changes made to the functions "
              << "using the OPT command." << std::endl;
    goto EXIT;

    OPT:
    std::cerr << "Syntax:" << std::endl
              << "    OPT <function_name> { <opt1> <opt2> ... << <optN> }"
              << std::endl << std::endl;
    std::cerr << "List of OSR-compatible implemented function passes:" << std::endl;
    std::cerr << "--> ADCE" << std::endl
              << "\tAggressive dead code elimination (assume dead unless proved otherwise)."
              << std::endl;
    std::cerr << "--> ConstProp" << std::endl
              << "\tSimple constant propagation (for instructions with constant operands)."
              << std::endl;
    std::cerr << "--> DCE" << std::endl
              << "\tDead code elimination." << std::endl;
    std::cerr << "--> EarlyCSE" << std::endl
              << "\tRemove trivially redundant instructions with a dominator tree walk."
              << std::endl;
    std::cerr << "--> LCSSA" << std::endl
              << "\tTransform loops into loop-closed SSA form." << std::endl;
    std::cerr << "--> LICM" << std::endl
              << "\tLoop-invariant code motion (hoist & sink)."
              << std::endl;
    std::cerr << "--> LoopSimplify" << std::endl
              << "\tCanonicalize natural loops." << std::endl;
    std::cerr << "--> SCCP" << std::endl
              << "\tSparse conditional constant propagation." << std::endl;
    std::cerr << "--> Sink" << std::endl
              << "\tSink instructions into successor blocks." << std::endl;
    goto EXIT;

    #undef SHOW_HELP_FOR_LOCATIONS

    EXIT: return;
}

void Parser::openOSRHelper(Function* src, Instruction* OSRSrc, bool update,
        std::string* F1NewName, OSRLibrary::OSRCond &cond, int branchTakenProb,
        bool dynInline, Value* valToDynInline) {
    bool verbose = TheHelper->verbose;
    OSRLibrary::DestFunGenerator generator;
    Value* profDataVal;
    void* extra;

    if (dynInline) {
        generator = MCJITHelper::dynamicInlinerForOpenOSR;
        profDataVal = valToDynInline;
        MCJITHelper::DynamicInlinerInfo* extraInfo = new MCJITHelper::DynamicInlinerInfo();
        extraInfo->TheHelper = TheHelper;
        extraInfo->valToInline = valToDynInline;
        extra = (void*)extraInfo;
    } else {
        generator = MCJITHelper::identityGeneratorForOpenOSR;
        profDataVal = nullptr;
        extra = TheHelper;
    }

    // (verbose, updateF1, branchTakenProb, nameForNewF1, modForNewF1, ptrForF1NewToF1Map, nameForNewF2, nameForNewF2, ptrForF2NewToF2Map)
    StateMap* F1NewToF1Map;

    Module* modToUse = src->getParent();
    std::unique_ptr<Module> NewModule;

    bool needNewModule = !TheHelper->canModifyModule(modToUse);
    if (needNewModule) {
        if (update) {
            std::cerr << "ERROR: Cannot update a possibly already JIT-ted function!" << std::endl;
            return;
        } else {
            if (verbose) {
                std::cerr << "Creating a new module as F1 has possibly already been JIT-ted..." << std::endl;
            }
            NewModule = llvm::make_unique<Module>("OSRMod", TheHelper->Context);
            modToUse = NewModule.get();
        }
    } else if (verbose) {
        std::cerr << "Inserting new code in the same module of the source function..." << std::endl;
    }

    OSRLibrary::OSRPointConfig config(verbose, update, branchTakenProb,
            F1NewName, modToUse, &F1NewToF1Map, nullptr, nullptr, nullptr);
    LivenessAnalysis LA(src);

    OSRLibrary::OSRPair pair = OSRLibrary::insertOpenOSR(TheHelper->Context, *src,
        *OSRSrc, extra, cond, profDataVal, generator, nullptr, &LA, config);

    std::cerr << "insertOpenOSR succeded!" << std::endl;

    Function *src_new = pair.first, *stub = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << stub->getName().str() << std::endl;

    if (needNewModule) {
        TheHelper->addModule(std::move(NewModule));
    } else {
        if (!update) {
            TheHelper->registerFunction(src_new);
        }
        TheHelper->registerFunction(stub);
        TheHelper->trackAsmCodeUtil(modToUse);
    }

    if (!update) {
        TheHelper->registerStateMap(src, src_new, F1NewToF1Map);
    }
}

void Parser::resolvedOSRHelper(Function* src, Instruction* OSRSrc, bool update,
        std::string* F1NewName, const std::string* F2Name,
        const std::string* LPadName, std::string* F2NewName,
        OSRLibrary::OSRCond &cond, int branchTakenProb) {

    Function* dest = nullptr;
    StateMap* M = nullptr;
    bool identityMapping = true;

    if (*F2Name == src->getName().str()) {
        if (TheHelper->verbose) {
            std::cerr << "Cloning " << *F2Name << " and generating a StateMap..."
                      << std::endl;
        }
        std::pair<Function*, StateMap*> tmpMapPair = StateMap::generateIdentityMapping(src);
        M = tmpMapPair.second;
        dest = tmpMapPair.first;
    } else {
        identityMapping = false;
        dest = TheHelper->getFunction(*F2Name);
        if (dest == nullptr) {
            std::cerr << "Unable to find function " << *F2Name << "!" << std::endl;
            return;
        }
        M = TheHelper->getStateMap(src, dest);
        if (M == nullptr) {
            std::cerr << "Could not find a StateMap for the two functions!" << std::endl;
            return;
        }
    }

    #define FREEOBJS() do { if (identityMapping) { delete M; delete dest; } } while(0)

    Instruction* LPad = const_cast<Instruction*>(getOSRLocationFromStrIDs(*dest, *LPadName));
    if (LPad == nullptr) {
        FREEOBJS();
        return;
    } else {
        Instruction* LPadFromStateMap = M->getLandingPad(OSRSrc);
        if (LPadFromStateMap == nullptr) {
            std::cerr << "No known feasible LPad for the given OSRSrc!" << std::endl;
            // this should be dead code as it wouldn't happen when src is cloned
            FREEOBJS();
        } else if (LPad != LPadFromStateMap) {
            std::cerr << "Invalid landing pad! According to the StateMap, the "
                      << "LPad to use is:" << std::endl;
            LPadFromStateMap->dump();
            FREEOBJS();
            return;
        }
    }

    // (verbose, updateF1, branchTakenProb, nameForNewF1, modForNewF1,
    // ptrForF1NewToF1Map, nameForNewF2, nameForNewF2, ptrForF2NewToF2Map)
    StateMap* F1NewToF1Map;
    StateMap* F2NewToF2Map;

    Module *modForNewSrc = src->getParent();
    Module *modForNewDest = dest->getParent();
    std::unique_ptr<Module> NewModule;

    bool needNewModuleForNewSrc = !TheHelper->canModifyModule(modForNewSrc);
    if (needNewModuleForNewSrc) {
        if (update) {
            std::cerr << "Cannot update a possibly already-JITted function!" << std::endl;
            return;
        } else {
            if (TheHelper->verbose) {
                std::cerr << "Creating a new module as F1 has possibly already been JIT-ted..." << std::endl;
            }
            NewModule = llvm::make_unique<Module>("OSRMod", TheHelper->Context);
            modForNewSrc = NewModule.get();
        }
    }

    bool needNewModuleForNewDest = (modForNewDest == nullptr) ? true
            : !TheHelper->canModifyModule(modForNewDest);
    if (needNewModuleForNewDest) {
        if (!needNewModuleForNewSrc) {
            if (TheHelper->verbose) {
                std::cerr << "Creating a new module for the OSR continuation function..." << std::endl;
            }
            NewModule = llvm::make_unique<Module>("OSRMod", TheHelper->Context);
        }
        modForNewDest = NewModule.get();
    }

    if (identityMapping) {
        // put dest into a module and fix references to symbols
        modForNewDest->getFunctionList().push_back(dest);
        bool usesFixedInDest = OSRLibrary::fixUsesOfFunctionsAndGlobals(src, dest);
        if (usesFixedInDest && TheHelper->verbose) {
            std::cerr << "Creating declarations to update references to globals and functions..."
                      << std::endl;
        }
    }

    OSRLibrary::OSRPointConfig config(TheHelper->verbose, update, branchTakenProb,
            F1NewName, modForNewSrc, &F1NewToF1Map, F2NewName, modForNewDest, &F2NewToF2Map);

    OSRLibrary::OSRPair pair = OSRLibrary::insertResolvedOSR(TheHelper->Context, *src, *OSRSrc,
            *dest, *LPad, cond, *M, config);

    std::cerr << "insertResolvedOSR succeded!" << std::endl;

    Function *src_new = pair.first, *dest_new = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << dest_new->getName().str() << std::endl;

    if (identityMapping) {
        dest->removeFromParent();
    }

    if (needNewModuleForNewSrc) {
        TheHelper->addModule(std::move(NewModule));
    } else {
        if (!update) {
            TheHelper->registerFunction(src_new);
        }
        TheHelper->registerFunction(dest_new);
        TheHelper->trackAsmCodeUtil(modForNewSrc);
    }

    if (needNewModuleForNewDest) {
        if (!needNewModuleForNewSrc) {
            TheHelper->addModule(std::move(NewModule));
        }
    }

    FREEOBJS();
    if (!update) {
        TheHelper->registerStateMap(src, src_new, F1NewToF1Map);
    }
    if (identityMapping) {
        delete F2NewToF2Map;
    } else {
        TheHelper->registerStateMap(dest, dest_new, F2NewToF2Map);
    }

    #undef FREEOBJS
}

void Parser::handleInsertOSRCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for an INSERT_OSR command!" << std::endl\
            << "Error at argument " << numToken << ". Enter HELP OSR to display the right syntax." << std::endl;\
            return; } while (0);

    std::string *tmpStr = TheLexer->getLine();
    std::string LexerStr(std::move(*tmpStr));
    delete tmpStr;
    INIT_TOKENIZER(const_cast<char*>(LexerStr.c_str()));
    if (token == NULL) INVALID();

    int branchTakenProb = (int)strtol(token, NULL, 10);
    if (branchTakenProb != -1 && (branchTakenProb < 0 || branchTakenProb > 100)) INVALID();

    GET_TOKEN();
    OSRLibrary::OSRCond cond;
    if (!strcasecmp(token, "ALWAYS")) {
        cond.push_back(TheHelper->generateAlwaysTrueCond());
    } else if (!strcasecmp(token, "NEVER")) {
        cond.push_back(TheHelper->generateAlwaysFalseCond());
    } else {
        INVALID();
    }

    bool open = false;
    GET_TOKEN();
    if (!strcasecmp(token, "OPEN")) {
        open = true;
    } else if (strcasecmp(token, "SLVD")) {
        INVALID();
    }

    bool update = false;
    GET_TOKEN();
    if (!strcasecmp(token, "UPDATE")) {
        update = true;
    } else if (strcasecmp(token, "COPY")) {
        INVALID();
    }

    GET_TOKEN();
    if (strcasecmp(token, "IN")) INVALID();

    GET_TOKEN();
    const std::string F1Name(token);

    GET_TOKEN();
    if (strcasecmp(token, "AT")) INVALID();

    GET_TOKEN();
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
        GET_TOKEN();
        if (strcasecmp(token, "AS")) INVALID();

        GET_TOKEN();
        F1NewName = std::string(token);
    }

    std::string* tmpForF1NewName = (update) ? nullptr : &F1NewName;

    if (open) {
        bool dynInline = false;
        Value* valToInline = nullptr;

        GET_TOKEN();
        if (!strcasecmp(token, "DYN_INLINE")) {
            dynInline = true;
        } else if (strcasecmp(token, "CLONE")) {
            INVALID();
        }

        if (dynInline) {
            GET_TOKEN();
            std::string V1Name = std::string(token);
            IDToValueVec slotIDs = computeSlotIDs(src);
            valToInline = const_cast<Value*>(
                    getValueFromStrID(*src, V1Name, &slotIDs, nullptr));
            if (valToInline == nullptr) return;
        }

        openOSRHelper(src, OSRSrc, update, tmpForF1NewName, cond, branchTakenProb, dynInline, valToInline);
        return;
    }

    GET_TOKEN();
    if (strcasecmp(token, "TO")) INVALID();

    GET_TOKEN();
    const std::string F2Name(token);

    GET_TOKEN();
    if (strcasecmp(token, "AT")) INVALID();

    GET_TOKEN();
    const std::string P2Name(token);

    GET_TOKEN();
    if (strcasecmp(token, "AS")) INVALID();

    GET_TOKEN();
    const std::string F2NewName(token);

    resolvedOSRHelper(src, OSRSrc, update, tmpForF1NewName, &F2Name, &P2Name,
            const_cast<std::string*>(&F2NewName), cond, branchTakenProb);

    #undef INVALID
}

void Parser::handleCloneFunCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for a CLONE_FUN command!" \
            << std::endl << "Error at argument " << numToken \
            << ". Enter HELP to display the right syntax." << std::endl;\
            return; } while (0);

    std::string *tmpStr = TheLexer->getLine();
    std::string LexerStr(std::move(*tmpStr));
    delete tmpStr;
    INIT_TOKENIZER(const_cast<char*>(LexerStr.c_str()));
    if (token == NULL) INVALID();

    const std::string FunName(token);
    Function* src = TheHelper->getFunction(FunName);
    if (src == nullptr) {
        std::cerr << "Unable to find function " << FunName << "!" << std::endl;
        return;
    }

    GET_TOKEN();
    if (strcasecmp(token, "AS")) INVALID();

    GET_TOKEN();
    std::string NewName(token);

    if (TheHelper->getFunction(NewName) != nullptr) {
        std::cerr << "ERROR: function " << NewName << "  already exists!" << std::endl;
        return;
    }

    #undef INVALID

    // clone function and generate a StateMap for the two functions
    std::pair<Function*, StateMap*> tmpMapPair = StateMap::generateIdentityMapping(src);
    StateMap* M = tmpMapPair.second;
    Function *clonedFun = tmpMapPair.first;
    clonedFun->setName(NewName);

    // put the cloned function in a new module and add declarations for symbols
    std::unique_ptr<Module> NewModule = llvm::make_unique<Module>("CloneMod", TheHelper->Context);
    NewModule->getFunctionList().push_back(clonedFun);
    bool usesFixed = OSRLibrary::fixUsesOfFunctionsAndGlobals(src, clonedFun);
    if (usesFixed && TheHelper->verbose) {
        std::cerr << "Added declarations for referenced globals/functions." << std::endl;
    }

    // load module and register StateMap
    TheHelper->addModule(std::move(NewModule));
    TheHelper->registerStateMap(src, clonedFun, M);
}

std::string Parser::getInstrID(Instruction* I, Parser::IDToValueVec &slotIDs,
        Parser::IDToValueVec &lineIDs) {

    std::string InstName = "%";

    assert(I->getParent() != nullptr && I->getParent()->getParent() != nullptr);

    if (I->hasName()) {
        InstName += I->getName().str();
    } else {
        int index, numIndexes;

        for (index = 0, numIndexes = slotIDs.size(); index < numIndexes &&
                slotIDs[index] != I; ++index);

        if (index != numIndexes) {
            InstName += std::to_string(index);
        } else {
            for (index = 0, numIndexes = lineIDs.size(); index < numIndexes &&
                    lineIDs[index] != I; ++index);
            if (index == numIndexes) {
                std::cerr << "-------> WHD <--------" << std::endl;
                I->dump();
            }
            //assert(index != numIndexes && "instruction from another function?");
            InstName = "$";
            InstName += std::to_string(++index); // offset by 1
        }
    }

    return InstName;
}

void Parser::handleCompCodeCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for an COMP_CODE command!" << std::endl\
            << "Error at argument " << numToken << ". Enter HELP COMP_CODE to display the right syntax." << std::endl;\
            return; } while (0);

    bool verbose = TheHelper->verbose;

    std::string *tmpStr = TheLexer->getLine();
    std::string LexerStr(std::move(*tmpStr));
    delete tmpStr;
    INIT_TOKENIZER(const_cast<char*>(LexerStr.c_str()));
    if (token == NULL) INVALID();

    // anonymous enum to encode actions
    enum {
        buildCode, canBuildCode, checkCodeRequired, testCode, showCode, strategy
    };
    int action;

    if (!strcasecmp(token, "BUILD")) {
        action = buildCode;
    } else if (!strcasecmp(token, "CAN_BUILD")) {
        action = canBuildCode;
    } else if (!strcasecmp(token, "CHECK")) {
        action = checkCodeRequired;
    } else if (!strcasecmp(token, "TEST")) {
        action = testCode;
    } else if (!strcasecmp(token, "SHOW")) {
        action = showCode;
    } else if (!strcasecmp(token, "STRATEGY")) {
        action = strategy;
    } else {
        INVALID();
    }


    if (action == strategy) {
        GET_TOKEN_OR_NULL();
        if (token == NULL) {
            std::cerr << "Available strategies:" << std::endl;
            std::cerr << "(0) Base version of buildComp" << std::endl;
            std::cerr << "(1) Extend liveness range of values" << std::endl;
            std::cerr << "Strategy in use: " << compCodeStrategy << std::endl;
        } else {
            int strategy = atoi(token);
            switch (strategy) {
                case 0:     compCodeStrategy = BuildComp::Heuristic::BC_NONE;
                            break;
                case 1:     compCodeStrategy = BuildComp::Heuristic::BC_EXTEND_LIVENESS;
                            break;
                default:    std::cerr << "Unknown strategy number!" << std::endl;
                            return;
            }
            std::cerr << "Strategy currently in use changed to " << strategy
                      << std::endl;
        }
        return;
    }

    std::string P1Name, P2Name;
    bool forAllPairs = false;

    GET_TOKEN();
    if (strcasecmp(token, "FOR")) INVALID();

    GET_TOKEN();
    const std::string F1Name(token);

    GET_TOKEN();
    if (!strcasecmp(token, "TO")) {
        forAllPairs = true;
    } else if (strcasecmp(token, "AT")) {
        INVALID();
    }

    if (!forAllPairs) {
        GET_TOKEN();
        P1Name = token;

        GET_TOKEN();
        if (strcasecmp(token, "TO")) INVALID();
    }

    GET_TOKEN();
    const std::string F2Name(token);

    if (!forAllPairs)  {
        GET_TOKEN();
        if (strcasecmp(token, "AT")) INVALID();

        GET_TOKEN();
        P2Name = token;
    }

    // TODO trailing tokens?

    // now process parsed arguments
    Instruction* OSRSrc = nullptr;
    Instruction* LPad = nullptr;
    std::vector<StateMap::LocPair> workList;

    Function* src = TheHelper->getFunction(F1Name);
    if (src == nullptr) {
        std::cerr << "Unable to find function " << F1Name << "!" << std::endl;
        return;
    }

    if (!forAllPairs) {
        OSRSrc = const_cast<Instruction*>(getOSRLocationFromStrIDs(*src, P1Name));
        if (OSRSrc == nullptr) return;
    }

    Function* dest = TheHelper->getFunction(F2Name);
    if (dest == nullptr) {
        std::cerr << "Unable to find function " << F2Name << "!" << std::endl;
        return;
    }

    if (!forAllPairs) {
        LPad = const_cast<Instruction*>(getOSRLocationFromStrIDs(*dest, P2Name));
        if (LPad == nullptr) return;
        workList.push_back(StateMap::LocPair(OSRSrc, LPad));
    }


    StateMap* M = TheHelper->getStateMap(src, dest);

    if (M == nullptr) {
        std::cerr << "Unable to find a StateMap for " << F1Name << ", "
                  << F2Name << std::endl;
    } else if (forAllPairs) {
        StateMap::LocMap &landingPads = M->getAllLandingPads();
        for (StateMap::LocMap::iterator it = landingPads.begin(),
                end = landingPads.end(); it != end; ++it) {
            if (it->first->getParent()->getParent() == src) {
                workList.push_back(StateMap::LocPair(it->first, it->second));
            }
        }
    } else {
        Instruction* LPadFromStateMap = M->getLandingPad(OSRSrc);
        if (LPadFromStateMap == nullptr) {
            std::cerr << "No known feasible LPad for the given OSRSrc!" << std::endl;
            return;
        } else if (LPad != LPadFromStateMap) {
            std::cerr << "Invalid landing pad! According to the StateMap, the "
                      << "LPad to use is:" << std::endl;
            LPadFromStateMap->dump();
            return;
        }
    }

    // this is required to print info about unnamed instructions
    IDToValueVec slotIDsForSrc = computeSlotIDs(src);
    IDToValueVec slotIDsForDest = computeSlotIDs(dest);
    IDToValueVec lineIDsForSrc = computeLineIDs(src);
    IDToValueVec lineIDsForDest = computeLineIDs(dest);

    std::string OSRSrcName, LPadName;
    std::set<Value*> missingSet;
    std::set<Value*> keepSet;
    std::vector<std::pair<StateMap::CompCode*, Value*>> compCodeWorkList;

    int noCompCodeRequired = 0;
    int compCodeRequired = 0;
    int canBuildCompCode = 0;

    BuildComp::AnalysisData* BCAD = nullptr;
    if (action == canBuildCode || action == buildCode || action == testCode) {
        BCAD = new BuildComp::AnalysisData(src);
    }

    for (int i = 0, e = workList.size(); i != e; ++i) {
        OSRSrc = workList[i].first;
        LPad = workList[i].second;

        // print info about the LocPair being processed
        OSRSrcName = getInstrID(OSRSrc, slotIDsForSrc, lineIDsForSrc);
        LPadName = getInstrID(LPad, slotIDsForDest, lineIDsForDest);


        if (forAllPairs && verbose) {
            std::cerr << "--> <" << OSRSrcName << ", " << LPadName << ">"
                      << std::endl;
        }

        // all the actions require isBuildCompRequired()
        missingSet.clear();
        bool isCompRequired = BuildComp::isBuildCompRequired(M, OSRSrc, LPad,
                missingSet, verbose);
        if (!isCompRequired) {
            if (verbose || !forAllPairs) {
                std::cerr << "No compensation code is required." << std::endl;
            }
            ++noCompCodeRequired;
            //if (action != testCode) continue;
            continue;
        } else {
            ++compCodeRequired;
        }

        if (action == checkCodeRequired) {
            if (forAllPairs && !verbose) continue;
            std::cerr << "Compensation code is required to reconstruct:"
                      << std::endl;
            for (Value* v: missingSet) {
                v->dump();
            }
        } else if (action == buildCode || action == canBuildCode) {
            bool doBuild = (action == buildCode);
            keepSet.clear();
            bool ret = BuildComp::buildComp(M, OSRSrc, LPad, keepSet,
                    compCodeStrategy, BCAD, doBuild, verbose);
            if (ret) {
                ++canBuildCompCode;
            }
            if (forAllPairs && !verbose) continue;
            if (ret) {
                if (doBuild) {
                    std::cerr << "Compensation code built successfully." << std::endl;
                } else {
                    std::cerr << "OSRKit can build the required compensation code."
                              << std::endl;
                }
            } else {
                std::cerr << "Compensation code cannot be built automatically, "
                          << "as the following values cannot be reconstructed:"
                          << std::endl;
                for (Value* v: keepSet) {
                    v->dump();
                }
            }
        } else if (action == testCode) {
            keepSet.clear();
            bool ret = BuildComp::buildComp(M, OSRSrc, LPad, keepSet,
                    compCodeStrategy, BCAD, true, verbose);

            if (!ret) {
                if (verbose || !forAllPairs) {
                    std::cerr << "Compensation code cannot be built automatically, "
                              << "as the following values cannot be reconstructed:"
                              << std::endl;
                    for (Value* v: keepSet) {
                        v->dump();
                    }
                }
                continue;
            }

            ++canBuildCompCode;

            std::unique_ptr<Module> NewModule =
                    llvm::make_unique<Module>("CompCodeMod", TheHelper->Context);
            Module* modToUse = NewModule.get();
            std::string F1NewName = src->getName().str();

            OSRLibrary::OSRPointConfig config(verbose, false, -1,
                    &F1NewName, modToUse, nullptr, nullptr, modToUse, nullptr);
            OSRLibrary::OSRCond condOSR = {  TheHelper->generateAlwaysTrueCond() };

            OSRLibrary::OSRPair pairOSR = OSRLibrary::insertResolvedOSR(
                    TheHelper->Context, *src, *OSRSrc, *dest, *LPad, condOSR,
                    *M, config);

            if (forAllPairs && !verbose) continue;

            std::cerr << "A temporary continuation function was successfully "
                      << "generated. Here's its entrypoint:" << std::endl;
            pairOSR.second->begin()->dump();
        } else if (action == showCode) {
            compCodeWorkList.clear();
            StateMap::LocPair LP(OSRSrc, LPad);
            StateMap::LocPairInfo* LPInfo = M->getLocPairInfo(LP);
            if (LPInfo == nullptr) {
                std::cerr << "Compensation code has not been generated yet!"
                          << std::endl;
                continue;
            }

            if (LPInfo->globalCompCode != nullptr) {
                compCodeWorkList.push_back(std::pair<StateMap::CompCode*,
                        Value*>(LPInfo->globalCompCode, nullptr));
            }

            for (StateMap::LocPairInfo::ValueInfoMap::iterator it =
                    LPInfo->valueInfoMap.begin(), end = LPInfo->valueInfoMap.end();
                    it != end; ++it) {
                Value* valToSet = it->first;
                if (it->second->isOneToOneValue()) {
                    std::cerr << "Value to set at LPad: ";
                    valToSet->dump();
                    std::cerr << "Value to fetch (pair-specific): ";
                    it->second->oneToOneValue->dump();
                } else {
                    compCodeWorkList.push_back(std::pair<StateMap::CompCode*,
                        Value*>(it->second->compCode, valToSet));
                }
            }

            for (const std::pair<StateMap::CompCode*, Value*> &compCodePair:
                    compCodeWorkList) {
                const StateMap::CompCode* compCode = compCodePair.first;
                if (compCodePair.second == nullptr) {
                    std::cerr << "Global compensation code" << std::endl;
                } else {
                    std::cerr << "Compensation code" << std::endl;
                    std::cerr << "Value to set at LPad: ";
                    compCodePair.second->dump();
                }
                std::cerr << "Arguments for the compensation code:";
                if (compCode->args->size() == 0) {
                    std::cerr << "No arguments." << std::endl;
                } else {
                    for (StateMap::CompCodeArgs::iterator it = compCode->args->begin(),
                            end = compCode->args->end(); it != end; ++it) {
                        (*it)->dump();
                    }
                }
                std::cerr << "Instructions to execute:" << std::endl;
                for (StateMap::CodeSequence::iterator it = compCode->code->begin(),
                        end = compCode->code->end(); it != end; ++it) {
                    (*it)->dump();
                }
            }
        }
    }

    if (forAllPairs) {
        std::cerr << "[OSR] " << src->getName().str() << " --> "
                  << dest->getName().str() << std::endl;
        std::cerr << "# of OSRSrc locations for which" << std::endl;
        std::cerr << "- no compensation code is required: " <<
                noCompCodeRequired << std::endl;
        std::cerr << "- compensation code is required: "
                  << compCodeRequired << std::endl;
        if (action == buildCode || action == canBuildCode || action == testCode) {
            std::cerr << "- compensation code can be built automatically: "
                      << canBuildCompCode << std::endl;
        }
    }

    if (BCAD) delete BCAD;

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
    M->setModuleIdentifier(basename(const_cast<char*>(fileName)));
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

    // we do not rely on MCJIT's getSymbolAddress/getFunctionAddress
    std::vector<uint64_t> addresses = TheHelper->getCompiledFuncAddr(FunctionName);
    if (addresses.empty()) {
        std::cerr << "Cannot locate compiled code for the given function symbol!" << std::endl;
    } else if (addresses.size() == 1) {
        std::cerr << "Compiled code available at address " << (void*)addresses.front() << std::endl;
    } else {
        std::cerr << "Multiple addresses available. Reporting them in most recently compiled order:" << std::endl;
        for (uint64_t addr: addresses) {
            std::cerr << (void*)addr << " ";
        }
        std::cerr << std::endl;
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
    if (TheHelper->verbose) {
        std::cerr << "Current status: verbose mode enabled. Now disabling it!" << std::endl;
    } else {
        std::cerr << "Current status: verbose mode disabled. Now enabling it!" << std::endl;
    }
    TheHelper->verbose = !TheHelper->verbose;
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

const Value* Parser::getValueFromStrID(Function &F, std::string &StrID,
        Parser::IDToValueVec *slotIDs, Parser::IDToValueVec *lineIDs) {
    int length = StrID.length();
    if (length < 2) return nullptr;

    bool isLineNumber = false;

    if (StrID[0] == '$') isLineNumber = true;
    else if (StrID[0] != '%') return nullptr;

    std::string::const_iterator it = ++StrID.begin(); // skip first char
    while (it != StrID.end() && std::isdigit(*it)) ++it;
    bool isNumber = (it == StrID.end());

    // line number
    if (isLineNumber) {
        if (!isNumber || !lineIDs) return nullptr;
        int ID = (int)strtol(StrID.c_str()+1, NULL, 10);

        if (ID == 0 || ID > lineIDs->size()) return nullptr;
        return (*lineIDs)[ID-1];
    }

    // anonymous LLVM Value
    if (isNumber) {
        if (!slotIDs) return nullptr;
        int ID = (int)strtol(StrID.c_str()+1, NULL, 10);
        if (ID >= slotIDs->size()) return nullptr;
        return (*slotIDs)[ID];
    }

    // named LLVM Value
    std::string name = StrID.substr(1, length - 1);
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

    const Value* v = getValueFromStrID(F, const_cast<std::string&>(LocID), &slotIDs, &lineIDs);
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
