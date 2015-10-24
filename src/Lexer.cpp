/* ===============================================================
 * A simple Lexer for TinyVM's command line
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "Lexer.hpp"

#include <algorithm>
#include <cctype>
#include <cstdio>
#include <string>

int Lexer::getNextToken() {
    /* check EOF or new line character from previous invocation */
    if (LastChar == EOF) {
        LastChar = ' '; // dirty trick: will be eaten by the next while
        return tok_eof;
    }

    if (LastChar == '\n') {
        LastChar = ' '; // dirty trick: will be eaten by the next while
        return tok_newline;
    }

    /* now I can skip any white-space character: space, form feed, new
     * line, carriage return, horizontal tab or vertical tab */
    while (isspace(LastChar)) LastChar = getInputChar();

    CurString = LastChar;

    // parse a C-valid identifier or special command for the VM
    if (isalpha(LastChar) || (LastChar == '_')) {
        while (isalnum((LastChar = getInputChar())) || (LastChar == '_')) CurString += LastChar;

        std::string command = CurString;
        std::transform(command.begin(), command.end(), command.begin(), ::toupper);

        if (command == "HELP")          return tok_help;
        if (command == "QUIT")          return tok_quit;
        if (command == "BEGIN")         return tok_begin;
        if (command == "CFG")           return tok_cfg;
        if (command == "CFG_FULL")      return tok_cfg_full;
        if (command == "CLONE_FUN")     return tok_clone_fun;
        if (command == "COMP_CODE")     return tok_comp_code;
        if (command == "DUMP")          return tok_dump;
        if (command == "INSERT_OSR")    return tok_insert_osr;
        if (command == "LOAD_IR")       return tok_load_IR;
        if (command == "LOAD_LIB")      return tok_load_lib;
        if (command == "OPT")           return tok_opt;
        if (command == "OPT_CFG")       return tok_opt_cfg;
        if (command == "OPT_FULL")      return tok_opt_full;
        if (command == "REPEAT")        return tok_repeat;
        if (command == "SHOW_ADDR")     return tok_show_addr;
        if (command == "SHOW_ASM")      return tok_show_asm;
        if (command == "SHOW_FUNS")     return tok_show_funs;
        if (command == "SHOW_LINE_IDS") return tok_show_lids;
        if (command == "SHOW_MAPS")     return tok_show_maps;
        if (command == "SHOW_MODS")     return tok_show_mods;
        if (command == "TRACK_ASM")     return tok_track_asm;
        if (command == "VERBOSE")       return tok_verbose;

        return tok_identifier;
    }

    if (isdigit(LastChar)) {
        while (isdigit((LastChar = getInputChar()))) CurString += LastChar;
        return tok_integer;
    }

    // LastChar is not an alphanumeric or underscore character
    switch (LastChar) {
        case EOF:   return tok_eof;
        case '\n':  LastChar = getInputChar(); return tok_newline;
        default:    int ret = LastChar; LastChar = getInputChar(); return ret;
    }
}

const std::string Lexer::getIdentifier() {
    return CurString; // TODO by value is okay? ref?
}

std::string* Lexer::getLine() {
    // trim any initial white-space
    while (isspace(LastChar)) LastChar = getInputChar();

    if (LastChar == EOF) return nullptr;

    std::string *line = new std::string("");
    do {
        *line += LastChar;
        LastChar = getInputChar();
    } while (LastChar != '\n' && LastChar != EOF);

    return line;
}

int Lexer::getInteger() {
    return std::stoi(CurString);
}

int Lexer::getInputChar() {
    if (InputStream == nullptr) {
        return userGetInputCharFun();
    }
    else {
        return getc(InputStream);
    }
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