section .data
    msg1 db "First line"
    len1 equ $ - msg1

    msg2 db "Second line"
    len2 equ $ - msg2

    newline db 10

section .text
    global _start


%macro PRINT 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro


%macro PRINT_LINE 2
    PRINT %1, %2
    PRINT newline, 1
%endmacro

_start:
    PRINT_LINE msg1, len1
    PRINT_LINE msg2, len2

    mov rax, 60
    xor rdi, rdi
    syscall