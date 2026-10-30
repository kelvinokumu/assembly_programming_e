; nasm -f elf64 01.asm -o 01.o
; ld 01.o -o 01

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