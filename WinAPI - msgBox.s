.section .text
    .file "WinAPI.c"
    .intel_syntax noprefix
    .global _main

.section .data
title:
    .ascii "Title\0"

message:
    .ascii "Hello, World!\0"

result:
    .ascii "The return value is %d.\0"

.section .code
_main:
    push    ebp
    mov	    ebp, esp
    sub	    esp, 20

    mov     DWORD PTR [esp + 12], 33
    mov     DWORD PTR [esp + 8], OFFSET FLAT:title
    mov     DWORD PTR [esp + 4], OFFSET FLAT:message
    mov     DWORD PTR [esp], 0
    call    _MessageBoxA@16 # MessageBox(NULL, message, title, mode);

    # _MessageBoxA@16 will store the return value in regiser eax
    mov     DWORD PTR [esp + 4], eax
    lea     eax, [result]
    mov     DWORD PTR [esp], eax
    call    _printf

    add     esp, 20

    # mov     esp, ebp
    # pop     ebp
    # same as the 'leave' instruction
    leave

    xor     eax, eax
    ret
