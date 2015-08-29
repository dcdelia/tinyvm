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

#include <cstdio>
#include <cstring>
#include <iostream>
#include <strings.h> // strcasecmp()
#include <unistd.h> // access()

using namespace llvm;

void Parser::start() {
    std::cerr << "Welcome! Enter 'HELP' to show the list of available commands." << std::endl;

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
            case tok_dump:          handleDumpCommand(); break;
            case tok_repeat:        handleRepeatCommand(); break;
            case tok_track_asm:     handleTrackAsmCommand(); break;
            case tok_show_asm:      TheHelper->showTrackedAsm(); break;
            case tok_show_mods:     TheHelper->showModules(); break;
            case tok_show_funs:     TheHelper->showFunctions(); break;
            case tok_load_lib:      handleLoadLibCommand(); break;
            case tok_opt_cfg:       handleOptCommand(true); break;
            case tok_opt_full:      handleOptCommand(false); break;
            case tok_quit:          std::cerr << "Exiting..." << std::endl; return;
            case tok_identifier:    handleFunctionInvocation(1); break;
            case tok_eof:           std::cerr << "CTRL+D or EOF reached." << std::endl; return;
            default:                std::cerr << "Unexpected token. Exiting..." << std::endl;; return;
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
    delete curLine;
    std::cerr << "[MODULE] Module parsed and stored into \"" << fileName << "\"." << std::endl,
    fclose(out);

    std::unique_ptr<Module> M = TheHelper->createModuleFromFile(std::string(fileName));
    TheHelper->addModule(std::move(M), false);
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

void Parser::handleDumpCommand() {
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

        timer_start(&timer);
        for (i = 0; i < iterations; ++i) {
            result = fun();
        }
        timer_end(&timer);

        timer_print_elapsed(&timer);
        timer_print_avg(&timer, iterations);
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
    std::cerr << "--> SHOW_ASM" << std::endl << "\tShow logged x86-64 assembly code." << std::endl;
    std::cerr << "--> SHOW_MODS" << std::endl << "\tShow loaded modules and their symbols." << std::endl;
    std::cerr << "--> QUIT" << std::endl << "\tExits TinyVM." << std::endl;

    // function invocation
    std::cerr << std::endl << "The TinyVM command line supports the invocation of loaded functions. "
              << "Functions can be invoked as in C, except for the final semi-colon that must not be added." << std::endl
              << "For the time being, only functions with integer arguments and return values are supported." << std::endl;

    // demo insert_osr (finalized)
    std::cerr << std::endl << "Demo OSR points can be inserted with one of the following commands:" << std::endl
              << "INSERT_OSR <COND> OPEN UPDATE IN <F1> AT <B1>" << std::endl
              << "INSERT_OSR <COND> OPEN COPY IN <F1> AT <B1> AS <F1'>" << std::endl
              << "INSERT_OSR <COND> FINAL UPDATE IN <F1> AT <B1> TO <F2> at <B2> as <F2'>" << std::endl
              << "INSERT_OSR <COND> FINAL COPY IN <F1> AT <B1> AS <F1'> TO <F2> at <B2> as <F2'>" << std::endl
              << std::endl << "where:" << std::endl << "\tCOND is either ALWAYS or NEVER" << std::endl
              << "\tF1 and F2 are existing functions" << std::endl
              << "\tB1 and B2 are basic block labels in F1 and F2" << std::endl;
    std::cerr << std::endl << "The command either updates F1 or generates a function F1' cloned from F1 "
              << "such that when basic block B1 is reached during the execution, an OSR transition is fired. "
              << "For OPEN transitions, the continuation function will be generated at run-time. "
              << "For FINAL transitions, function F2' is generated from F2 in order to resume the execution from the "
              << "beginning of basic block B2." << std::endl;
}

void Parser::openOSRHelper(Function* src, BasicBlock* src_bb, bool update,
        std::string* F1NewName, OSRLibrary::OSRCond &cond) {
    OSRLibrary::OpenOSRInfo info;
    info.f1 = src;
    info.b1 = src_bb;
    MCJITHelper::MCJITHelperOSRInfo* extra = new MCJITHelper::MCJITHelperOSRInfo();
    extra->TheHelper = TheHelper;
    info.extra = extra;

    std::cerr << "Value for info.f1 is " << info.f1 << std::endl;
    std::cerr << "Value for info.b1 is " << info.b1 << std::endl;
    std::cerr << "Value for info.extra is " << info.extra << std::endl;

    OSRLibrary::DestFunGenerator generator = MCJITHelper::identityGeneratorForOpenOSR;

    // (verbose, updateF1, nameForNewF1, modForNewF1, ptrForF1NewToF1Map, nameForNewF2, nameForNewF2, ptrForF2NewToF2Map)
    StateMap* F1NewToF1Map;
    OSRLibrary::OSRPointConfig config(false, update, F1NewName, src->getParent(), &F1NewToF1Map, nullptr, nullptr, nullptr);

    OSRLibrary::OSRPair pair = OSRLibrary::insertOpenOSR(TheHelper->Context, info,
        cond, nullptr, generator, nullptr, config);
    std::cerr << "insertOpenOSR succeded!" << std::endl;

    Function *src_new = pair.first, *stub = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << stub->getName().str() << std::endl;

}

void Parser::finalizedOSRHelper(Function* src, BasicBlock* src_bb, bool update,
            std::string* F1NewName, const std::string* F2Name, const std::string* B2Name,
            std::string* F2NewName, OSRLibrary::OSRCond &cond) {

    Function* dest;
    BasicBlock* dest_bb = nullptr;

    dest = TheHelper->getFunction(*F2Name);
    if (dest == nullptr) {
        std::cerr << "Unable to find function named " << *F2Name << "!" << std::endl;
        return;
    } else {
        for (Function::iterator it = dest->begin(), end = dest->end(); it != end; ++it) {
            if (it->getName().equals(*B2Name)) {
                dest_bb = it;
                break;
            }
        }
        if (dest_bb == nullptr) {
            std::cerr << "Unable to find basic block " << *B2Name << " in function " << *F2Name << "!" << std::endl;
            return;
        }
    }

    if (src != dest) {
        std::cerr << "Sorry, I don't support OSR transitions for F2 != F1 yet!" << std::endl;
        return;
    }

    std::pair<Function*, StateMap*> tmpMapPair = StateMap::generateIdentityMapping(src);
    StateMap* M = tmpMapPair.second;
    dest = tmpMapPair.first;
    dest_bb = M->getCorrespondingBlock(src_bb);
    assert(dest_bb != nullptr);

    // print information about values to fetch
    StateMap::BlockPair tmpSrcDestPair = std::pair<BasicBlock*, BasicBlock*>(src_bb, dest_bb);
    M->getLivenessResults().first.printResultsToScreen(src_bb);
    std::vector<Value*> valuesToFetch = M->getValuesToFetchFromSrcFunction(tmpSrcDestPair);
    std::cerr << "Values to fetch: " << valuesToFetch.size() << std::endl;
    for (int i = 0, e = valuesToFetch.size(); i < e; ++i) {
        std::cerr << valuesToFetch[i]->getName().str() << " ";
    }
    std::cerr << std::endl;

    // (verbose, updateF1, nameForNewF1, modForNewF1, ptrForF1NewToF1Map, nameForNewF2, nameForNewF2, ptrForF2NewToF2Map)
    StateMap* F1NewToF1Map;
    StateMap* F2NewToF2Map;
    OSRLibrary::OSRPointConfig config(false, update, F1NewName, src->getParent(), &F1NewToF1Map,
            F2NewName, src->getParent(), &F2NewToF2Map);

    OSRLibrary::OSRPair pair = OSRLibrary::insertFinalizedOSR(TheHelper->Context, *src, *src_bb,
            *dest, *dest_bb, cond, *M, config);

    std::cerr << "insertFinalizedOSR succeded!" << std::endl;

    Function *src_new = pair.first, *dest_new = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << dest_new->getName().str() << std::endl;

}

void Parser::handleInsertOSRCommand() {
    #define INVALID() do { std::cerr << "Invalid syntax for an INSERT_OSR command!" << std::endl\
            << "Error at argument " << numToken << ". Enter HELP to display the right syntax." << std::endl;\
            return; } while (0);

    char* cmdLine = strdup(TheLexer->getLine()->c_str());

    int numToken = 1;
    char* token = strtok(cmdLine, " ");
    if (token == NULL) INVALID();
    #define getToken() do { ++numToken; token = strtok(NULL, " "); if (token == NULL) INVALID();} while (0)

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
    } else if (strcasecmp(token, "FINAL")) {
        INVALID();
    }

    bool update = false;
    getToken();
    if (!strcasecmp(token, "UPDATE")) {
        open = true;
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
    const std::string B1Name(token);

    // look for F1 and B1
    Function *src;
    BasicBlock *src_bb = nullptr;

    src = TheHelper->getFunction(F1Name);
    if (src == nullptr) {
        std::cerr << "Unable to find function named " << F1Name << "!" << std::endl;
        return;
    } else {
        for (Function::iterator it = src->begin(), end = src->end(); it != end; ++it) {
            if (it->getName().equals(B1Name)) {
                src_bb = it;
                break;
            }
        }
        if (src_bb == nullptr) {
            std::cerr << "Unable to find basic block " << B1Name << " in function " << F1Name << "!" << std::endl;
            return;
        }
    }

    std::string F1NewName;
    if (!update) {
        getToken();
        if (strcasecmp(token, "AS")) INVALID();

        getToken();
        F1NewName = std::string(token);
    }

    std::string* tmpForF1NewName = (update) ? nullptr : &F1NewName;

    if (open) {
        openOSRHelper(src, src_bb, update, tmpForF1NewName, cond);
        return;
    }

    getToken();
    if (strcasecmp(token, "TO")) INVALID();

    getToken();
    const std::string F2Name(token);

    getToken();
    if (strcasecmp(token, "AT")) INVALID();

    getToken();
    const std::string B2Name(token);

    getToken();
    if (strcasecmp(token, "AS")) INVALID();

    getToken();
    const std::string F2NewName(token);

    finalizedOSRHelper(src, src_bb, update, tmpForF1NewName, &F2Name,
            &B2Name, const_cast<std::string*>(&F2NewName), cond);
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
    TheHelper->addModule(std::move(M), false);
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