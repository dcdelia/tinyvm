#include <stdio.h>

int sumInt(int a, int b) {
    return a + b;
}

int fun_calls(int rounds) {
    int ret = 1;
    int i;

    for (i = 0; i < rounds; ++i) {
        if (i % 10 == 0) {
            printf("Current value after %d rounds: %d\n", i, ret);
        }
        ret = sumInt(i, ret);
    }

    return ret;
}
