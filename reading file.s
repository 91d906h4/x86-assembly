.section .text
    .intel_syntax noprefix
    .global _main

.section .data
filename:
    .ascii "test.txt\0"

mode:
    .ascii "r\0"

message:
    .ascii "%c\0"

error_message:
    .ascii "Cannot open file '%s'.\0"

.section .code
_main:
    push    ebp
    mov     ebp, esp
    sub     esp, 512

    mov     DWORD PTR [esp + 4], OFFSET FLAT:mode
    mov     DWORD PTR [esp], OFFSET FLAT:filename
    call    _fopen                                      # failed: return 0; successed: return file address

    cmp     eax, 0                                      # check if file opend successfully
    je      L2                                          # if the return value is 0, then break the program

    mov     DWORD PTR [esp + 12], eax                   # store file address to [esp + 12]

    jmp     L1

L0:
    mov     DWORD PTR [esp], OFFSET FLAT:message
    movsx   eax, BYTE PTR [esp + 16]
    mov     DWORD PTR [esp + 4], eax
    call    _printf                                     # print char

L1:
    mov     eax, DWORD PTR [esp + 12]
    mov     DWORD PTR [esp], eax
    call    _fgetc                                      # get next char

    mov     BYTE PTR [esp + 16], al
    cmp     BYTE PTR [esp + 16], -1                     # check if EOF
    jne     L0

    mov     eax, DWORD PTR [esp + 12]
    mov     DWORD PTR [esp], eax
    call    _fclose                                     # close file

    mov     eax, 0
    jmp     L3

L2:
    mov     DWORD PTR [esp], OFFSET FLAT:error_message
    mov     DWORD PTR [esp + 4], OFFSET FLAT:filename
    call _printf                                        # show error message

    mov     eax, -1

L3:
    leave
    ret
