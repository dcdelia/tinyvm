#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/MCJIT.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetSelect.h"

#include "Lexer.hpp"
#include "MCJITHelper.hpp"
#include "Parser.hpp"

#include <cstdio>

using namespace llvm;

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

    TheLexer = new Lexer(getchar);

    Parser parser(TheLexer, TheHelper);
    parser.start();

    delete TheLexer;
    delete TheHelper;

    exit(0);
}
