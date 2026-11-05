section .data
    prompt     db "Enter your name: "
    prompt_len equ $ - prompt

    output     db "Hello, "
    output_len equ $ - output

section .bss
    input_buf resb 64

section .text
    global _start

_start:
    ; 1. Display prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; 2. Read user's name
    mov rax, 0
    xor rdi, rdi 
    mov rsi, input_buf
    mov rdx, 63
    syscall

    ; RAX now contains the number of bytes read.
    ; Save it because the next syscall will overwrite RAX.
    mov r12, rax

    ; 3. Display greeting prefix
    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, output_len
    syscall

    ; 4. Display the actual input
    mov rax, 1
    mov rdi, 1
    mov rsi, input_buf
    mov rdx, r12             ; Reuse bytes returned by sys_read
    syscall

    ; 5. Exit
    mov rax, 60
    xor rdi, rdi
    syscall