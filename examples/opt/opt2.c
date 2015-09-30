int f(long* v, long n) {
    for (long i=0, j=0, m=n/2; i<m; i++, j+=2)
        if (v[i]>v[j]) return 0;
    return 1;
}
