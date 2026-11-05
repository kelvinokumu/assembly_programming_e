section .data
    prompt db "Enter one character: "
    prompt_len equ $ - prompt

    result db "You entered: "
    result_len equ $ - result

section .bss
    input_char resb 1

section .text
global _start

_start:

    ; 1. Display prompt
    mov eax, 1
    mov edi, 1
    lea rsi, [rel prompt]
    mov edx, prompt_len
    syscall

    ; 2. Read one character
    xor eax, eax                
    xor edi, edi                
    lea rsi, [rel input_char]
    mov edx, 1
    syscall

    ; Check whether one byte was read
    cmp rax, 1
    jne .exit

    ; Save number of bytes read
    mov r12, rax

    ; 3. Display result label
    mov eax, 1
    mov edi, 1
    lea rsi, [rel result]
    mov edx, result_len
    syscall

    ; 4. Display entered character
    mov eax, 1
    mov edi, 1
    lea rsi, [rel input_char]
    mov rdx, r12                ; Reuse bytes returned by sys_read
    syscall

.exit:
    ; 5. Exit program
    mov eax, 60
    xor edi, edi
    syscall