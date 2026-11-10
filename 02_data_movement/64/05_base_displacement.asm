section .data

    numbers dq 10, 20, 30, 40

section .text
global _start

_start:

    mov rbx, numbers

    mov rax, [rbx + 8]

    mov rdi, rax

    mov rax, 60
    syscall