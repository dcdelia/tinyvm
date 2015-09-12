/* ===============================================================
 * A simple C module for performance measurements.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */

#ifndef TINYVM_TIMER_H
#define TINYVM_TIMER_H

#include <time.h>
#include <sys/time.h>

#define USE_GETTIMEOFDAY    0
#define GETTIME_SOURCE      CLOCK_PROCESS_CPUTIME_ID

typedef struct tinyvm_timer_s {
    #if USE_GETTIMEOFDAY == 1
    struct timeval  tv_start;
    struct timeval  tv_end;
    #else
    struct timespec ts_start;
    struct timespec ts_end;
    #endif
} tinyvm_timer_t;

#ifdef __cplusplus
extern "C" {
#endif
    void timer_start(tinyvm_timer_t* timer);
    void timer_end(tinyvm_timer_t* timer);
    void timer_print_elapsed(tinyvm_timer_t* timer);
    void timer_print_avg(tinyvm_timer_t* timer, int iterations);
    double timer_get_elapsed(tinyvm_timer_t* timer);
#ifdef __cplusplus
}
#endif

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