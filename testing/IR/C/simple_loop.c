int simple_loop(int arg1, int arg2) {
    // entry block
    int i = 0, ret = 0;
    goto H;

    // loop header
    H: if (i < arg2) {
        B: ret += arg1;
        ++i;
        goto H;

    } else {
        T: return ret; // arg1 * arg2
    }
}
