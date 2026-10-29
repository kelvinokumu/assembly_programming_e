section .data
    msg1 db "Addition: "
    len1 equ $ - msg1

    msg2 db "Subtraction: "
    len2 equ $ - msg2

    newline db 10

section .bss
    buffer resb 32

section .text
    global _start


%macro ADD_NUMBERS 2
    mov rax, %1
    add rax, %2
%endmacro

%macro SUB_NUMBERS 2
    mov rax, %1
    sub rax, %2
%endmacro


print_number:
    lea rsi, [rel buffer + 32]
    mov rbx, 10

.convert:
    xor rdx, rdx
    div rbx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz .convert

    lea rdx, [rel buffer + 32]
    sub rdx, rsi

    mov rax, 1
    mov rdi, 1
    syscall
    ret

; Print a newline.
%macro NEWLINE 0
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
%endmacro

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, len1
    syscall

    ADD_NUMBERS 25, 15
    call print_number
    NEWLINE

    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

    SUB_NUMBERS 50, 20
    call print_number
    NEWLINE

    ; Exit.
    mov rax, 60
    xor rdi, rdi
    syscall