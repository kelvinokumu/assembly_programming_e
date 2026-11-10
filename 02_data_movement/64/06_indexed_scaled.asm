section .data

    numbers dq 10, 20, 30, 40

section .text
global _start

_start:

    mov rbx, numbers
    mov rcx, 2

    mov rax, [rbx + rcx * 8]

    mov rdi, rax

    mov rax, 60
    syscall