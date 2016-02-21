#include "Debugging.hpp"

#include <iostream>
#include <llvm/IR/DebugLoc.h>
#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/Transforms/IPO.h>

std::map<Function*, Debugging::SourceInfo*> Debugging::sourceInfoMap;

// see Parser.cpp
#define INIT_TOKENIZER(cmdLine) int numToken = 1; char* token = strtok((cmdLine), " ");
#define GET_TOKEN() do { ++numToken; token = strtok(NULL, " "); if (token == NULL) INVALID();} while (0)
#define GET_TOKEN_OR_NULL() do { ++numToken; token = strtok(NULL, " "); } while(0)

void Debugging::handleDebugCommand(Lexer* TheLexer, MCJITHelper* TheHelper) {
    #define INVALID() do { std::cerr << "Invalid syntax for a DEBUG command!" << std::endl\
            << "Error at argument " << numToken << ". Enter HELP DEBUG to display the right syntax." << std::endl;\
            return; } while (0);

    bool verbose = TheHelper->verbose;

    std::string *tmpStr = TheLexer->getLine();
    std::string LexerStr(std::move(*tmpStr));
    delete tmpStr;
    INIT_TOKENIZER(const_cast<char*>(LexerStr.c_str()));
    if (token == NULL) INVALID();

    // anonymous enum to encode actions
    enum {
        parse, strip
    };

    int action;

    if (!strcasecmp(token, "PARSE")) {
        action = parse;
    } else if (!strcasecmp(token, "STRIP")) {
        action = strip;
    } else {
        INVALID();
    }

    if (action == parse) {
        GET_TOKEN();
        std::string FunName = token;

        Function* F = TheHelper->getFunction(FunName);
        if (F == nullptr) {
            std::cerr << "Unable to find function " << FunName << "!" << std::endl;
            return;
        }

        if (sourceInfoMap.count(F)) {
            std::cerr << "Function has already been analyzed!" << std::endl;
            return;
        }

        SourceInfo* info = new SourceInfo();
        parseProgramLocations(F, info);

        sourceInfoMap.insert(std::pair<Function*, SourceInfo*>(F, info));
    } else if (action == strip) {
        GET_TOKEN();
        std::string ModName = token;

        std::vector<Module*> &Modules = TheHelper->getLoadedModules();
        for (Module* M: Modules) {
            if (M->getModuleIdentifier() == ModName) stripDebugInfo(M);
        }
    }

    /*


    SourceInfo* info = new SourceInfo();

    sourceInfoMap.insert(std::pair<Function*, SourceInfo*>(F, info));
    */

    #undef INVALID

}

void Debugging::showHelpForDebugCommand() {

}

void Debugging::stripDebugInfo(Module* M) {
    PassManager PM;
    PM.add(createStripSymbolsPass(true));

    std::cerr << "Stripping debug info from module " << M->getName().str()
              << std::endl;

    PM.run(*M);
}

void Debugging::parseProgramLocations(Function* F, Debugging::SourceInfo* info) {


    std::set<unsigned> lineNumsPerBlock;

    for (Function::iterator it = F->begin(), end = F->end(); it != end; ++it) {
        BasicBlock* B = &*it;

        lineNumsPerBlock.clear();
        for (BasicBlock::iterator bbIt = B->begin(), bbEnd = B->end();
                bbIt != bbEnd; ++bbIt) {
            Instruction* I = &*bbIt;

            // skip llvm.dbg.* intrinsics
            if (isa<DbgInfoIntrinsic>(I)) {
                //std::cerr << "Skipping a llvm.dbg.* operation..." << std::endl;
                continue;
            }

            const DebugLoc &dbLoc = I->getDebugLoc();
            if (dbLoc.isUnknown()) continue;

            unsigned lineNum = dbLoc.getLine();

            if (lineNumsPerBlock.count(lineNum)) continue;
            lineNumsPerBlock.insert(lineNum);

            info->instToLineNumMap.insert(
                    std::pair<Instruction*, unsigned>(I, lineNum));
        }
    }

    std::cerr << "IR values associated with source line locations: "
              << info->instToLineNumMap.size() << std::endl;
}