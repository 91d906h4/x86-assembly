.section .text
	.intel_syntax noprefix
    .global _main

.section .data
munber_a:
    .int 10

number_b:
    .int 10

message1:
    .ascii "number_a is equal to %d.\n\0"

message2:
    .ascii "number_a is not equal to %d.\n\0"

.section .code
_main:
    push    ebp
    sub     esp, 32

    mov     eax, [munber_a]
    mov     [esp + 4], eax
    mov     edx, [number_b]
    cmp     [esp + 4], edx
    jne     L0

    lea     eax, [message1]
    mov     [esp], eax
    call    _printf

    jmp     L1

L0:
    lea     eax, [message2]
    mov     [esp], eax
    mov     eax, [munber_a]
    mov     [esp + 4], edx
    call    _printf
    
    jmp     L1

L1:
    add     esp, 32
    pop     ebp

    xor     eax, eax
    ret
