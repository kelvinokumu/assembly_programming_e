; nasm -f elf64 02.asm -o 02.o
; ld 02.o -o 02
; gdb ./02
; break _start
; run
; si

section .text
    global _start

_start:
    call work
    mov rax, 60
    xor rdi, rdi
    syscall

work:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov qword [rbp - 8], 100
    mov qword [rbp - 16], 200

    mov rax, [rbp - 8]
    mov rbx, [rbp - 16]
    nop

    mov rsp, rbp
    pop rbp
    ret
    
