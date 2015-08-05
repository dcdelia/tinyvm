#include "CustomMemoryManager.hpp"
#include "MCJITHelper.hpp"

#include "llvm/Support/ErrorHandling.h"

#include <iostream>
#include <string>

void* CustomMemoryManager::getPointerToNamedFunction(const std::string &Name, bool AbortOnFailure) {
    // try the standard symbol resolution first
    void *ptr = SectionMemoryManager::getPointerToNamedFunction(Name, false);
    if (ptr) return ptr;

    ptr = (void*)TheMCJITHelper->JIT->getFunctionAddress(Name);
    if (!ptr && AbortOnFailure) {
        char errorMsg[256];
        sprintf(errorMsg, "Could not get pointer to named function %s\n", Name.c_str());
        llvm::report_fatal_error(std::string(errorMsg));
    } else {
        std::cerr << "Symbol solved using CMM" << std::endl;  // TODO debug
    }
    return ptr;
}
