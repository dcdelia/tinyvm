CC=clang
CFLAGS=-S -emit-llvm

all: fac.ll fac-O1.ll

fac.ll: fac.c
        $(CC) $(CFLAGS) fac.c -o tmp.ll
        opt -S -mem2reg tmp.ll > fac.ll
        rm tmp.ll

fac-O1.ll: fac.c
        $(CC) $(CFLAGS) fac.c -O1 -o fac-O1.ll

.PHONY: clean

clean:
        rm -f fac.ll fac-O1.ll

