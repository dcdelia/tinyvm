/* The Computer Language Benchmarks Game
 * http://benchmarksgame.alioth.debian.org/

   contributed by Greg Buchholz

   for the debian (AMD) machine...
   compile flags:  -O3 -ffast-math -march=athlon-xp -funroll-loops

   for the gp4 (Intel) machine...
   compile flags:  -O3 -ffast-math -march=pentium4 -funroll-loops
*/

#include <stdio.h>

void hotLoop(int w, int h, double x, double y, double* p_Cr, double* p_Ci,
        int iter,double* p_Tr, double* p_Ti, double limit, double* p_Zr,
        double* p_Zi, char* p_byte_acc, int* p_bit_num, FILE* outStream) {
    *p_Cr = (2.0*x/w - 1.5);
    *p_Ci = (2.0*y/h - 1.0);

    int i;
    for (i=0; i<iter && (*p_Tr+*p_Ti <= limit*limit); ++i) {
        *p_Zi = 2.0*(*p_Zr)*(*p_Zi) + *p_Ci;
        *p_Zr = *p_Tr - *p_Ti + *p_Cr;
        *p_Tr = (*p_Zr) * (*p_Zr);
        *p_Ti = (*p_Zi) * (*p_Zi);
    }

    *p_byte_acc <<= 1;
    if(*p_Tr+*p_Ti <= limit*limit) *p_byte_acc |= 0x01;

    ++(*p_bit_num);

    if(*p_bit_num == 8) {
        putc(*p_byte_acc, outStream);
        *p_byte_acc = 0;
        *p_bit_num = 0;
    } else if(x == w-1) {
        *p_byte_acc <<= (8-w%8);
        putc(*p_byte_acc, outStream);
        *p_byte_acc = 0;
        *p_bit_num = 0;
    }
}

int bench(int inputN)
{
    int w, h, bit_num = 0;
    char byte_acc = 0;
    int iter = 50;
    double x, y, limit = 2.0;
    double Zr, Zi, Cr, Ci, Tr, Ti;

    w = h = inputN;

    char filename[64];
    sprintf(filename, "mandelbrot-%d.txt", w);
    FILE* outStream = fopen(filename, "w+");

    printf("P4\n%d %d\n",w,h);

    for(y=0;y<h;++y)
    {
        for(x=0;x<w;++x)
        {
            Zr = Zi = Tr = Ti = 0.0;
            hotLoop(w, h, x, y, &Cr, &Ci, iter, &Tr, &Ti, limit, &Zr, &Zi, &byte_acc, &bit_num, outStream);
        }
    }

    fclose(outStream);

    return 0;
}
