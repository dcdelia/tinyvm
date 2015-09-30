/* ===============================================================
 * Code for parsing LLVM StackMaps.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * Credits:     The Pyston project
 * License:     See the end of this file for license information
 * =============================================================== */
#include "StackMap.hpp"

#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/JITEventListener.h>
#include <llvm/Object/ObjectFile.h>

#include <cstdint>

using namespace llvm;

void StackMapJITEventListener::NotifyObjectEmitted(const object::ObjectFile &Obj,
                                                   const RuntimeDyld::LoadedObjectInfo &LoadedObj) {
    std::error_code errorCode;

    for (const object::SectionRef& section: Obj.sections()) {
        StringRef name;
        errorCode = section.getName(name);
        assert(!errorCode);

        if (name == ".llvm_stackmaps") {
            uint64_t stackMapAddress = LoadedObj.getSectionLoadAddress(name);
            assert(stackMapAddress > 0);

            uint64_t expectedSize = section.getSize(); // check is made by the callee
            StackMap *map = parseStackMapFromAddress(stackMapAddress, expectedSize);

            Maps->push_back(map);
        }
    }
}

// adapted from stackmaps.cpp from the Pyston project
inline StackMap* StackMapJITEventListener::parseStackMapFromAddress(uint64_t stackMapAddress, uint64_t expectedSize) {
    StackMap *map = new StackMap();

    union {
        const int8_t* i8;
        const int16_t* i16;
        const int32_t* i32;
        const int64_t* i64;
        const uint8_t* u8;
        const uint16_t* u16;
        const uint32_t* u32;
        const uint64_t* u64;
        const StackMap::StackSizeRecord* size_record;
        const StackMap::StackMapRecord::Location* record_loc;
        const StackMap::StackMapRecord::LiveOut* record_liveout;
    } ptr;

    const int8_t* startPtr = ptr.i8 = (const int8_t*)stackMapAddress;

    map->header         = *ptr.u32++;
    map->numFunctions   = *ptr.u32++; // LLVMREV >= 200481
    map->numConstants   = *ptr.u32++;
    map->numRecords     = *ptr.u32++;

    /* Exploit struct definition to read from memory! */

    for (int i = 0; i < map->numFunctions; ++i) {
        const StackMap::StackSizeRecord& size_record = *ptr.size_record++; // TODO & ???
        map->stackSizeRecords.push_back(size_record);
    }

    for (int i = 0; i < map->numConstants; ++i) {
        uint64_t constant = *ptr.u64++;
        map->largeConstants.push_back(constant);
    }

    for (int i = 0; i < map->numRecords; ++i) {
        StackMap::StackMapRecord* record = new StackMap::StackMapRecord();
        map->stackMapRecords.push_back(record);

        record->id                  = *ptr.u64++;
        record->instructionOffset   = *ptr.u32++;
        record->flags               = *ptr.u16++;
        record->numLocations        = *ptr.u16++;

        for (int j = 0; j < record->numLocations; ++j) {
            assert(sizeof(StackMap::StackMapRecord::Location) == sizeof(*ptr.u64));
            const StackMap::StackMapRecord::Location& r = *ptr.record_loc++;
            record->locations.push_back(r);
        }

        ptr.u16++; // padding

        record->numLiveOuts = *ptr.u16++;
        for (int j = 0; j < record->numLiveOuts; ++j) {
            const StackMap::StackMapRecord::LiveOut& r = *ptr.record_liveout++;
            record->liveOuts.push_back(r);
        }

        if (record->numLiveOuts % 2 == 0) ptr.u32++; // pad to 8-byte boundary
    }

    assert(ptr.i8 - startPtr == expectedSize);

    return map;
}

/*
 * OSR library for LLVM. Copyright (C) 2015 Daniele Cono D'Elia
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 3 of the License, or (at your option) any
 * later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
*/