	.file	"index.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 16
	call	___main
	mov	DWORD PTR [esp+12], 1
	sal	DWORD PTR [esp+12]
	mov	eax, DWORD PTR [esp+12]
	add	eax, eax
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+8]
	add	eax, 1
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	sub	eax, 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
