#include "Debugging.hpp"
#include "BuildComp.hpp"
#include "CodeMapper.hpp"
#include "Parser.hpp"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <llvm/IR/DebugLoc.h>
#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/IntrinsicInst.h>
#include <llvm/Transforms/IPO.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/raw_os_ostream.h>


std::map<Function*, Debugging::SourceInfo*> Debugging::sourceInfoMap;

// see Parser.cpp
#define INIT_TOKENIZER(cmdLine) int numToken = 1; char* token = strtok((cmdLine), " ");
#define GET_TOKEN() do { ++numToken; token = strtok(NULL, " "); if (token == NULL) INVALID();} while (0)
#define GET_TOKEN_OR_NULL() do { ++numToken; token = strtok(NULL, " "); } while(0)

void Debugging::handleDebugCommand(Lexer* TheLexer, MCJITHelper* TheHelper, BuildComp::Heuristic &buildCompOpts) {
    #define INVALID() do { std::cerr << "Invalid syntax for a DEBUG command!" << std::endl\
            << "Error at argument " << numToken << ". Enter HELP DEBUG to display the right syntax." << std::endl;\
            return; } while (0);

    //bool verbose = TheHelper->verbose;

    std::string *tmpStr = TheLexer->getLine();
    std::string LexerStr(std::move(*tmpStr));
    delete tmpStr;
    INIT_TOKENIZER(const_cast<char*>(LexerStr.c_str()));
    if (token == NULL) INVALID();

    // anonymous enum to encode actions
    enum {
        parse, strip, recovery
    };

    int action;

    if (!strcasecmp(token, "PARSE")) {
        action = parse;
    } else if (!strcasecmp(token, "STRIP")) {
        action = strip;
    } else if (!strcasecmp(token, "RECOVERY")) {
        action = recovery;
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
        parseProgramVariables(F, info);

        sourceInfoMap.insert(std::pair<Function*, SourceInfo*>(F, info));
    } else if (action == strip) {
        GET_TOKEN();
        std::string ModName = token;

        std::vector<Module*> &Modules = TheHelper->getLoadedModules();
        for (Module* M: Modules) {
            if (M->getModuleIdentifier() == ModName) stripDebugInfo(M);
        }
    } else if (action == recovery) {
        Function *orig, *opt;

        GET_TOKEN();
        std::string OrigFunName = token;

        orig = TheHelper->getFunction(OrigFunName);
        if (orig == nullptr) {
            std::cerr << "Unable to find function " << OrigFunName << "!" << std::endl;
            return;
        }

        GET_TOKEN();
        if (strcasecmp(token, "FROM")) INVALID();

        GET_TOKEN();
        std::string OptFunName = token;

        opt = TheHelper->getFunction(OptFunName);
        if (orig == nullptr) {
            std::cerr << "Unable to find function " << OptFunName << "!" << std::endl;
            return;
        }

        computeRecoveryInfo(orig, opt, TheHelper, buildCompOpts);
    }
    #undef INVALID

}

void Debugging::showHelpForDebugCommand() {
    // TODO
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

    std::cerr << "IR instructions associated with source line locations: "
              << info->instToLineNumMap.size() << std::endl;
}

void Debugging::parseProgramVariables(Function* F, Debugging::SourceInfo* info) {

    for (Function::iterator it = F->begin(), end = F->end(); it != end; ++it) {
        BasicBlock* B = &*it;

        for (BasicBlock::iterator bbIt = B->begin(), bbEnd = B->end();
                bbIt != bbEnd; ++bbIt) {
            Instruction* I = &*bbIt;

            //if (!isa<DbgInfoIntrinsic>(I)) continue;

            std::string str;

            if (DbgDeclareInst* DI = dyn_cast<DbgDeclareInst>(I)) {
                Value* V = DI->getAddress();
                MDNode* MD = DI->getVariable();

                raw_string_ostream ss(str);
                MD->print(ss);

                info->dbgDeclareInfoMap.insert(std::pair<Value*, std::string>(V, str));
            }

            if (DbgValueInst* VI = dyn_cast<DbgValueInst>(I)) {
                Value* V = VI->getValue();
                MDNode* MD = VI->getVariable();

                raw_string_ostream ss(str);
                MD->print(ss);

                info->dbgValueInfoMap.insert(std::pair<Value*, std::string>(V, str));
            }
        }
    }

    std::cerr << "IR values with llvm.dbg.declare info: "
              << info->dbgDeclareInfoMap.size() << std::endl;

    std::cerr << "IR values with llvm.dbg.value info: "
              << info->dbgValueInfoMap.size() << std::endl;
}

void Debugging::computeRecoveryInfo(Function* orig, Function* opt,
        MCJITHelper* TheHelper, BuildComp::Heuristic &buildCompOpts) {
    StateMap* M;
    SourceInfo* sourceInfo;
    std::vector<StateMap::LocPair> locWorkList;

    // retrieve flag for verbose mode
    bool verbose = TheHelper->verbose;

    // retrieve pre-computed debug info
    std::map<Function*, SourceInfo*>::iterator mapIt = sourceInfoMap.find(orig);
    if (mapIt == sourceInfoMap.end()) {
        std::cerr << "No pre-computed debug info for the base function!" << std::endl;
        return;
    }
    sourceInfo = mapIt->second;

    // retrieve state mapping information
    M = TheHelper->getStateMap(opt, orig);
    if (M == nullptr) {
        std::cerr << "Unable to find a StateMap for the functions!" << std::endl;
        return;
    }

    // determine program points to process from the optimized function
    StateMap::LocMap &LPads = M->getAllLandingPads();
    for (StateMap::LocMap::iterator it = LPads.begin(), end = LPads.end();
            it != end; ++it) {
        if (sourceInfo->instToLineNumMap.count(it->second)) {
            assert(it->second->getParent()->getParent() == orig);
            locWorkList.push_back(StateMap::LocPair(it->first, it->second));
        } else {
            assert(it->first->getParent()->getParent() == orig);
        }
    }

    // for the sake of simplicity, define src and dest as in an OSR scenario
    Function *src = opt, *dest = orig;
    BuildComp::Heuristic opts = buildCompOpts;

    // we borrow some code for IR name resolution from the Parser class
    Parser::IDToValueVec slotIDsForSrc = Parser::computeSlotIDs(src);
    Parser::IDToValueVec slotIDsForDest = Parser::computeSlotIDs(dest);
    Parser::IDToValueVec lineIDsForSrc = Parser::computeLineIDs(src);
    Parser::IDToValueVec lineIDsForDest = Parser::computeLineIDs(dest);

    // compute analysis info required by BuildComp
    BuildComp::AnalysisData BCAD_src(src); // BCAD_dest(dest);

    // fetch liveness analysis information  TODO write better
    std::pair<Function*, Function*> funPair = M->getFunctions();
    std::pair<LivenessAnalysis&, LivenessAnalysis&> LAPair = M->getLivenessResults();

    //LivenessAnalysis *LA_src = (src == funPair.first) ? &LAPair.first : &LAPair.second;
    //LivenessAnalysis *LA_dest = (src == funPair.first) ? &LAPair.second : &LAPair.first;
    LivenessAnalysis *LA_src, *LA_dest;
    if (src == funPair.first) {
        assert (dest == funPair.second && "wrong LocPair or StateMap");
        LA_src = &LAPair.first;
        LA_dest = &LAPair.second;
    } else {
        assert (src == funPair.second && dest == funPair.first
                && "wrong LocPair or StateMap");
        LA_src = &LAPair.second;
        LA_dest = &LAPair.first;
    }

    // retrieve CodeMapper(s) and information on updates to StateMap object(s)
    CodeMapper::OneToManyAliasMap aliasInfoMap;
    CodeMapper* src_CM = CodeMapper::getCodeMapper(*src);
    assert(!CodeMapper::getCodeMapper(*dest) && "optimized dest function?");
    if (src_CM && BuildComp::canUseAliases(opts)) {
        aliasInfoMap = BuildComp::genAliasInfoMap(
                src_CM->getStateMapUpdateInfo(M), nullptr);
    }

    // data structures initialized at each loop iteration
    std::string OSRSrcName, LPadName;
    LivenessAnalysis::LiveValues liveAtOSRSrc, liveAtLPad;
    BuildComp::Statistics bcStats;

    int allScalarsAreLive = 0;
    int totDeadUserVars = 0;
    int totRecoverableUserVars = 0;
    float sumRecoverableRatio = 0;

    std::set<Value*> deadScalars, recoveredScalars;

    for (int i = 0, e = locWorkList.size(); i != e; ++i) {
        Instruction* OSRSrc = locWorkList[i].first;
        Instruction* LPad = locWorkList[i].second;

        assert(!isa<PHINode>(OSRSrc) && "cannot perform OSR from a PHI node");

        OSRSrcName = Parser::getInstrID(OSRSrc, slotIDsForSrc, lineIDsForSrc);
        LPadName = Parser::getInstrID(LPad, slotIDsForDest, lineIDsForDest);

        // when BuildComp is not required, we have full recoverability indeed
        //if (!BuildComp::isBuildCompRequired(M, OSRSrc, LPad,
        //        missingSet, verbose, nullptr)) continue;
        //missingSet.clear();

        // =====> WE NOW INLINE A SIMPLIFIED VERSION OF BuildComp() <=====

        // compute LIVE_IN sets for OSRSrc and LPad
        liveAtOSRSrc = LivenessAnalysis::analyzeLiveInForSeq(OSRSrc->getParent(),
                LA_src->getLiveOutValues(OSRSrc->getParent()), OSRSrc, nullptr);
        liveAtLPad = LivenessAnalysis::analyzeLiveInForSeq(LPad->getParent(),
                LA_dest->getLiveOutValues(LPad->getParent()), LPad, nullptr);

        std::vector<Value*> varWorkList;
        BuildComp::ValueMap availMap, liveAliasMap, deadAvailMap;

        BuildComp::computeAvailableValues(M, src, liveAtOSRSrc, opts, availMap);

        for (const Value* v: liveAtLPad) {
            Value* valToSet = const_cast<Value*>(v);
            if (!availMap.count(valToSet)) {
                // arguments are not interesting for debugging purposes
                if (isa<Argument>(valToSet)) {
                    if (verbose) {
                        std::cerr << "Skipping dead argument ";
                        valToSet->dump();
                    }
                    continue;
                }

                // TODO
                if (sourceInfo->dbgValueInfoMap.count(valToSet)) {
                    varWorkList.push_back(valToSet);
                    deadScalars.insert(valToSet);
                }
            }
        }

        if (varWorkList.empty()) {
            if (verbose) {
                std::cerr << "All live user variables are available!" << std::endl;
            }
            ++allScalarsAreLive;
            continue;
        }

        totDeadUserVars += varWorkList.size();

        if (BuildComp::canUseDeadValues(opts)) {
            BuildComp::computeDeadAvailableValues(M, OSRSrc, src, &BCAD_src,
                    availMap, deadAvailMap, opts);
        }

        if (BuildComp::canUseAliases(opts) && !aliasInfoMap.empty()) {
            // compute alias information after function changes
            BuildComp::computeAvailableAliases(M, OSRSrc, &BCAD_src, aliasInfoMap,
                    liveAtOSRSrc, availMap, liveAliasMap, deadAvailMap, opts);
        }

        std::vector<Instruction*> recList;
        bcStats.reset();

        int oldTotRecoverableUserVars = totRecoverableUserVars;

        for (Value* userVar: varWorkList) {
            bool canReconstruct = BuildComp::reconstructValue(userVar, availMap,
                    liveAliasMap, deadAvailMap, opts, recList, nullptr);

            if (!canReconstruct) {
                if (verbose) {
                    std::cerr << "Could not reconstruct variable: ";
                    userVar->dump();
                }
                continue;
            }

            ++totRecoverableUserVars;
            recoveredScalars.insert(userVar);

            if (recList.empty()) { // local 1:1 mapping information
                Value* valToUse = BuildComp::fetchOperandFromMaps(userVar,
                    availMap, liveAliasMap, deadAvailMap, bcStats);

                if (!valToUse) {
                    // either we have a constant PHI node, or a bug :-)
                    PHINode* PN = cast<PHINode>(userVar);
                    std::set<PHINode*> aliasSetForConstPHI;
                    Value* constPHIval = BuildComp::isPHINodeConstant(PN,
                            &aliasSetForConstPHI);
                    assert (constPHIval && "expected const phi node!");

                    valToUse = BuildComp::isAliasAvailableForConstantPHI(
                            constPHIval, &aliasSetForConstPHI, availMap,
                            liveAliasMap, deadAvailMap, true);

                    assert (valToUse && "broken isAliasAvailableForConstantPHI()?");
                }
            } else {
                // reconstruct the value, which has to be an instruction! TODO always?
                Instruction* userInst = cast<Instruction>(userVar);
                StateMap::CompCode* compCode = BuildComp::buildCompCode(userInst,
                        recList, availMap, liveAliasMap, deadAvailMap, bcStats,
                        opts);
                assert(compCode && "no CompCode object generated");

                delete compCode;
                recList.clear();
            }
        }

        sumRecoverableRatio += (totRecoverableUserVars - oldTotRecoverableUserVars)
                               / (float)varWorkList.size();
    }

    int locsWithDeadVars = locWorkList.size() - allScalarsAreLive;

    std::cerr << "Locations at which all user scalars are available: "
              << allScalarsAreLive << "/" << locWorkList.size() << std::endl;

    std::cerr << "Recoverable dead user scalars (total): "
              << totRecoverableUserVars << "/" << totDeadUserVars << std::endl;

    std::cerr << "Average recoverability ratio: " << std::fixed << std::setprecision(3)
              << sumRecoverableRatio/locsWithDeadVars << std::endl;

    std::cerr << "Average number of dead variables (when any): " << std::fixed
              << std::setprecision(2) << totDeadUserVars/(float)locsWithDeadVars
              << std::endl;

    auto printVarWithDbgInfo = [&sourceInfo](Value* v) {
        std::map<Value*, std::string>::iterator it;

        it = sourceInfo->dbgValueInfoMap.find(v);
        if (it != sourceInfo->dbgValueInfoMap.end()) {
            std::string line;
            raw_string_ostream ss(line);
            v->print(ss);

            line += " ==> ";

            std::string &dbgInfo = it->second;
            int first = 0, last = dbgInfo.length() - 1;

            for (int i = last; i > 0; --i) {
                if (dbgInfo[i] == ']') {
                    last = i;
                } else if (dbgInfo[i] == '[') {
                    if (first) {
                        first = i;
                        break;
                    }
                    first = i;
                }
            }

            line += dbgInfo.substr(first, last-first+1);

            std::cerr << line << std::endl;
        } else {
            v->dump();
        }
    };

    std::cerr << "List of dead scalar variables across all locations:" << std::endl;
    for (Value* v: deadScalars) printVarWithDbgInfo(v);

    std::cerr << "List of (at-least-somewhere) recoverable scalar variables:" << std::endl;
    for (Value* v: recoveredScalars) printVarWithDbgInfo(v);
}
