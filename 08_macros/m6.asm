;nasm -f elf64 m6.asm -o m6.o
; ld m6.o -o m6
; gdb ./m6
; break _start
; run
; si


section .data
    msg db "Program completed successfully.", 10
    len equ $ - msg

section .text
    global _start

%macro PRINT 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro EXIT_PROGRAM 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

_start:
    PRINT msg, len

    EXIT_PROGRAM 0