#include "Parser.hpp"
#include "Lexer.hpp"
#include "MCJITHelper.hpp"
#include "OSRLibrary.hpp"
#include "StateMap.hpp"
#include "timer.h"

#include <cstdio>
#include <cstring>
#include <iostream>
#include <unistd.h> // access()

using namespace llvm;

void Parser::start() {
    fprintf(stderr, "Welcome! Enter 'HELP' to show the list of available commands.\n");

    while (1) {
        fprintf(stderr, "TinyVM> ");
        int token = TheLexer->getNextToken();
        switch (token) {
            case tok_newline:       fprintf(stderr, "\r"); break; // dirty trick :-)
            case tok_help:          handleHelpCommand(); break;
            case tok_begin:         handleBeginCommand(); break;
            case tok_load:          handleLoadCommand(); break;
            case tok_insert_osr:    handleInsertOSRCommand(); break;
            case tok_cfg:           handleShowCFGCommand(false); break;
            case tok_cfg_full:      handleShowCFGCommand(true); break;
            case tok_dump:          handleDumpCommand(); break;
            case tok_repeat:        handleRepeatCommand(); break;
            case tok_track_asm:     handleTrackAsmCommand(); break;
            case tok_show_asm:      TheHelper->showTrackedAsm(); break;
            case tok_show_mods:     TheHelper->showModules(); break;
            case tok_show_funs:     TheHelper->showFunctions(); break;
            case tok_insert_open_osr:   handleInsertOpenOSRCommand(); break;
            case tok_quit:          fprintf(stderr, "Exiting...\n"); return;
            case tok_identifier:    handleFunctionInvocation(1); break;
            case tok_eof:           fprintf(stderr, "CTRL+D or EOF reached.\n"); return;
            default:                fprintf(stderr, "Unexpected token. Exiting...\n"); return;
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
    TheHelper->addModule(std::move(M)); // default: OptimizeModule = true
    std::cerr << "[LOAD] The new module has been loaded." << std::endl;
}

void Parser::handleDumpCommand() {
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a DUMP command!\n" \
            "Expected command of the form: DUMP <function_name>\n"); \
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
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a function invocation!\n"); return; } while (0);
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
    std::cerr << "List of available commands:\n";
    std::cerr << "--> BEGIN <module_name>\n" << "\tType an IR module from stdin. Press CTRL-D when finished.\n";
    std::cerr << "--> LOAD <file_name>\n" << "\tLoads an IR module from a given file.\n";
    std::cerr << "--> CFG <function_name>\n" << "\tShows a compact view of the CFG of a given function.\n";
    std::cerr << "--> CFG_FULL <function_name>\n" << "\tShows the full CFG (with instructions) of a given function.\n";
    std::cerr << "--> DUMP <function_name>\n" << "\tShows the IR code of a given function.\n";
    std::cerr << "--> REPEAT <iterations> <function call>\n" << "\tPerforms a function call (see next paragraph) repeatedly.\n";
    std::cerr << "--> TRACK_ASM\n" << "\tEnable/disable logging of generated x86-64 assembly code.\n";
    std::cerr << "--> SHOW_ASM\n" << "\tShow logged x86-64 assembly code.\n";
    std::cerr << "--> SHOW_MODS\n" << "\tShow loaded modules and their symbols.\n";
    std::cerr << "--> QUIT\n" << "\tExits TinyVM.\n";

    // function invocation
    std::cerr << "\nThe TinyVM command line supports the invocation of loaded functions. "
              << "Functions can be invoked as in C, except for the final semi-colon that must not be added.\n"
              << "For the time being, only functions with integer arguments and return values are supported.\n";

    // demo insert_osr (finalized)
    std::cerr << "\nDemo OSR points can be inserted with the following command:\n"
              << "--> INSERT_OSR IN <F1> AT <B1> AS <F1'> TO <F2> AT <B2> AS <F2'>\n"
              << "where F1 and F2 are existing functions, and B1 and B2 are basic block labels.\n";
    std::cerr << "\nThe command generates a function F1' cloned from F1 such that when basic block B1 "
              << "is reached during the execution of F1', an OSR transition to F2' is fired.\n";
    std::cerr << "\nFunction F2' is generated from F2 in order to resume the execution from the "
              << "beginning of basic block B2, and values for live variables in F1' at B1 "
              << "are transferred as arguments for the call.\n";

    // demo insert_open_osr
    std::cerr << "\nDemo *open* OSR points can be inserted with the following command:\n"
              << "--> INSERT_OPEN_OSR IN <F1> AT <B1> AS <F1'>\n"
              << "where F1 is an existing function and B1 the label of a basic block inside F1.\n";
    std::cerr << "\nThe command generates a function F1' cloned from F1 such that when basic block B1 "
              << "is reached during the execution of F1', an open OSR transition is fired.\n";
    std::cerr << "\nA function callled F1'_stub is generated to store the live state and trigger the "
              << "generation and compilation of the code to continue the execution with, and values "
              << "for live variables in F1' at B1 are transferred as arguments for the call.\n";
}

void Parser::handleInsertOSRCommand() {
    #define INVALID(left) do { fprintf(stderr, "Invalid syntax for an INSERT_OSR command!\n" \
            "Expected command of the form: INSERT_OSR IN F1 AT B1 AS F1' TO F2 AT B2 AS F2'\n" \
            "Error occurred at token %u after INSERT_OSR command\n", 12-left); \
            int tokens_left = left; \
            while (tokens_left--) TheLexer->getNextToken(); \
            return; } while (0);

    if (TheLexer->getNextToken() != tok_in) INVALID(11);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(10);
    const std::string F1 = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_at) INVALID(9);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(8);
    const std::string B1 = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_as) INVALID(7);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(6);
    const std::string F1_OSR = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_to) INVALID(5);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(4);
    const std::string F2 = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_at) INVALID(3);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(2);
    const std::string B2 = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_as) INVALID(1);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(0);
    const std::string F2_OSR = TheLexer->getIdentifier();
    #undef INVALID

    fprintf(stderr, "Attempting to insert an OSR point in function '%s' at basic block '%s' to "
                    "function '%s' at basic block '%s' and thus produce functions '%s' and '%s'... Please be patient :-)\n",
                    F1.c_str(), B1.c_str(), F2.c_str(), B2.c_str(), F1_OSR.c_str(), F2_OSR.c_str());

    Function *src, *dest;
    BasicBlock *src_bb = nullptr, *dest_bb = nullptr;

    src = TheHelper->getFunction(F1);
    if (src == nullptr) {
        fprintf(stderr, "Unable to find function named %s!\n", F1.c_str());
        return;
    } else {
        for (Function::iterator it = src->begin(), end = src->end(); it != end; ++it) {
            if (it->getName().equals(B1)) {
                src_bb = it;
                break;
            }
        }
        if (src_bb == nullptr) {
            fprintf(stderr, "Unable to find basic block %s in function %s!\n", B1.c_str(), F1.c_str());
            return;
        }
    }

    dest = TheHelper->getFunction(F2);
    if (dest == nullptr) {
        fprintf(stderr, "Unable to find function named %s!\n", F2.c_str());
        return;
    } else {
        for (Function::iterator it = dest->begin(), end = dest->end(); it != end; ++it) {
            if (it->getName().equals(B2)) {
                dest_bb = it;
                break;
            }
        }
        if (dest_bb == nullptr) {
            fprintf(stderr, "Unable to find basic block %s in function %s!\n", B2.c_str(), F2.c_str());
            return;
        }
    }

    if (src != dest) {
        fprintf(stderr, "Sorry, I don't support OSR transitions to a F2 != F1 function yet!\n");
        return;
    }

    /* From now on src == dest */
    ValueToValueMapTy* VMap = TheHelper->generateIdentityMapping(src);
    StateMap::ValueToValuesMap* VVsMap = StateMap::convertValueToValueMapTy(*VMap);

    std::cerr << "VVsMap generated!" << std::endl;

    StateMap M(src, dest, VVsMap);
    std::cerr << "StateMap generated!" << std::endl;

    // print information about values to fetch
    StateMap::BBSrcDestPair tmpSrcDestPair = std::pair<BasicBlock*, BasicBlock*>(src_bb, dest_bb);
    M.getLivenessResultsForSrcFunction().printResultsToScreen(src_bb);
    std::vector<Value*> &valuesToFetch = M.getValuesToFetchFromSrcFunction(tmpSrcDestPair);
    std::cerr << "Values to fetch: " << valuesToFetch.size() << std::endl;
    for (int i = 0, e = valuesToFetch.size(); i < e; ++i) {
        std::cerr << valuesToFetch[i]->getName().str() << " ";
    }
    std::cerr << std::endl;

    // we generate a condition that is always true as OSRCond
    OSRLibrary::OSRCond cond;
    cond.push_back(TheHelper->generateAlwaysTrueCond());

    std::cerr << "OSRCond generated!" << std::endl;

    OSRLibrary::OSRPair pair = OSRLibrary::insertFinalizedOSR(*src, *src_bb, *dest, *dest_bb, cond, M, F1_OSR, F2_OSR);

    std::cerr << "insertFinalizedOSR succeded!" << std::endl;

    Function *src_new = pair.first, *dest_new = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << dest_new->getName().str() << std::endl;

    std::unique_ptr<Module> OSRModule = llvm::make_unique<Module>("OSR_module", getGlobalContext()); // TODO unique names, get Context from Helper
    Module* OSRModule_p = OSRModule.get();

    OSRModule_p->getFunctionList().push_back(src_new);
    OSRModule_p->getFunctionList().push_back(dest_new);

    std::cerr << "Module " << OSRModule_p->getModuleIdentifier() << " generated!" << std::endl;

    TheHelper->addModule(std::move(OSRModule), false);
}


void Parser::handleLoadCommand() {
    std::string *FileName = TheLexer->getLine();
    const char* fileName = FileName->c_str();
    if (access(fileName, F_OK) == -1 ) {
        fprintf(stderr, "[ERROR] Cannot locate \"%s\" IR source file!\n", fileName);
        return;
    }
    fprintf(stderr, "[LOAD] Opening \"%s\" as IR source file...\n", fileName);
    std::unique_ptr<Module> M = TheHelper->createModuleFromFile(*FileName);
    TheHelper->addModule(std::move(M)); // default: OptimizeModule = false
    delete FileName;
}

void Parser::handleRepeatCommand() {
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a REPEAT command!\n" \
            "Expected command of the form: REPEAT <iterations> <function call>\n"); \
            return; } while (0);
    if (TheLexer->getNextToken() != tok_integer) INVALID();
    int iterations = TheLexer->getInteger();
    if (TheLexer->getNextToken() != tok_identifier) INVALID();
    #undef INVALID

    handleFunctionInvocation(iterations);
}

void Parser::handleShowCFGCommand(bool showInstructions) {
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a CFG command!\n" \
            "Expected command of the form: CFG <function_name>\n"); \
            return; } while (0);

    if (TheLexer->getNextToken() != tok_identifier) INVALID();
    const std::string Name = TheLexer->getIdentifier();
    #undef INVALID

    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        fprintf(stderr, "Unable to find function named %s!\n", Name.c_str());
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
        std::cerr << "Current status: tracking is enabled. Now disabling it!\n";
    } else {
        std::cerr << "Current status: tracking is disabled. Now enabling it!\n";
    }
    std::cerr << "Notice that only modules loaded from now on will be affected by this change.\n";
}

void Parser::handleInsertOpenOSRCommand() {
    #define INVALID(left) do { fprintf(stderr, "Invalid syntax for an INSERT_OPEN_OSR command!\n" \
            "Expected command of the form: INSERT_OSR IN F1 AT B1 AS F1''\n" \
            "Error occurred at token %u after INSERT_OSR command\n", 6-left); \
            int tokens_left = left; \
            while (tokens_left--) TheLexer->getNextToken(); \
            return; } while (0);

    if (TheLexer->getNextToken() != tok_in) INVALID(5);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(4);
    const std::string F1 = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_at) INVALID(3);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(2);
    const std::string B1 = TheLexer->getIdentifier();

    if (TheLexer->getNextToken() != tok_as) INVALID(1);

    if (TheLexer->getNextToken() != tok_identifier) INVALID(0);
    const std::string F1_OSR = TheLexer->getIdentifier();
    #undef INVALID

    fprintf(stderr, "Attempting to insert an *open* OSR point in function '%s' at basic block '%s' "
                    "and thus produce functions '%s' and '%s_stub'... Please be patient :-)\n",
                    F1.c_str(), B1.c_str(), F1_OSR.c_str(), F1_OSR.c_str());

    Function *src;
    BasicBlock *src_bb = nullptr;

    src = TheHelper->getFunction(F1);
    if (src == nullptr) {
        fprintf(stderr, "Unable to find function named %s!\n", F1.c_str());
        return;
    } else {
        for (Function::iterator it = src->begin(), end = src->end(); it != end; ++it) {
            if (it->getName().equals(B1)) {
                src_bb = it;
                break;
            }
        }
        if (src_bb == nullptr) {
            fprintf(stderr, "Unable to find basic block %s in function %s!\n", B1.c_str(), F1.c_str());
            return;
        }
    }

    /*
    // print information about values to fetch
    StateMap::BBSrcDestPair tmpSrcDestPair = std::pair<BasicBlock*, BasicBlock*>(src_bb, dest_bb);
    M.getLivenessResultsForSrcFunction().printResultsToScreen(src_bb);
    std::vector<Value*> &valuesToFetch = M.getValuesToFetchFromSrcFunction(tmpSrcDestPair);
    fprintf(stderr, "Values to fetch: %lu\n", valuesToFetch.size());
    for (int i = 0, e = valuesToFetch.size(); i < e; ++i) {
        fprintf(stderr, "%s ", valuesToFetch[i]->getName().str().c_str());
    }
    fprintf(stderr, "\n");
    */

    // we generate a condition that is always true as OSRCond
    OSRLibrary::OSRCond cond;
    cond.push_back(TheHelper->generateAlwaysTrueCond());

    fprintf(stderr, "OSRCond generated!\n");

    Function* dest;
    BasicBlock* dest_bb;
    StateMap* m;

    OSRLibrary::OpenOSRInfo info;
    info.f1 = src;
    info.b1 = src_bb;
    info.f2_pp = &dest;
    info.b2_pp = &dest_bb;
    info.m_pp = &m;

    std::cerr << "Value for info.f1 is " << info.f1 << std::endl;
    std::cerr << "Value for info.b1 is " << info.b1 << std::endl;
    std::cerr << "Value for info.f2_pp is " << info.f2_pp << std::endl;
    std::cerr << "Value for info.b2_pp is " << info.b2_pp << std::endl;
    std::cerr << "Value for info.m_pp is " << info.m_pp << std::endl;

    OSRLibrary::DestFunGenerator generator = MCJITHelper::identityGeneratorForOpenOSR;

    OSRLibrary::OSRPair pair = OSRLibrary::insertOpenOSR(info, cond, nullptr, generator, F1_OSR);
    std::cerr << "insertOpenOSR succeded!" << std::endl;

    Function *src_new = pair.first, *stub = pair.second;

    std::cerr << "First function generated: " << src_new->getName().str() << std::endl;
    std::cerr << "Second function generated: " << stub->getName().str() << std::endl;

    std::unique_ptr<Module> OSRModule = llvm::make_unique<Module>("OSR_module", getGlobalContext()); // TODO unique names, get Context from Helper
    Module* OSRModule_p = OSRModule.get();

    OSRModule_p->getFunctionList().push_back(src_new);
    OSRModule_p->getFunctionList().push_back(stub);

    std::cerr << "Module " << OSRModule_p->getModuleIdentifier() << " generated!" << std::endl;

    TheHelper->addModule(std::move(OSRModule), false);
}