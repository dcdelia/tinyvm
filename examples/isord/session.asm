	.text
	.file	"IR:isord2.ll"
	.globl	isord2
	.align	16, 0x90
	.type	isord2,@function
isord2:
	.cfi_startproc
	movl	$1, %ecx
	cmpq	$1, %rsi
	jle	.LBB0_1
	.align	16, 0x90
.LBB0_4:
	movq	-8(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rdi,%rcx,8), %rdx
	jg	.LBB0_5
	incq	%rcx
	cmpq	%rsi, %rcx
	jl	.LBB0_4
	movl	$1, %eax
	retq
.LBB0_1:
	movl	$1, %eax
	retq
.LBB0_5:
	retq
.Ltmp0:
	.size	isord2, .Ltmp0-isord2
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
	.text
	.file	"IR:isord2.ll"
	.globl	isord2
	.align	16, 0x90
	.type	isord2,@function
isord2:
	.cfi_startproc
	movl	$1, %ecx
	cmpq	$1, %rsi
	jle	.LBB0_1
	.align	16, 0x90
.LBB0_4:
	movq	-8(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rdi,%rcx,8), %rdx
	jg	.LBB0_5
	incq	%rcx
	cmpq	%rsi, %rcx
	jl	.LBB0_4
	movl	$1, %eax
	retq
.LBB0_1:
	movl	$1, %eax
	retq
.LBB0_5:
	retq
.Ltmp0:
	.size	isord2, .Ltmp0-isord2
	.cfi_endproc

	.globl	isord2to
	.align	16, 0x90
	.type	isord2to,@function
isord2to:
	.cfi_startproc
	.align	16, 0x90
.LBB1_2:
	movq	-8(%rdi,%rdx,8), %rcx
	xorl	%eax, %eax
	cmpq	(%rdi,%rdx,8), %rcx
	jg	.LBB1_3
	incq	%rdx
	movl	$1, %eax
	cmpq	%rsi, %rdx
	jl	.LBB1_2
.LBB1_3:
	retq
.Ltmp1:
	.size	isord2to, .Ltmp1-isord2to
	.cfi_endproc

	.globl	isord2from
	.align	16, 0x90
	.type	isord2from,@function
isord2from:
	.cfi_startproc
	pushq	%rax
.Ltmp2:
	.cfi_def_cfa_offset 16
	movl	$1, %edx
	cmpq	$1, %rsi
	jle	.LBB2_1
	movb	$1, %r8b
	.align	16, 0x90
.LBB2_5:
	testb	%r8b, %r8b
	jne	.LBB2_8
	movq	-8(%rdi,%rdx,8), %rcx
	xorl	%eax, %eax
	cmpq	(%rdi,%rdx,8), %rcx
	jg	.LBB2_7
	incq	%rdx
	cmpq	%rsi, %rdx
	jl	.LBB2_5
	movl	$1, %eax
	popq	%rdx
	retq
.LBB2_1:
	movl	$1, %eax
	popq	%rdx
	retq
.LBB2_8:
	movabsq	$isord2to, %rax
	callq	*%rax
	popq	%rdx
	retq
.LBB2_7:
	popq	%rdx
	retq
.Ltmp3:
	.size	isord2from, .Ltmp3-isord2from
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
