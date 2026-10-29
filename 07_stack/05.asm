section .text
    global _start

_start:
    mov rax, 0x1122334455667788
    mov rbx, 0x1234

    push rax
    push rbx
    nop

    pop rbx
    pop rax

    mov rax, 60
    xor rdi, rdi
    syscall