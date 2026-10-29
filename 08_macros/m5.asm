section .data
    msg db "Register operations completed.", 10
    len equ $ - msg

section .text
    global _start


%macro INCREMENT 1
    inc %1
%endmacro


%macro DECREMENT 1
    dec %1
%endmacro

_start:
    mov rax, 10
    mov rbx, 20

    INCREMENT rax
    INCREMENT rax
    INCREMENT rax

    DECREMENT rbx
    DECREMENT rbx

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall