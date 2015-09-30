	.text
	.file	"<stdin>"
	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# BB#0:                                 # %L0
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
.LBB0_3:                                # %L3
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%rcx
	addq	$16, %rsi
.LBB0_1:                                # %L1
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %eax
	cmpq	%r8, %rcx
	jge	.LBB0_4
# BB#2:                                 # %L2
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	(%rdi,%rcx,8), %rdx
	xorl	%eax, %eax
	cmpq	(%rsi), %rdx
	jle	.LBB0_3
.LBB0_4:                                # %L4
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
