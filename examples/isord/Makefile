CC=clang
CFLAGS=-S -emit-llvm
TVM=../../tinyvm

all: test.ll isord.ll isord2.ll

run:
	$(TVM) run.tvm

gen-osr:
	$(TVM) script.tvm
	$(TVM) script2.tvm
	$(TVM) script-open.tvm

gen-osr-asm:
	$(TVM) script-asm.tvm
	$(TVM) script2-asm.tvm

test.ll: test.c
	$(CC) $(CFLAGS) test.c -O1

isord.ll: isord.c
	$(CC) $(CFLAGS) isord.c -O1

isord2.ll: isord2.c
	$(CC) $(CFLAGS) isord2.c -O1

.PHONY: clean, run-tvm

clean:
	rm -f test.ll isord.ll isord2.ll
