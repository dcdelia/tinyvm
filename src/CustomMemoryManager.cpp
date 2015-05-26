#include "CustomMemoryManager.hpp"
#include "MCJITHelper.hpp"

#include <iostream>
#include <string>

void* CustomMemoryManager::getPointerToNamedFunction(const std::string &Name, bool AbortOnFailure) {
    // try the standard symbol resolution first
    void *ptr = SectionMemoryManager::getPointerToNamedFunction(Name, false);
    if (ptr) return ptr;

    ptr = (void*)TheMCJITHelper->JIT->getFunctionAddress(Name);
    if (!ptr && AbortOnFailure) {
        // TODO
    } else {
        std::cerr << "Symbol solved using CMM";  // TODO debug
    }
    return ptr;
}
