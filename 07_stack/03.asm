; nasm -f elf64 03.asm -o 03.o
; ld 03.o -o 03
; gdb ./03
; break _start
; run
; si


section .text
    global _start

_start:
    mov rax, 10
    call calculate

after_call:
    ; RAX should now be 15
    nop

    mov rax, 60
    xor rdi, rdi
    syscall

calculate:
    add rax, 5
    ret