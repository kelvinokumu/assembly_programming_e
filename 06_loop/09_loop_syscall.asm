section .data
    message db "Hello, Assembly!", 10
    length equ $ - message

section .text
    global _start

_start:
    mov rcx, 5           

repeat:
    push rcx                   

    mov rax, 1                
    mov rdi, 1                  
    mov rsi, message
    mov rdx, length
    syscall

    pop rcx                     
    loop repeat                

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall