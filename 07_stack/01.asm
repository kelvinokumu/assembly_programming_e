section .text
    global _start

_start:
    mov rax, 100
    mov rbx, 200

    push rax
    push rbx
    nop

    pop rcx
    pop rdx
    nop

    mov rax, 60
    xor rdi, rdi
    syscall