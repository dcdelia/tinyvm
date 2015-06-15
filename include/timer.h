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
#ifdef __cplusplus
}
#endif

#endif
