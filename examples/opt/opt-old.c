int f(long* v, long n, long c) {
    for (long i=0; i<n; i++)
        if (v[i]>n/c*i) return 0;
    return 1;
}

