section .data

    num dq 50

section .text
global _start

_start:

    mov rbx, num
    mov rax, [rbx]

    mov rdi, rax

    mov rax, 60
    syscall