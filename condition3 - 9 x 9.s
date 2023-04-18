.section .text
    .intel_syntax noprefix
    .global _main

.section .data
i:
    .int 10

j:
    .int 10

message:
    .ascii "%d*%d=%d\t\0"

newline:
    .ascii "\n\0"

.section .code
_main:
    push    ebp
    sub     esp, 24

    # lea     eax, [message]
    # mov     [esp], eax
    # same as the following instruction
    mov     DWORD PTR [esp], OFFSET FLAT:message

    mov     DWORD PTR [esp + 4], 1                  # set register to 1
    mov     DWORD PTR [esp + 8], 1                  # set register to 1

    mov     eax, DWORD PTR [i]
    mov     DWORD PTR [esp + 16], eax
    mov     eax, DWORD PTR [j]
    mov     DWORD PTR [esp + 20], eax

L0:
    mov     eax, DWORD PTR [esp + 4]
    imul    eax, DWORD PTR [esp + 8]
    mov     DWORD PTR [esp + 12], eax
    call    _printf

    inc     DWORD PTR [esp + 8]
    mov     eax, [esp + 20]
    cmp     DWORD PTR  [esp + 8], eax
    jl      L0

L1:
    mov     DWORD PTR [esp + 8], 1                  # reset param 1 to 1

    mov     DWORD PTR [esp], OFFSET FLAT:newline
    call    _printf                                 # print new line

    mov     DWORD PTR [esp], OFFSET FLAT:message    # reset message to esp

    inc     DWORD PTR [esp + 4]
    mov     eax, DWORD PTR  [esp + 16]
    cmp     DWORD PTR  [esp + 4], eax
    jl      L0

L2:
    add     esp, 24
    pop     ebp
    xor     eax, eax
    ret
