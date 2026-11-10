section .text
global _start

_start:

    mov rax, 10
    mov rbx, 20

    add rax, rbx

    mov rdi, rax

    mov rax, 60
    syscall