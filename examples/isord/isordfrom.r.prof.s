	.text
	.file	"isordfrom.r.prof.ll"
	.globl	isordfrom
	.align	16, 0x90
	.type	isordfrom,@function
isordfrom:                              # @isordfrom
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp4:
	.cfi_def_cfa_offset 48
.Ltmp5:
	.cfi_offset %rbx, -48
.Ltmp6:
	.cfi_offset %r12, -40
.Ltmp7:
	.cfi_offset %r13, -32
.Ltmp8:
	.cfi_offset %r14, -24
.Ltmp9:
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movl	$1, %r13d
	cmpq	$1, %r15
	jle	.LBB0_1
# BB#4:
	movq	%r12, %rbx
	.align	16, 0x90
.LBB0_5:                                # %loop.body
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$1001, %r13             # imm = 0x3E9
	je	.LBB0_8
# BB#6:                                 # %loop.body.cont
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	%rbx, %rdi
	leaq	8(%rbx), %rbx
	movq	%rbx, %rsi
	callq	*%r14
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jg	.LBB0_7
# BB#2:                                 # %loop.header
                                        #   in Loop: Header=BB0_5 Depth=1
	incq	%r13
	cmpq	%r15, %r13
	jl	.LBB0_5
# BB#3:
	movl	$1, %eax
	jmp	.LBB0_7
.LBB0_1:
	movl	$1, %eax
.LBB0_7:                                # %exit
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.LBB0_8:                                # %osr
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	isord2to                # TAILCALL
.Ltmp10:
	.size	isordfrom, .Ltmp10-isordfrom
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
