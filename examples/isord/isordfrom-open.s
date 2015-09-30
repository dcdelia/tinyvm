	.text
	.file	"isordfrom-open.ll"
	.globl	isordfromopen
	.align	16, 0x90
	.type	isordfromopen,@function
isordfromopen:                          # @isordfromopen
	.cfi_startproc
# BB#0:                                 # %entry
	movq	%rdx, %rax
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	cmpq	$1, %rcx
	jle	.LBB0_1
# BB#2:                                 # %OSRBlockToisordfromopen_stub
	movl	$1, %r8d
	movq	%rax, %rdi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%rax, %rcx
	jmp	isordstub               # TAILCALL
.LBB0_1:                                # %exit
	movl	$1, %eax
	retq
.Ltmp0:
	.size	isordfromopen, .Ltmp0-isordfromopen
	.cfi_endproc

	.globl	isordstub
	.align	16, 0x90
	.type	isordstub,@function
isordstub:                              # @isordstub
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp3:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp5:
	.cfi_def_cfa_offset 48
.Ltmp6:
	.cfi_offset %rbx, -40
.Ltmp7:
	.cfi_offset %r12, -32
.Ltmp8:
	.cfi_offset %r14, -24
.Ltmp9:
	.cfi_offset %r15, -16
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movl	$4357824, %r8d          # imm = 0x427EC0
	movl	$46993664, %edi         # imm = 0x2CD1100
	movl	$46995056, %esi         # imm = 0x2CD1670
	movl	$47005408, %edx         # imm = 0x2CD3EE0
	movq	%rax, %rcx
	callq	*%r8
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	jmpq	*%rax  # TAILCALL
.Ltmp10:
	.size	isordstub, .Ltmp10-isordstub
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
