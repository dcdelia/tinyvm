	.text
	.file	"IR:optm.ll"
	.globl	f
	.align	16, 0x90
	.type	f,@function
f:
	.cfi_startproc
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	xorl	%ecx, %ecx
	movq	%rsi, %r8
	shrq	$63, %r8
	addq	%rsi, %r8
	sarq	%r8
	movq	%rdi, %rsi
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_3:
	incq	%rcx
	addq	$16, %rsi
.LBB0_1:
	movl	$1, %eax
	cmpq	%r8, %rcx
	jge	.LBB0_4
	movq	(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rsi), %rdx
	jle	.LBB0_3
.LBB0_4:
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
	.text
	.file	"IR:optm.ll"
	.globl	f
	.align	16, 0x90
	.type	f,@function
f:
	.cfi_startproc
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	xorl	%ecx, %ecx
	movq	%rsi, %r8
	shrq	$63, %r8
	addq	%rsi, %r8
	sarq	%r8
	movq	%rdi, %rsi
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_3:
	incq	%rcx
	addq	$16, %rsi
.LBB0_1:
	movl	$1, %eax
	cmpq	%r8, %rcx
	jge	.LBB0_4
	movq	(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rsi), %rdx
	jle	.LBB0_3
.LBB0_4:
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc

	.globl	ffrom_stub
	.align	16, 0x90
	.type	ffrom_stub,@function
ffrom_stub:
	.cfi_startproc
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
.Ltmp7:
	.cfi_offset %rbx, -48
.Ltmp8:
	.cfi_offset %r12, -40
.Ltmp9:
	.cfi_offset %r14, -32
.Ltmp10:
	.cfi_offset %r15, -24
	movq	%r8, %r14
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	$28630272, -56(%rbp)
	movq	$28634384, -48(%rbp)
	movq	$28634480, -40(%rbp)
	movl	$4357728, %ecx
	leaq	-56(%rbp), %rdi
	movq	%rax, %rsi
	callq	*%rcx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	callq	*%rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Ltmp11:
	.size	ffrom_stub, .Ltmp11-ffrom_stub
	.cfi_endproc

	.globl	ffrom
	.align	16, 0x90
	.type	ffrom,@function
ffrom:
	.cfi_startproc
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	movq	%rsi, %r9
	movq	%rdi, %rdx
	xorl	%ecx, %ecx
	shrq	$63, %rsi
	addq	%r9, %rsi
	sarq	%rsi
	movb	$1, %r10b
	movq	%rdx, %r8
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_4:
	incq	%rcx
	addq	$16, %r8
.LBB2_1:
	movl	$1, %eax
	cmpq	%rsi, %rcx
	jge	.LBB2_5
	testb	%r10b, %r10b
	jne	.LBB2_6
	movq	(%rdx,%rcx,8), %rdi
	xorl	%eax, %eax
	cmpq	(%r8), %rdi
	jle	.LBB2_4
.LBB2_5:
	popq	%rbp
	retq
.LBB2_6:
	movabsq	$ffrom_stub, %rax
	xorl	%edi, %edi
	movq	%rdx, %rsi
	movq	%r9, %rdx
	callq	*%rax
	popq	%rbp
	retq
.Ltmp15:
	.size	ffrom, .Ltmp15-ffrom
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
