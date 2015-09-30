int f(long* v, long n) {
    for (long i=0; i<n/2; i++)
        if (v[i]>v[2*i]) return 0;
    return 1;
}
