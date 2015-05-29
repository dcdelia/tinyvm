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
    while (isspace(LastChar)) LastChar = getc(InputStream);

    CurString = LastChar;

    // parse a C-valid identifier or special command for the VM
    if (isalpha(LastChar) || (LastChar == '_')) {
        while (isalnum((LastChar = getc(InputStream))) || (LastChar == '_')) CurString += LastChar;

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

        return tok_identifier;
    }

    if (isdigit(LastChar)) {
        while (isdigit((LastChar = getc(InputStream)))) CurString += LastChar;
        return tok_integer;
    }

    // LastChar is not an alphanumeric or underscore character
    switch (LastChar) {
        case EOF:   return tok_eof;
        case '\n':  LastChar = getc(InputStream); return tok_newline;
        default:    int ret = LastChar; LastChar = getc(InputStream); return ret;
    }
}

const std::string Lexer::getIdentifier() {
    return CurString; // TODO by value is okay? ref?
}

std::string* Lexer::getLine() {
    // trim any initial white-space
    while (isspace(LastChar)) LastChar = getc(InputStream);

    if (LastChar == EOF) return nullptr;

    std::string *line = new std::string("");
    do {
        *line += LastChar;
        LastChar = getc(InputStream);
    } while (LastChar != '\n' && LastChar != EOF);

    return line;
}

int Lexer::getInteger() {
    return std::stoi(CurString);
}
