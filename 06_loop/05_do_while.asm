section .data
    newline db 10

section .bss
    digit resb 1

section .text
    global _start

_start:
    mov r12, 1                  ; Initialize counter

loop_body:
    ; Convert number to ASCII
    mov rax, r12
    add al, '0'
    mov [digit], al

    ; Print number
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
    jl loop_body

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall