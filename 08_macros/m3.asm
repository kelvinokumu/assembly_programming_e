section .data
    zero_msg db "Number is zero.", 10
    zero_len equ $ - zero_msg

    nonzero_msg db "Number is not zero.", 10
    nonzero_len equ $ - nonzero_msg

section .text
    global _start

%macro CHECK_ZERO 1
    test %1, %1
    jz %%zero

    mov rax, 1
    mov rdi, 1
    mov rsi, nonzero_msg
    mov rdx, nonzero_len
    syscall

    jmp %%done

%%zero:
    mov rax, 1
    mov rdi, 1
    mov rsi, zero_msg
    mov rdx, zero_len
    syscall

%%done:
%endmacro

_start:
    mov rbx, 0
    CHECK_ZERO rbx

    mov rbx, 25
    CHECK_ZERO rbx

    mov rbx, 100
    CHECK_ZERO rbx

    mov rax, 60
    xor rdi, rdi
    syscall