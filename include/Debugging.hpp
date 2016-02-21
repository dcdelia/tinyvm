#include "Lexer.hpp"
#include "MCJITHelper.hpp"

using namespace llvm;

class Debugging {
public:
    struct SourceInfo {
        std::map<Instruction*, unsigned> instToLineNumMap;
        //std::map<Value*,
    };

    static std::map<Function*, SourceInfo*> sourceInfoMap;

    static void handleDebugCommand(Lexer* TheLexer, MCJITHelper* TheHelper);
    static void showHelpForDebugCommand();

private:
    static void parseProgramLocations(Function* F, SourceInfo* info);
    static void stripDebugInfo(Module* M);
};
