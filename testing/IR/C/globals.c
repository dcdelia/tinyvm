#include <stdio.h>
int counter = 0;

int iterate(int numIt) {
    int i;
    for (i = 0; i < numIt; ++i) {
        counter++;
    }

    return counter;
}
