section .data
    message db "Hello, Assembly!", 10
    length equ $ - message

section .text
    global _start

_start:
    mov r12, 5          

repeat:
    ; Print message
    mov rax, 1               
    mov rdi, 1                
    mov rsi, message
    mov rdx, length
    syscall

    dec r12                   
    jnz repeat                 

    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall