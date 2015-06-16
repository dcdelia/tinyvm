#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/MCJIT.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"

#include "Lexer.hpp"
#include "MCJITHelper.hpp"
#include "Parser.hpp"
#include "history.h"

#include <cstdio>

using namespace llvm;

#define USE_CMD_HISTORY 1

#if USE_CMD_HISTORY
history_t cmd_history;

int getCharFromHistory() {
    return get_input_char(&cmd_history);
}
#endif

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

            Parser parser(TheLexer, TheHelper);
            parser.start();

            delete TheLexer;
        }
    }

    #if USE_CMD_HISTORY
    init_history(&cmd_history, "TinyVM> ");
    TheLexer = new Lexer(getCharFromHistory);
    #else
    TheLexer = new Lexer(getchar);
    #endif

    Parser parser(TheLexer, TheHelper);
    parser.start();

    delete TheLexer;
    delete TheHelper;

    #if USE_CMD_HISTORY
    restore_term(&cmd_history);
    #endif

    exit(0);
}
