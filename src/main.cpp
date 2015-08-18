/* ===============================================================
 * Bootstrap code for TinyVM
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
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