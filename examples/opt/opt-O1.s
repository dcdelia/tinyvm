	.text
	.file	"opt-O1.ll"
	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	xorl	%ecx, %ecx
	cmpq	$1, %rsi
	jle	.LBB0_1
# BB#4:
	movq	%rsi, %r8
	shrq	$63, %r8
	addq	%rsi, %r8
	sarq	%r8
	movq	%rdi, %rsi
	.align	16, 0x90
.LBB0_5:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rsi), %rdx
	jg	.LBB0_6
# BB#2:                                 #   in Loop: Header=BB0_5 Depth=1
	incq	%rcx
	addq	$16, %rsi
	cmpq	%r8, %rcx
	jl	.LBB0_5
# BB#3:
	movl	$1, %eax
	popq	%rbp
	retq
.LBB0_1:
	movl	$1, %eax
	popq	%rbp
	retq
.LBB0_6:                                # %._crit_edge
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
