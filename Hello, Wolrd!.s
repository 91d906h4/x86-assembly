.intel_syntax noprefix

.section .data
message:
    .ascii "Hello, World!\0"

.section .text
    .global _main

_main:
    push ebp

    lea eax, [message]
	mov [esp], eax
    call _printf

    pop ebp
    
    xor eax, eax
    ret
