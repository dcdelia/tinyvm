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
    tok_load        = -12,
    tok_begin       = -13,
    tok_insert_osr  = -14,
    tok_in          = -15,
    tok_at          = -16,
    tok_as          = -17,
    tok_to          = -18,
    tok_cfg         = -19,
    tok_cfg_full    = -20,
    tok_dump        = -21
};

class Lexer {
public:
    Lexer(FILE* stream) : InputStream(stream), CurToken(tok_error), LastChar(' '), CurString("") {}
    ~Lexer() {}
    int getNextToken();
    const std::string getIdentifier();
    int getInteger();
    std::string *getLine(); // returns nullptr when EOF

private:
    FILE* InputStream;
    Token CurToken;
    int LastChar;
    std::string CurString;
};

#endif
