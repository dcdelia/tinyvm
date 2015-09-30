	.text
	.file	"isord.ll"
	.globl	isord
	.align	16, 0x90
	.type	isord,@function
isord:                                  # @isord
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp4:
	.cfi_def_cfa_offset 48
.Ltmp5:
	.cfi_offset %rbx, -40
.Ltmp6:
	.cfi_offset %r12, -32
.Ltmp7:
	.cfi_offset %r14, -24
.Ltmp8:
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movl	$1, %r12d
	cmpq	$1, %r15
	jle	.LBB0_1
	.align	16, 0x90
.LBB0_4:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	leaq	8(%rbx), %rbx
	movq	%rbx, %rsi
	callq	*%r14
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jg	.LBB0_5
# BB#2:                                 #   in Loop: Header=BB0_4 Depth=1
	incq	%r12
	cmpq	%r15, %r12
	jl	.LBB0_4
# BB#3:
	movl	$1, %eax
	jmp	.LBB0_5
.LBB0_1:
	movl	$1, %eax
.LBB0_5:                                # %._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Ltmp9:
	.size	isord, .Ltmp9-isord
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
