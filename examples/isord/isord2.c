int isord2(long* v, long n) {
    for (long i=1; i<n; i++) 
        if (v[i-1]>v[i]) return 0;
    return 1;
}
