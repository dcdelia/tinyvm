void osr();

int isord(long* v, long n, int (*c)(void* a, void* b)) {
    long p = 10000;
    for (long i=1; i<n; i++) {
        if (!p--) osr();
        if (c(v+i-1,v+i)>0) return 0;
    }
    return 1;
}
