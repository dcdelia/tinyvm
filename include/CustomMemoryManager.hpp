/* ===============================================================
 * A simple memory manager for LLVM's ExecutionEngine.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
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