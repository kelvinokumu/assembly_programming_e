section .data
    filename      db "test.txt", 0

    text_to_write db "Hello from NASM 64-bit file IO!", 0xa
    text_len      equ $ - text_to_write

    err_msg       db "File operation failed!", 0xa
    err_len       equ $ - err_msg

section .bss
    read_buf      resb 64

section .text
    global _start

_start:

    ; 1. OPEN / CREATE FILE FOR WRITING
    mov rax, 2                 ; sys_open
    mov rdi, filename
    mov rsi, 577               ; O_WRONLY | O_CREAT | O_TRUNC
    mov rdx, 420               ; 0644 permissions
    syscall

    test rax, rax
    js .error

    ; Save file descriptor
    mov r12, rax

    ; 2. WRITE DATA TO FILE
    mov rax, 1                 ; sys_write
    mov rdi, r12               ; Reuse file descriptor
    mov rsi, text_to_write
    mov rdx, text_len
    syscall

    test rax, rax
    js .error

    ; 3. CLOSE FILE
    mov rax, 3                 ; sys_close
    mov rdi, r12
    syscall

    test rax, rax
    js .error

    ; 4. OPEN FILE FOR READING
    mov rax, 2                 ; sys_open
    mov rdi, filename
    xor rsi, rsi               ; O_RDONLY
    xor rdx, rdx
    syscall

    test rax, rax
    js .error

    ; Save the new file descriptor
    mov r12, rax

    ; 5. READ FILE CONTENT
    mov rax, 0                 ; sys_read
    mov rdi, r12
    mov rsi, read_buf
    mov rdx, 64                ; Maximum bytes to read
    syscall

    test rax, rax
    js .error

    ; Save number of bytes actually read
    mov r13, rax

    ; 6. DISPLAY CONTENT ON SCREEN
    mov rax, 1                 ; sys_write
    mov rdi, 1                 ; stdout
    mov rsi, read_buf
    mov rdx, r13               ; Reuse bytes returned by sys_read
    syscall

    ; 7. CLOSE FILE
    mov rax, 3                 ; sys_close
    mov rdi, r12
    syscall

    ; 8. EXIT
    mov rax, 60
    xor rdi, rdi
    syscall


.error:
    ; Display error message
    mov rax, 1
    mov rdi, 1
    mov rsi, err_msg
    mov rdx, err_len
    syscall

    ; Exit with error status
    mov rax, 60
    mov rdi, 1
    syscall