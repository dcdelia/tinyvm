	.text
	.file	"opt2.ll"
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
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	$2, %eax
	movl	%eax, %edx
	movq	%rsi, %rax
	movq	%rdx, -8(%rbp)          # 8-byte Spill
	cqto
	movq	-8(%rbp), %rsi          # 8-byte Reload
	idivq	%rsi
	movq	%rcx, %r8
	movq	%rdi, -16(%rbp)         # 8-byte Spill
	movq	%r8, -24(%rbp)          # 8-byte Spill
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax         # 8-byte Reload
	movq	-24(%rbp), %rcx         # 8-byte Reload
	movl	$1, %edx
	movq	-32(%rbp), %rsi         # 8-byte Reload
	cmpq	%rsi, %rcx
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movl	%edx, -60(%rbp)         # 4-byte Spill
	jge	.LBB0_4
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx         # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	(%rcx,%rdx,8), %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	cmpq	(%rcx,%rdi,8), %rsi
	movl	%eax, -60(%rbp)         # 4-byte Spill
	jg	.LBB0_4
# BB#3:                                 #   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	addq	$2, %rcx
	movq	%rax, -24(%rbp)         # 8-byte Spill
	movq	%rcx, -40(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_4:
	movl	-60(%rbp), %eax         # 4-byte Reload
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
