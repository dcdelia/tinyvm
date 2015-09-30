CC=clang
CFLAGS=-S -emit-llvm

all: opt.ll opt-O1.ll opt2.ll opt2-O1.ll

opt.ll: opt.c
	$(CC) $(CFLAGS) opt.c -o tmp.ll
	opt -S -mem2reg -simplifycfg tmp.ll > opt.ll
	$(CC) -S opt.ll
	rm -f tmp.ll

opt-O1.ll: opt.ll
	opt -S -O1 opt.ll > opt-O1.ll
	$(CC) -S -O1 opt-O1.ll

opt2.ll: opt2.c
	$(CC) $(CFLAGS) opt2.c -o tmp.ll
	opt -S -mem2reg -simplifycfg tmp.ll > opt2.ll
	$(CC) -S opt2.ll
	rm -f tmp.ll

opt2-O1.ll: opt2.ll
	opt -S -O1 opt2.ll > opt2-O1.ll
	$(CC) -S -O1 opt2-O1.ll

.PHONY: clean

clean:
	rm -f opt.ll opt-O1.ll opt2.ll opt2-O1.ll *.s

