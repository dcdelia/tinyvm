#ifndef TINYVM_STACKMAP_H
#define TINYVM_STACKMAP_H

#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/JITEventListener.h"
#include "llvm/Object/ObjectFile.h"

#include <stdint.h>
#include <vector>

using namespace llvm;

typedef struct StackMap StackMap;

class StackMapJITEventListener : public JITEventListener {
public:
    StackMapJITEventListener(std::vector<StackMap*> *v) : Maps(v) {}
    virtual void NotifyObjectEmitted(const object::ObjectFile &Obj,
                                     const RuntimeDyld::LoadedObjectInfo &L);
private:
    std::vector<StackMap*> *Maps;
    StackMap* parseStackMapFromAddress(uint64_t stackMapAddress, uint64_t expectedSize);
    
};

// RegNum parsing
/*
const char* dwarfRegNamesX86_64[] = {
    "%rax", "%rdx", "%rcx", "%rbx", "%rsi", "%rdi", "%rbp", "%rsp",
    "%r8",  "%r9",  "%r10", "%r11", "%r12", "%r13", "%r14", "%r15",
};
*/



struct StackMap {

    struct __attribute__((__packed__)) StackSizeRecord {
        uint64_t functionOffset;
        uint64_t stackSize;
    };
    
    struct StackMapRecord {

        struct __attribute__((__packed__)) Location { // 64 bytes
            enum LocationType : uint8_t {
                Register = 0x1,
                Direct = 0x2,
                Indirect = 0x3,
                Constant = 0x4,
                ConstIndex = 0x5,
            } type;

            uint8_t     locationFlags;
            uint16_t    registerNum;
            int32_t     offsetOrSmallConstant;            
        };

        struct __attribute__((__packed__)) LiveOut { // 32 bytes
            uint16_t    registerNum;
            uint8_t     reserved;
            uint8_t     sizeInBytes;
        };

        uint64_t    id;
        uint32_t    instructionOffset;
        uint16_t    flags;
        uint16_t    numLocations;
        std::vector<Location>   locations;
        //uint16_t    padding;
        uint16_t    numLiveOuts;
        std::vector<LiveOut>    liveOuts;
        //uint32_t    optionalPadding; // padding to 8-byte boundary
    };

    uint32_t header; // only first 8 bits are used
    uint32_t numFunctions;
    uint32_t numConstants;
    uint32_t numRecords;
    std::vector<StackSizeRecord> stackSizeRecords; 
    std::vector<uint64_t> largeConstants;
    std::vector<StackMapRecord*> stackMapRecords; // we use pointers here
};
    
#endif
