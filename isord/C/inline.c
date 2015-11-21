#include <stdlib.h>

int cmp(void* a, void* b) {
    return *(long*)a - *(long*)b;
}

int isord(long* v, long n, int (*c)(void* a, void* b)) {
    for (long i=1; i<n; i++)
        if (c(v+i-1,v+i)>0) return 0;
    return 1;
}

int driver(int n) {
    long* v = malloc(n*sizeof(long));
    for (int i=0; i<n; i++) v[i] = i;
    int res = isord(v, n, cmp);
    free(v);
    return res;
}

