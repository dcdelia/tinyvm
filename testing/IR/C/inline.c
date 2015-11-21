#include <stdlib.h>

int longCmp(void* a, void* b) {
    long la = (long)a;
    long lb = (long)b;
    return la - lb;
}

int isord(long* v, long n, int (*c)(void* a, void* b)) {
    for (long i=0; i<n-1; i++)
        if (c(v+i,v+i+1)>0) return 0;
    return 1;
}

int driver(int n) {
    long* v = malloc(n*sizeof(long));
    for (int i=0; i<n; i++) v[i] = i;
    int res = isord(v, (long)n, longCmp);
    free(v);
    return res;
}
