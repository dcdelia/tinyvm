	.text
	.file	"opt.ll"
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
	movq	%rdi, -8(%rbp)          # 8-byte Spill
	movq	%rsi, -16(%rbp)         # 8-byte Spill
	movq	%rcx, -24(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax         # 8-byte Reload
	movl	$1, %ecx
	movl	$2, %edx
	movl	%edx, %esi
	movq	-16(%rbp), %rdi         # 8-byte Reload
	movq	%rax, -32(%rbp)         # 8-byte Spill
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	movq	-32(%rbp), %rsi         # 8-byte Reload
	cmpq	%rax, %rsi
	movl	%ecx, -36(%rbp)         # 4-byte Spill
	jge	.LBB0_4
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	-8(%rbp), %rcx          # 8-byte Reload
	movq	-32(%rbp), %rdx         # 8-byte Reload
	movq	(%rcx,%rdx,8), %rsi
	shlq	$1, %rdx
	cmpq	(%rcx,%rdx,8), %rsi
	movl	%eax, -36(%rbp)         # 4-byte Spill
	jg	.LBB0_4
# BB#3:                                 #   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax         # 8-byte Reload
	addq	$1, %rax
	movq	%rax, -24(%rbp)         # 8-byte Spill
	jmp	.LBB0_1
.LBB0_4:
	movl	-36(%rbp), %eax         # 4-byte Reload
	popq	%rbp
	retq
.Ltmp3:
	.size	f, .Ltmp3-f
	.cfi_endproc


	.ident	"clang version 3.6.2 (tags/RELEASE_362/final)"
	.section	".note.GNU-stack","",@progbits
