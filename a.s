.section .text
	.intel_syntax noprefix
	.globl	_main

.section .data
number:
	.int 65

message:
	.ascii "The number is %d %d %d.\n\0"

mul_message:
	.ascii "%d * %d = %d\n\0"

float_message:
	.ascii "%f + %f = %f\n\0"

float_number:
	.long 1123477881
	.align 4

.section .code
_main:
	push	ebp						# save base-pointer register

	sub		esp, 16 				# reserve spave for stack
	lea 	eax, [message]			# get memory address from string
	mov 	[esp], eax
	mov 	ebx, number
	mov 	[esp + 4], ebx
	inc 	ebx 					# same as 'add ebx, 1'
	mov 	[esp + 8], ebx
	inc 	ebx
	mov 	[esp + 12], ebx
	call 	_printf					# call _printf function
	add  	esp, 16 				# free up reserved stack memory

	sub 	esp, 16
	lea 	eax, [mul_message]
	mov 	[esp], eax
	mov 	DWORD PTR [esp + 4], 8
	mov 	DWORD PTR [esp + 8], 3
	call 	_div
	mov 	[esp + 12], eax
	call 	_printf
	add 	esp, 16

	sub 	esp, 32
	lea 	eax, [float_message]
	mov 	[esp], eax
	fld 	DWORD PTR float_number
	fstp 	QWORD PTR [esp + 4]
	fld 	DWORD PTR float_number
	fstp 	QWORD PTR [esp + 12]
	fld 	QWORD PTR [esp + 4]
	fadd 	QWORD PTR [esp + 12]
	fstp 	QWORD PTR [esp + 20]
	call 	_printf
	add 	esp, 32

	pop 	ebp						# restore base-pointer register

	xor		eax, eax				# set eax register to 0
	ret								# exit program

_add:
	push 	ebp
	mov 	ebp, esp
	mov 	eax, DWORD PTR [ebp + 12]
	add 	eax, DWORD PTR [ebp + 16]
	pop 	ebp
	ret

_sub:
	push 	ebp
	mov 	ebp, esp
	mov 	eax, DWORD PTR [ebp + 12]
	sub 	eax, DWORD PTR [ebp + 16]
	pop 	ebp
	ret

_mul:
	push 	ebp
	mov 	ebp, esp
	mov 	eax, DWORD PTR [ebp + 12]
	imul 	eax, DWORD PTR [ebp + 16]
	pop 	ebp
	ret

_div:
	push 	ebp
	mov 	ebp, esp
	mov 	eax, DWORD PTR [ebp + 12]
	div 	eax, DWORD PTR [ebp + 16]
	pop 	ebp
	ret
