/* ===============================================================
 * Location mapper component for the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_LOCMAPPER_HPP
#define	TINYVM_LOCMAPPER_HPP

#include <llvm/IR/Function.h>
#include <map>

class LocMapper {
public:
    LocMapper() {}

    static LocMapper* getLocMapper(llvm::Function &F);
    static LocMapper* createLocMapper(llvm::Function &F);
    static bool hasLocMapper(llvm::Function &F);
    static void removeLocMapper(llvm::Function &F);
private:
    // Metadata attached to function have been introduced only since LLVM 3.7.0,
    // thus for the time being we rely on a simple static map object.
    typedef std::map<llvm::Function*, LocMapper*> GlobalMap;
    static GlobalMap globalMap;
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