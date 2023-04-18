.section .text
    .intel_syntax noprefix
    .global _main

.section .data
msg:
    .ascii "%s %s\0"

.section .code
_main:
    push    ebp
    mov     ebp, esp
    sub     esp, 16

    mov     eax, DWORD PTR [ebp + 12]
    add     eax, 8                                  # get second parameter
    mov     edx, DWORD PTR [eax]
    mov     eax, DWORD PTR [ebp + 12]
    add     eax, 4                                  # get first parameter
    mov     eax, DWORD PTR [eax]

    cmp     edx, 0                                  # check if the second parameter is null
    jne     L0

    mov     eax, -1
    leave
    ret

L0:
    mov     DWORD PTR [esp + 8], edx
    mov     DWORD PTR [esp + 4], eax
    mov     DWORD PTR [esp], OFFSET FLAT:msg
    call    _printf

    xor     eax, eax
    leave
    ret
