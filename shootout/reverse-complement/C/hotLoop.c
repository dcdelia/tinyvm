/* The Computer Language Benchmarks Game
 * http://benchmarksgame.alioth.debian.org/
 *
 * contributed by Bob W
 */

#include <stdio.h>
#include <stdlib.h>

#define JBFSIZE 82      // line input buffer size
#define QBFSIZE 5200     // output buffer initial size
#define Z16     "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
#define V32     "\0TVGH\0\0CD\0\0M\0KN\0\0\0YSA\0BW\0R\0\0\0\0\0\0"
#define VALL    Z16 Z16 Z16 Z16 V32 V32 Z16 Z16 Z16 Z16 Z16 Z16 Z16 Z16

int errex(char *s, int n) {      // error message+value, return 1
  fprintf(stderr,"\n*** Error: %s [%d]!\n", s, n);
  return 1;
}

int hotLoop(FILE* inputFile, char **p_pj, char **p_pq, char **p_pr, char* jjj, char** p_qqq, char** p_pqstop, char* xtab) {
    *p_pj = fgets(jjj, JBFSIZE, inputFile);   // get line from inputFile
    if (!(*p_pj) || (*jjj=='>')) return 1;    // EOF or new ID line
    if (*p_pr <= (*p_pq+61)) {               // need to resize buffer
        char *newstop = *p_pqstop + 12777888;
        char *newptr  = realloc(*p_qqq, newstop-*p_qqq);
        if (!newptr) {
            exit(errex("Out of memory", 0));
        }
        if (newptr != *p_qqq) {             // new base: adj. pointers
            size_t x = newptr-*p_qqq;         // offset for pointer update
            (*p_pq)+=x;
            (*p_pr)+=x;
            (*p_qqq)+=x;
            newstop+=x;
            (*p_pqstop)+=x;
        }
        *p_pr = __builtin_memmove(newstop-(*p_pqstop-*p_pr), *p_pr, *p_pqstop-*p_pr);
        *p_pqstop = newstop;                // buffer resize complete
    }
    while (**p_pj) {                      // LOOP: conv. & revert line
        char c = xtab[(unsigned char)(*(*p_pj)++)];
        if (c)                           // conversion valid
            *(--(*p_pr)) = c;
    }

    return 0;
}

int bench() {                    // ***** main *****
  FILE* inputFile = fopen("shootout/reverse-complement/revcomp-input.txt", "r+");
  FILE* outStream = fopen("revcomp-output.txt", "w+");
  char *pj, *pq, *pr;            // buffer pointers: inp,out,/out
  char *jjj = malloc(JBFSIZE);   // allocate input line buffer
  char *qqq = malloc(QBFSIZE);   // output buffer (dyn. size)
  char *pqstop = qqq+QBFSIZE;    // end-of-buffer pointer
  char xtab[256] = VALL;         // char conversion table

  if (!jjj || !qqq)
    return errex("Buffer allocation", !jjj + !qqq);
  pj = fgets(jjj,JBFSIZE,inputFile);         // fetch 1st line
  if (!pj)
    return errex("No input data",0);
  if (*jjj != '>')
    return errex("1st char not '>'", 0);

  long hotLoopCounter = 0;

  while (pj) {                           // MAIN LOOP: process data
    fputs(jjj, outStream);                  // output ID line

    for (pq=qqq+1, pr=pqstop; ; pq++) {  // LOOP: fill output buffer
        ++hotLoopCounter;
        if (hotLoop(inputFile, &pj, &pq, &pr, jjj, &qqq, &pqstop, xtab)) break;
    }

    for (pq = qqq; pr<pqstop; ) {        // LOOP: format output
      size_t x = (pqstop-pr)<60 ? pqstop-pr : 60;
      __builtin_memmove(pq,pr,x);        // move line to free space
      pr+=x;  pq+=x;  *(pq++) = 0xA;     // adjust pointers, add LF
    }
    fwrite(qqq, 1, pq-qqq, outStream);      // output converted data
  }

  fprintf(stderr, "Number of iterations for hot loop: %ld\n", hotLoopCounter);

  fclose(inputFile);
  fclose(outStream);
  return 0;
}
