int block_sequence(int arg1, int arg2) {
    // entry block
    int c, d, e, f, g, h;
    c = arg1 + 1;
    d = arg2 - 1;
    goto B1;

    B1: e = c + d;  // e == arg1 + arg2
    f = c - d;      // f == arg1 - arg2
    goto B2;

    B2: g = (e + f)/2 ; // g == arg1
    h = (e - f)/2;      // h == arg2
    return g + h;
}
