/* ===============================================================
 * Bootstrap code for TinyVM
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Lexer.hpp"
#include "MCJITHelper.hpp"
#include "Parser.hpp"

#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/MCJIT.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/TargetSelect.h>

#include <cstdio>

#define USE_CMD_HISTORY 1

#if USE_CMD_HISTORY

#include "history.h"
#include <signal.h>

history_t cmd_history;

int getCharFromHistory() {
    return get_input_char(&cmd_history);
}

void intHandler(int signum) {
    restore_term(&cmd_history);
    fprintf(stderr, "Exiting...\n");
    if (signum == SIGINT) {
        exit(0);
    } else {
        exit(1);
    }
}
#endif

using namespace llvm;

int main(int argc, char* argv[]) {
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    InitializeNativeTargetAsmParser();

    LLVMContext &Context = getGlobalContext();
    MCJITHelper* TheHelper = new MCJITHelper(Context, nullptr); // no initial module

    Lexer *TheLexer;
    int code;

    if (argc > 1) {
        for (int i = 1; i < argc; ++i) {
            fprintf(stderr, "[PROCESSING INPUT FILE %s]\n", argv[i]);
            FILE* inputFile = fopen(argv[i], "r");
            if (inputFile == NULL) {
                fprintf(stderr, "[FATAL ERROR] Cannot open input file %s!\n", argv[i]);
                break;
            }
            TheLexer = new Lexer(inputFile);

            Parser parser(TheLexer, TheHelper, nullptr);
            code = parser.start(false); // do not display help message

            delete TheLexer;

            if (code != -1) exit(code);
        }
    }

    #if USE_CMD_HISTORY
    // terminal would be broken after a CTRL-C if we do not restore it
    struct sigaction act;
    memset(&act, 0, sizeof(act));
    act.sa_handler = &intHandler;
    sigaction(SIGINT, &act, NULL);
    sigaction(SIGABRT, &act, NULL);

    init_history(&cmd_history, "TinyVM> ");
    TheLexer = new Lexer(getCharFromHistory);
    Parser parser(TheLexer, TheHelper, &cmd_history);
    #else
    TheLexer = new Lexer(getchar);
    Parser parser(TheLexer, TheHelper, nullptr);
    #endif

    code = parser.start();
    if (code == -1) code = 0; // -1 means CTRL-D or EOF

    delete TheLexer;
    delete TheHelper;

    #if USE_CMD_HISTORY
    restore_term(&cmd_history);
    #endif

    exit(code);
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