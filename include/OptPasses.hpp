/* ===============================================================
 * Optimization passes supported by the OSR library.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_OPTPASSES_HPP
#define	TINYVM_OPTPASSES_HPP

#include <llvm/Pass.h>
#include <llvm/PassSupport.h>

/* Adapted LLVM passes */
llvm::FunctionPass* OSR_createAggressiveDCEPass();
llvm::FunctionPass* OSR_createDeadCodeEliminationPass();
llvm::FunctionPass* OSR_createConstantPropagationPass();
llvm::FunctionPass* OSR_createSinkingPass();
llvm::FunctionPass* OSR_createEarlyCSEPass();

/* Adaptation of LLVM's internal macros*/
#define OSR_INITIALIZE_PASS(passName, arg, name, cfg, analysis) \
  static void* initialize##passName##PassOnce(PassRegistry &Registry) { \
    PassInfo *PI = new PassInfo(name, arg, & passName ::ID, \
      PassInfo::NormalCtor_t(callDefaultCtor< passName >), cfg, analysis); \
    Registry.registerPass(*PI, true); \
    return PI; \
  } \
  void initialize##passName##Pass(PassRegistry &Registry) { \
    CALL_ONCE_INITIALIZATION(initialize##passName##PassOnce) \
  }

#define OSR_INITIALIZE_PASS_BEGIN       INITIALIZE_PASS_BEGIN
#define OSR_INITIALIZE_PASS_DEPENDENCY  INITIALIZE_PASS_DEPENDENCY
#define OSR_INITIALIZE_AG_DEPENDENCY    INITIALIZE_AG_DEPENDENCY

#define OSR_INITIALIZE_PASS_END(passName, arg, name, cfg, analysis) \
    PassInfo *PI = new PassInfo(name, arg, & passName ::ID, \
      PassInfo::NormalCtor_t(callDefaultCtor< passName >), cfg, analysis); \
    Registry.registerPass(*PI, true); \
    return PI; \
  } \
  void initialize##passName##Pass(PassRegistry &Registry) { \
    CALL_ONCE_INITIALIZATION(initialize##passName##PassOnce) \
  }

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