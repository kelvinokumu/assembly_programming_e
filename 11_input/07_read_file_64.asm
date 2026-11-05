section .data
    filename db "input.txt", 0
    err db "Could not open input.txt (check that it exists).", 10
    err_len equ $ - err
    label db "File contents:", 10
    label_len equ $ - label

section .bss
    buffer resb 256

section .text
global _start
_start:
    ; openat(AT_FDCWD=-100, filename, O_RDONLY=0, mode=0)
    mov eax, 257
    mov rdi, -100
    lea rsi, [rel filename]
    xor edx, edx
    xor r10d, r10d
    syscall
    test rax, rax
    js .open_error
    mov r12, rax                ; file descriptor

    ; read(fd, buffer, 256)
    xor eax, eax
    mov rdi, r12
    lea rsi, [rel buffer]
    mov edx, 256
    syscall
    test rax, rax
    jle .close_file
    mov r13, rax                ; bytes read

    mov eax, 1
    mov edi, 1
    lea rsi, [rel label]
    mov edx, label_len
    syscall

    mov eax, 1
    mov edi, 1
    lea rsi, [rel buffer]
    mov rdx, r13
    syscall

.close_file:
    mov eax, 3                  ; close
    mov rdi, r12
    syscall
    jmp .exit

.open_error:
    mov eax, 1
    mov edi, 1
    lea rsi, [rel err]
    mov edx, err_len
    syscall

.exit:
    mov eax, 60
    xor edi, edi
    syscall
