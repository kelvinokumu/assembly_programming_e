section .data
    msg1 db "Welcome to Assembly!", 10
    len1 equ $ - msg1

    msg2 db "Learning NASM macros.", 10
    len2 equ $ - msg2

    msg3 db "One macro, multiple messages.", 10
    len3 equ $ - msg3

section .text
    global _start

%macro PRINT 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

_start:
    PRINT msg1, len1
    PRINT msg2, len2
    PRINT msg3, len3

    mov rax, 60
    xor rdi, rdi
    syscall