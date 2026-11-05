section .data
    prompt db "Enter a line of text: "
    prompt_len equ $ - prompt
    label db "You entered: "
    label_len equ $ - label

section .bss
    buffer resb 128

section .text
global _start
_start:
    mov eax, 1
    mov edi, 1
    lea rsi, [rel prompt]
    mov edx, prompt_len
    syscall

    ; Read at most 128 bytes. The result in RAX is the actual byte count.
    xor eax, eax
    xor edi, edi
    lea rsi, [rel buffer]
    mov edx, 128
    syscall

    ; EOF or error: exit. A negative RAX is an error.
    test rax, rax
    jle .exit
    mov r12, rax                ; preserve byte count

    mov eax, 1
    mov edi, 1
    lea rsi, [rel label]
    mov edx, label_len
    syscall

    ; Write exactly the bytes received; no NUL terminator is required.
    mov eax, 1
    mov edi, 1
    lea rsi, [rel buffer]
    mov rdx, r12
    syscall

.exit:
    mov eax, 60
    xor edi, edi
    syscall
