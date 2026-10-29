section .data
    msg db "Hello!", 10
    len equ $ - msg

section .text
    global _start

%macro PRINT_FIVE_TIMES 0
    %rep 5
        mov rax, 1
        mov rdi, 1
        mov rsi, msg
        mov rdx, len
        syscall
    %endrep
%endmacro

_start:
    PRINT_FIVE_TIMES

    mov rax, 60
    xor rdi, rdi
    syscall