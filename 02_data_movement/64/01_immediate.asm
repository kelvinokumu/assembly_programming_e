section .text
global _start

_start:

    mov rax, 10
    mov rbx, 20

    add rax, 5

    mov rax, 60
    xor rdi, rdi
    syscall