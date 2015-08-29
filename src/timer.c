/* ===============================================================
 * A simple C module for performance measurements.
 *
 * Author:      (C) 2015 Daniele Cono D'Elia
 * License:     See the end of this file for license information
 * =============================================================== */
#include "timer.h"

#include <stdio.h>
#include <time.h>
#include <sys/time.h>

// TODO: this is C code!

void timer_start(tinyvm_timer_t* timer) {
    #if USE_GETTIMEOFDAY == 1
    gettimeofday(&(timer->tv_start), NULL);
    #else
    clock_gettime(GETTIME_SOURCE, &(timer->ts_start));
    #endif
}

void timer_end(tinyvm_timer_t* timer) {
    #if USE_GETTIMEOFDAY == 1
    gettimeofday(&(timer->tv_end), NULL);
    #else
    clock_gettime(GETTIME_SOURCE, &(timer->ts_end));
    #endif
}

void timer_print_elapsed(tinyvm_timer_t* timer) {
    #if USE_GETTIMEOFDAY == 1
    long seconds = timer->tv_end.tv_sec - timer->tv_start.tv_sec;
    long microseconds = timer->tv_end.tv_usec - timer->tv_start.tv_usec;
    if (microseconds < 0) {
        --seconds;
        microseconds = 1000000 + microseconds;
    }
    fprintf(stderr, "Elapsed time: %ld s %ld usec\n", seconds, microseconds);
    #else
    long seconds = timer->ts_end.tv_sec - timer->ts_start.tv_sec;
    long nanoseconds = timer->ts_end.tv_nsec - timer->ts_start.tv_nsec;
    if (nanoseconds < 0) {
        --seconds;
        nanoseconds = 1000000000 + nanoseconds;
    }

    long m = seconds / 60;
    long s = seconds % 60;
    long ms = nanoseconds / 1000000;
    long us = (nanoseconds / 1000) % 1000;
    long ns = nanoseconds % 1000;

    //fprintf(stderr, "Elapsed time: %ld s %ld nsec\n", seconds, nanoseconds);
    fprintf(stderr, "Elapsed time: %ld m %ld s %ld ms %ld us %ld ns\n", m, s, ms, us, ns);
    #endif
}

void timer_print_avg(tinyvm_timer_t* timer, int iterations) {
   #if USE_GETTIMEOFDAY == 1
    long seconds = timer->tv_end.tv_sec - timer->tv_start.tv_sec;
    long microseconds = timer->tv_end.tv_usec - timer->tv_start.tv_usec;
    if (microseconds < 0) {
        --seconds;
        microseconds = 1000000 + microseconds;
    }
    microseconds = microseconds / iterations;
    microseconds += (seconds % iterations) * (1000000 / iterations);
    seconds = seconds / iterations;

    fprintf(stderr, "Avg elapsed time per iteration: %ld s %ld usec\n", seconds, microseconds);
    #else
    long seconds = timer->ts_end.tv_sec - timer->ts_start.tv_sec;
    long nanoseconds = timer->ts_end.tv_nsec - timer->ts_start.tv_nsec;
    if (nanoseconds < 0) {
        --seconds;
        nanoseconds = 1000000000 + nanoseconds;
    }
    nanoseconds = nanoseconds / iterations;
    nanoseconds += (seconds % iterations) * (1000000000 / iterations);
    seconds = seconds / iterations;

    fprintf(stderr, "Avg elapsed time per iteration: %ld s %ld nsec\n", seconds, nanoseconds);
    #endif
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