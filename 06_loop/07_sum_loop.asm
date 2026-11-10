section .data
    message db "Sum = "
    length equ $ - message
    newline db 10

section .bss
    result resb 1

section .text
    global _start

_start:
    mov r12, 1              
    mov r13, 0               

sum_loop:
    add r13, r12               
    inc r12                    

    cmp r12, 6
    jl sum_loop                


    mov rax, r13
    mov rbx, 10
    xor rdx, rdx
    div rbx                   

    add al, '0'
    mov [result], al

    add dl, '0'
    mov [result + 1], dl

    ; Print message
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    ; Print result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 2
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall