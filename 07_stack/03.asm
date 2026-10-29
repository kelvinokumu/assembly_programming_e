section .text
    global _start

_start:
    mov rax, 10
    call calculate

after_call:
    ; RAX should now be 15
    nop

    mov rax, 60
    xor rdi, rdi
    syscall

calculate:
    add rax, 5
    ret