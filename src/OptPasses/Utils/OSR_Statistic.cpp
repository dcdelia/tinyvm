/*
 * A stripped-down version of LLVM's Statistic class with counter reset support
 */

#include "OptPasses.hpp"

#include <llvm/ADT/StringExtras.h>
#include <llvm/Support/Format.h>
#include <llvm/Support/raw_os_ostream.h>

#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

using namespace llvm;

std::vector<OSR_Statistic*> OSR_Statistic::statistics;

OSR_Statistic::OSR_Statistic(const char* Name, const char* Desc, int Value) {
    this->Name = Name;
    this->Desc = Desc;
    this->Value = Value;
    this->Initialized = false;
}

OSR_Statistic& OSR_Statistic::init() {
    if (!Initialized) {
        Initialized = true;
        assert(std::find(statistics.begin(), statistics.end(), this)
                == statistics.end() && "already initialized OSR_Statistic");
        statistics.push_back(this);
    }
    return *this;
}

// adapted from llvm::PrintStatistics()
void OSR_Statistic::printStats() {
    raw_os_ostream OS(std::cerr);
 
    // Figure out how long the biggest Value and Name fields are.
    unsigned MaxNameLen = 0, MaxValLen = 0;
    for (OSR_Statistic* S: statistics) {
        MaxValLen = std::max(MaxValLen, (unsigned)utostr(S->Value).size());
        MaxNameLen = std::max(MaxNameLen, (unsigned) std::strlen(S->Name));
    }

    // Sort the fields by name.
    std::stable_sort(statistics.begin(), statistics.end(),
            [](const OSR_Statistic *LHS, const OSR_Statistic * RHS) {
                if (int Cmp = std::strcmp(LHS->Name, RHS->Name))
                    return Cmp < 0;

                // Secondary key is the description.
                return std::strcmp(LHS->Desc, RHS->Desc) < 0;
            });

    // Print out the statistics header...
    OS << "===" << std::string(73, '-') << "===\n"
       << "                          ... Statistics Collected ...\n"
       << "===" << std::string(73, '-') << "===\n\n";

    // Print all of the statistics.
    for (OSR_Statistic* S: statistics) {
        OS << format("%*u %-*s - %s\n",
            MaxValLen, S->Value,
            MaxNameLen, S->Name,
            S->Desc);
    }

    OS << '\n'; // Flush the output stream.
    OS.flush();
}

void OSR_Statistic::resetStats() {
    for (OSR_Statistic* S : statistics) {
        S->Value = 0;
        S->Initialized = false;
    }
    statistics.clear();
}