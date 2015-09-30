#include <stdlib.h>

int isord(long*, long, int (*)(void*,void*));
int isordfrom(long*, long, int (*)(void*,void*));

int cmp(void* a, void* b) {
	return *(long*)a - *(long*)b;
}

int test(int n, int ver) {
    long* v = malloc(n*sizeof(long));
    for (int i=0; i<n; i++) v[i] = i;
    int res;
    if (ver == 0) res = isord(v, n, cmp);
    else          res = isordfrom(v, n, cmp);
    free(v);
    return res;
}

