	.text
	.file	"isord2.r.ll"
	.globl	isord2
	.align	16, 0x90
	.type	isord2,@function
isord2:                                 # @isord2
	.cfi_startproc
# BB#0:                                 # %entry
	cmpq	$2, %rsi
	jl	.LBB0_1
# BB#4:                                 # %loop.body.preheader
	movq	(%rdi), %rcx
	movl	$1, %edx
	.align	16, 0x90
.LBB0_5:                                # %loop.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, %r8
	movq	(%rdi,%rdx,8), %rcx
	xorl	%eax, %eax
	cmpq	%rcx, %r8
	jg	.LBB0_6
# BB#2:                                 # %loop.header
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%rdx
	cmpq	%rsi, %rdx
	jl	.LBB0_5
# BB#3:
	movl	$1, %eax
	retq
.LBB0_1:
	movl	$1, %eax
	retq
.LBB0_6:                                # %exit
	retq
.Ltmp0:
	.size	isord2, .Ltmp0-isord2
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
