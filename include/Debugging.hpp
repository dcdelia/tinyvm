#ifndef TINYVM_DEBUGGING_H
#define TINYVM_DEBUGGING_H

#include "BuildComp.hpp"
#include "Lexer.hpp"
#include "MCJITHelper.hpp"

using namespace llvm;

class Debugging {
public:
    struct SourceInfo {
        std::map<Instruction*, unsigned> instToLineNumMap;
        std::map<Value*, std::string> dbgDeclareInfoMap;
        std::map<Value*, std::string> dbgValueInfoMap;
    };

    static std::map<Function*, SourceInfo*> sourceInfoMap;

    static void handleDebugCommand(Lexer* TheLexer, MCJITHelper* TheHelper,
            BuildComp::Heuristic &buildCompOpts);
    static void showHelpForDebugCommand();

private:
    static void parseProgramLocations(Function* F, SourceInfo* info);
    static void parseProgramVariables(Function* F, SourceInfo* info);
    static void stripDebugInfo(Module* M);
    static void runInstNamerPass(Function* F);
    static void computeRecoveryInfo(Function* orig, Function* opt,
            MCJITHelper* TheHelper, BuildComp::Heuristic &buildCompOpts);
};

#endif