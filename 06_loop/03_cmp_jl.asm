section .data
    message db "Number: "
    length equ $ - message
    newline db 10

section .bss
    digit resb 1

section .text
    global _start

_start:
    mov r12, 1                  ; Start at 1

repeat:
    ; Print "Number: "
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    ; Convert the number to ASCII
    mov rax, r12
    add al, '0'
    mov [digit], al

    ; Print the number
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 1
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    inc r12                
    cmp r12, 6             
    jl repeat         

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall