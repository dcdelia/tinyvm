#ifndef TINYVM_PARSER_H
#define TINYVM_PARSER_H

#include "Lexer.hpp"
#include "MCJITHelper.hpp"

class Parser {
public:
    Parser(Lexer* L, MCJITHelper* H) : TheLexer(L), TheHelper(H) {}
    void start();

private:
    Lexer       *TheLexer;
    MCJITHelper *TheHelper;

    // simple auxiliary methods
    void handleBeginCommand();
    void handleDumpCommand();
    void handleFunctionInvocation(int iterations);
    void handleHelpCommand();
    void handleInsertOSRCommand();
    void handleLoadCommand();
    void handleRepeatCommand();
    void handleShowCFGCommand(bool showInstructions);
    void handleTrackAsmCommand();
};

#endif
