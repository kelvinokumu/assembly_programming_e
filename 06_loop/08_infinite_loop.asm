section .data
    message db "Running...", 10
    length equ $ - message

section .text
    global _start

repeat:
    ; Print message
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    jmp repeat                 ; Jump back unconditionally