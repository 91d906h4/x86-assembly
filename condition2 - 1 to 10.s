.section .text
    .intel_syntax noprefix
    .global _main

.section .data
i:
    .int 0

message:
    .ascii "%d\n\0"

.section .code
_main:
    push    ebp
    sub     esp, 8

    lea     eax, [message]
    mov     [esp], eax
    mov     eax, [i]
    mov     [esp + 4], eax

L0:
    call     _printf

    add     DWORD PTR [esp + 4], 1

L1:
    cmp     DWORD PTR [esp + 4], 10
    jle     L0

    add     esp, 8
    pop     ebp

    xor     eax, eax
    ret
