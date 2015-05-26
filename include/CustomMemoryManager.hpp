#ifndef TINYVM_CUSTOMMEMORYMANAGER_H
#define TINYVM_CUSTOMMEMORYMANAGER_H

#include "llvm/ExecutionEngine/SectionMemoryManager.h"

#include <string>

using namespace llvm;

class MCJITHelper; // mutually recursive

// we leverage on the default SectionMemoryManager for almost all of the tasks
class CustomMemoryManager : public SectionMemoryManager {

public:
    CustomMemoryManager(MCJITHelper *Helper) : TheMCJITHelper(Helper) {}
    virtual ~CustomMemoryManager() {}

    virtual void *getPointerToNamedFunction(const std::string &Name,
                                            bool AbortOnFailure = true);
    
private:
    MCJITHelper *TheMCJITHelper;
};

#endif
