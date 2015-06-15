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
    fprintf(stderr, "Elapsed time: %ld s %ld nsec\n", seconds, nanoseconds);
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
