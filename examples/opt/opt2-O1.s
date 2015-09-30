	.text
	.file	"opt2-O1.ll"
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
	cmpq	$2, %rsi
	jl	.LBB0_4
# BB#1:
	movq	%rsi, %r8
	shrq	$63, %r8
	addq	%rsi, %r8
	sarq	%r8
	movq	%rdi, %rsi
	.align	16, 0x90
.LBB0_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rsi), %rdx
	jg	.LBB0_5
# BB#3:                                 #   in Loop: Header=BB0_2 Depth=1
	incq	%rcx
	addq	$16, %rsi
	cmpq	%r8, %rcx
	jl	.LBB0_2
.LBB0_4:
	movl	$1, %eax
.LBB0_5:                                # %._crit_edge
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
