section .data

    num1 dq 10
    num2 dq 20

section .text
global _start

_start:

    mov rax, [num1]
    add rax, [num2]

    mov rdi, rax

    mov rax, 60
    syscall