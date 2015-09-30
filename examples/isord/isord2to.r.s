	.text
	.file	"isord2to.r.ll"
	.globl	isord2to
	.align	16, 0x90
	.type	isord2to,@function
isord2to:                               # @isord2to
# BB#0:                                 # %osr.entry
	.align	16, 0x90
.LBB0_2:                                # %loop.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rdi,%rdx,8), %rcx
	xorl	%eax, %eax
	cmpq	(%rdi,%rdx,8), %rcx
	jg	.LBB0_3
# BB#1:                                 # %loop.header
                                        #   in Loop: Header=BB0_2 Depth=1
	incq	%rdx
	movl	$1, %eax
	cmpq	%rsi, %rdx
	jl	.LBB0_2
.LBB0_3:                                # %exit
	retq
.Ltmp0:
	.size	isord2to, .Ltmp0-isord2to


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
