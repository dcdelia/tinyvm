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
        if (command == "LOAD")          return tok_load;
        if (command == "BEGIN")         return tok_begin;
        if (command == "INSERT_OSR")    return tok_insert_osr;
        if (command == "IN")            return tok_in;
        if (command == "AT")            return tok_at;
        if (command == "AS")            return tok_as;
        if (command == "TO")            return tok_to;
        if (command == "CFG")           return tok_cfg;
        if (command == "CFG_FULL")      return tok_cfg_full;
        if (command == "DUMP")          return tok_dump;
        if (command == "TRACK_ASM")     return tok_track_asm;
        if (command == "SHOW_ASM")      return tok_show_asm;
        if (command == "REPEAT")        return tok_repeat;
        if (command == "SHOW_SYMS")     return tok_show_syms;
        if (command == "INSERT_OPEN_OSR")    return tok_insert_open_osr;

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
