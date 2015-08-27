/* ===============================================================
 * A simple Lexer for TinyVM's command line
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_LEXER_H
#define TINYVM_LEXER_H

#include <cstdio>
#include <string>

enum Token {
    tok_error   = 0,
    tok_eof     = -1,
    tok_newline = -2,

    // keep it simple for now
    tok_identifier  = -3,
    tok_integer     = -4,

    // special commands for the interpreter
    tok_help        = -10,
    tok_quit        = -11,
    tok_load_IR     = -12,
    tok_begin       = -13,
    tok_insert_osr  = -14,
    tok_in          = -15,
    tok_at          = -16,
    tok_as          = -17,
    tok_to          = -18,
    tok_cfg         = -19,
    tok_cfg_full    = -20,
    tok_dump        = -21,
    tok_track_asm   = -22,
    tok_show_asm    = -23,
    tok_repeat      = -24,
    tok_show_mods   = -25,
    tok_insert_open_osr    = -26,
    tok_show_funs   = -27,
    tok_load_lib    = -28
};

class Lexer {
public:
    Lexer(FILE* stream) : InputStream(stream), LastChar(' '), CurString(""), userGetInputCharFun(nullptr) {}
    Lexer(int (*getInputCharFun)()) : InputStream(nullptr), LastChar(' '), CurString(""), userGetInputCharFun(getInputCharFun) {}

    ~Lexer() {}
    int getNextToken();
    const std::string getIdentifier();
    int getInteger();
    std::string *getLine(); // returns nullptr when EOF

private:
    int getInputChar();

    FILE* InputStream;
    int LastChar;
    std::string CurString;
    int (*userGetInputCharFun)();
};

#endif

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