#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/MCJIT.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"

#include "Lexer.hpp"
#include "MCJITHelper.hpp"
#include "OSRLibrary.hpp"
#include "StateMap.hpp"

#include <cstdio>
#include <iostream>
#include <string>
#include <unistd.h> // access()

using namespace llvm;

static void handleFunctionInvocation(Lexer* L, MCJITHelper* TheHelper) {
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a function invocation!\n"); return; } while (0);
    const std::string &FunctionName = L->getIdentifier();

    int token = L->getNextToken();
    if (token != '(') INVALID();

    std::vector<int> Arguments;

    token = L->getNextToken();

    if (token != ')') {
        if (token != tok_integer) INVALID();
        Arguments.push_back(L->getInteger());
        token = L->getNextToken();

        while (token != ')') {
            if (token != ',') INVALID();

            token = L->getNextToken();
            if (token != tok_integer) INVALID();
            Arguments.push_back(L->getInteger());

            token = L->getNextToken();
        }
    }
    #undef INVALID

    int ret = TheHelper->runFunction(FunctionName, Arguments);
    fprintf(stderr, "Evaluated to: %d\n", ret);
}

static void handleLoadCommand(Lexer* L, MCJITHelper* TheHelper) {
    std::string *FileName = L->getLine();
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

static void handleBeginCommand(Lexer* L, MCJITHelper* TheHelper) {
    if (L->getNextToken() != tok_identifier) {
        fprintf(stderr, "[ERROR] You must specify a name for the module!\n");
        return;
    }
    std::string ModuleName = L->getIdentifier();

    if ( L->getNextToken() != tok_newline) {
        fprintf(stderr, "[ERROR] Invalid syntax for typing a module!\n");
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
        fprintf(stderr, "[ERROR] Fatal error when creating IR source file \"%s\".\n", fileName);
        exit(1);
    }

    fprintf(stderr, "[MODULE] Press CTRL+D when you've entered all the code.\n");

    std::string *curLine;

    while (1) {
        curLine = L->getLine();
        if (curLine == nullptr) break;

        fprintf(out, "%s\n", curLine->c_str());
        L->getNextToken();
        delete curLine;
    }

    L->getNextToken(); // eats the EOF in the Lexer
    delete curLine;
    fprintf(stderr, "[MODULE] Module parsed and stored into \"%s\".\n", fileName);
    fclose(out);

    std::unique_ptr<Module> M = TheHelper->createModuleFromFile(std::string(fileName));
    TheHelper->addModule(std::move(M)); // default: OptimizeModule = true
    fprintf(stderr, "[LOAD] The new module has been loaded.\n");
}

static void handleInsertOSRCommand(Lexer* L, MCJITHelper* TheHelper) {
    #define INVALID(left) do { fprintf(stderr, "Invalid syntax for an INSERT_OSR command!\n" \
            "Expected command of the form: INSERT_OSR IN F1 AT B1 AS F1' TO F2 AT B2 AS F2'\n" \
            "Error occurred at token %u after INSERT_OSR command\n", 12-left); \
            int tokens_left = left; \
            while (tokens_left--) L->getNextToken(); \
            return; } while (0);

    if (L->getNextToken() != tok_in) INVALID(11);

    if (L->getNextToken() != tok_identifier) INVALID(10);
    const std::string F1 = L->getIdentifier();

    if (L->getNextToken() != tok_at) INVALID(9);

    if (L->getNextToken() != tok_identifier) INVALID(8);
    const std::string B1 = L->getIdentifier();

    if (L->getNextToken() != tok_as) INVALID(7);

    if (L->getNextToken() != tok_identifier) INVALID(6);
    const std::string F1_OSR = L->getIdentifier();

    if (L->getNextToken() != tok_to) INVALID(5);

    if (L->getNextToken() != tok_identifier) INVALID(4);
    const std::string F2 = L->getIdentifier();

    if (L->getNextToken() != tok_at) INVALID(3);

    if (L->getNextToken() != tok_identifier) INVALID(2);
    const std::string B2 = L->getIdentifier();

    if (L->getNextToken() != tok_as) INVALID(1);

    if (L->getNextToken() != tok_identifier) INVALID(0);
    const std::string F2_OSR = L->getIdentifier();
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

    fprintf(stderr, "VVsMap generated!\n");

    StateMap M(src, dest, VVsMap);
    fprintf(stderr, "StateMap generated!\n");

    // print information about values to fetch
    StateMap::BBSrcDestPair tmpSrcDestPair = std::pair<BasicBlock*, BasicBlock*>(src_bb, dest_bb);
    M.getLivenessResultsForSrcFunction().printResultsToScreen(src_bb);
    std::vector<Value*> &valuesToFetch = M.getValuesToFetchFromSrcFunction(tmpSrcDestPair);
    fprintf(stderr, "Values to fetch: %lu\n", valuesToFetch.size());
    for (int i = 0, e = valuesToFetch.size(); i < e; ++i) {
        fprintf(stderr, "%s ", valuesToFetch[i]->getName().str().c_str());
    }
    fprintf(stderr, "\n");

    // we generate a condition that is always true as OSRCond
    OSRLibrary::OSRCond cond;
    cond.push_back(TheHelper->generateAlwaysTrueCond());

    fprintf(stderr, "OSRCond generated!\n");

    OSRLibrary::OSRPair pair = OSRLibrary::insertFinalizedOSR(*src, *src_bb, *dest, *dest_bb, cond, M, F1_OSR, F2_OSR);
    fprintf(stderr, "insertFinalizedOSR succeded!\n");

    Function *src_new = pair.first, *dest_new = pair.second;

    fprintf(stderr, "First function generated: %s\n", src_new->getName().str().c_str());
    fprintf(stderr, "Second function generated: %s\n", dest_new->getName().str().c_str());

    std::unique_ptr<Module> OSRModule = llvm::make_unique<Module>("OSR_module", getGlobalContext()); // TODO unique names, get Context from Helper
    Module* OSRModule_p = OSRModule.get();

    OSRModule_p->getFunctionList().push_back(src_new);
    OSRModule_p->getFunctionList().push_back(dest_new);

    fprintf(stderr, "Module %s generated!\n", OSRModule_p->getModuleIdentifier().c_str());

    TheHelper->addModule(std::move(OSRModule), false);
}

static void handleShowCFGCommand(Lexer* L, MCJITHelper* TheHelper, bool showInstructions) {
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a CFG command!\n" \
            "Expected command of the form: CFG <function_name>\n"); \
            return; } while (0);

    if (L->getNextToken() != tok_identifier) INVALID();
    const std::string Name = L->getIdentifier();
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

static void handleDumpCommand(Lexer* L, MCJITHelper* TheHelper) {
    #define INVALID() do { fprintf(stderr, "Invalid syntax for a DUMP command!\n" \
            "Expected command of the form: DUMP <function_name>\n"); \
            return; } while (0);

    if (L->getNextToken() != tok_identifier) INVALID();
    const std::string Name = L->getIdentifier();
    #undef INVALID

    Function* F = TheHelper->getFunction(Name);
    if (F == nullptr) {
        fprintf(stderr, "Unable to find function named %s!\n", Name.c_str());
        return;
    } else {
        F->dump();
    }
}

static void handleTrackAsmCommand(Lexer* L, MCJITHelper* TheHelper) {
    bool enabled = TheHelper->toggleTrackAsm();
    if (enabled) {
        std::cerr << "Current status: tracking is enabled. Now disabling it!\n";
    } else {
        std::cerr << "Current status: tracking is disabled. Now enabling it!\n";
    }
    std::cerr << "Notice that only modules loaded from now on will be affected by this change.\n";
}

static void handleHelpCommand(Lexer* L) {
    // simple commands
    std::cerr << "List of available commands:\n";
    std::cerr << "--> BEGIN <module_name>\n" << "\tType an IR module from stdin. Press CTRL-D when finished.\n";
    std::cerr << "--> LOAD <file_name>\n" << "\tLoads an IR module from a given file.\n";
    std::cerr << "--> CFG <function_name>\n" << "\tShows a compact view of the CFG of a given function.\n";
    std::cerr << "--> CFG_FULL <function_name>\n" << "\tShows the full CFG (with instructions) of a given function.\n";
    std::cerr << "--> DUMP <function_name>\n" << "\tShows the IR code of a given function.\n";
    std::cerr << "--> TRACK_ASM\n" << "\tEnable/disable logging of generated x86-64 assembly code.\n";
    std::cerr << "--> SHOW_ASM\n" << "\tShow logged x86-64 assembly code.\n";
    std::cerr << "--> QUIT\n" << "\tExits TinyVM.\n";

    // function invocation
    std::cerr << "\nThe TinyVM command line supports the invocation of loaded functions. "
              << "Functions can be invoked as in C, except for the final semi-colon that must not be added.\n"
              << "For the time being, only functions with integer arguments and return values are supported.\n";

    // demo insert_finalized_osr
    std::cerr << "\nDemo OSR points can be inserted with the following command:\n"
              << "--> INSERT_OSR IN <F1> AT <B1> AS <F1'> TO <F2> AT <B2> AS <F2'>\n"
              << "where F1 and F2 are existing functions, and B1 and B2 are basic block labels.\n";
    std::cerr << "\nThe command generates a function F1' cloned from F1 such that when basic block B1 "
              << "is reached during the execution of F1', an OSR transition to F2' is fired.\n";
    std::cerr << "\nFunction F2' is generated from F2 in order to resume the execution from the "
              << "beginning of basic block B2, and values for live variables in F1' at B1 "
              << "are transferred as arguments for the call.\n";
}

static void mainLoop(Lexer* L, MCJITHelper* H) {
    fprintf(stderr, "Welcome! Enter 'HELP' to show the list of available commands.\n");

    while (1) {
        fprintf(stderr, "TinyVM> ");
        int token = L->getNextToken();
        switch (token) {
            case tok_newline:       fprintf(stderr, "\r"); break; // dirty trick :-)
            case tok_help:          handleHelpCommand(L); break;
            case tok_begin:         handleBeginCommand(L, H); break;
            case tok_load:          handleLoadCommand(L, H); break;
            case tok_insert_osr:    handleInsertOSRCommand(L, H); break;
            case tok_cfg:           handleShowCFGCommand(L, H, false); break;
            case tok_cfg_full:      handleShowCFGCommand(L, H, true); break;
            case tok_dump:          handleDumpCommand(L, H); break;
            case tok_track_asm:     handleTrackAsmCommand(L, H); break;
            case tok_show_asm:      H->showTrackedAsm(); break;
            case tok_quit:          fprintf(stderr, "Exiting...\n"); return;
            case tok_identifier:    handleFunctionInvocation(L, H); break;
            case tok_eof:           fprintf(stderr, "CTRL+D or EOF reached.\n"); return;
            default:                fprintf(stderr, "Unexpected token. Exiting...\n"); return;
        }
    }
}

int main(int argc, char* argv[]) {
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    InitializeNativeTargetAsmParser();

    LLVMContext &Context = getGlobalContext();
    MCJITHelper* TheHelper = new MCJITHelper(Context, nullptr); // no initial module

    Lexer *TheLexer;

    if (argc > 1) {
        for (int i = 1; i < argc; ++i) {
            fprintf(stderr, "[PROCESSING INPUT FILE %s]\n", argv[i]);
            FILE* inputFile = fopen(argv[i], "r");
            if (inputFile == NULL) {
                fprintf(stderr, "[FATAL ERROR] Cannot open input file %s!\n", argv[i]);
                break;
            }
            TheLexer = new Lexer(inputFile);
            mainLoop(TheLexer, TheHelper);
            delete TheLexer;
        }
    }

    TheLexer = new Lexer(stdin);
    mainLoop(TheLexer, TheHelper);
    delete TheLexer;

    delete TheHelper;

    exit(0);
}
