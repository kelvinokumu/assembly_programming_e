section .data
    filename       db "log.txt", 0

    new_line_text  db "Appended log entry.", 0xa
    text_len       equ $ - new_line_text

    header_msg     db "--- Reading File Contents ---", 0xa
    header_len     equ $ - header_msg

    err_msg        db "File operation failed!", 0xa
    err_len        equ $ - err_msg

section .bss
    read_buf       resb 256

section .text
    global _start

_start:

    ; 1. OPEN FILE FOR APPENDING
    mov rax, 2                 ; sys_open
    mov rdi, filename
    mov rsi, 1089              ; O_WRONLY | O_CREAT | O_APPEND
    mov rdx, 420               ; 0644 permissions
    syscall

    test rax, rax
    js .error

    ; Save returned file descriptor
    mov r12, rax

    ; 2. APPEND DATA TO FILE
    mov rax, 1                 ; sys_write
    mov rdi, r12               ; Reuse file descriptor
    mov rsi, new_line_text
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

    ; 4. DISPLAY HEADER
    mov rax, 1                
    mov rdi, 1              
    mov rsi, header_msg
    mov rdx, header_len
    syscall

    ; 5. OPEN FILE FOR READING
    mov rax, 2        
    mov rdi, filename
    xor rsi, rsi               ; O_RDONLY
    xor rdx, rdx
    syscall

    test rax, rax
    js .error

    ; Save new file descriptor
    mov r12, rax

    ; 6. READ FILE CONTENTS
    mov rax, 0      
    mov rdi, r12
    mov rsi, read_buf
    mov rdx, 256       
    syscall

    test rax, rax
    js .error

    ; Save number of bytes actually read
    mov r13, rax

    ; 7. DISPLAY FILE CONTENTS
    mov rax, 1               
    mov rdi, 1          
    mov rsi, read_buf
    mov rdx, r13               ; Reuse bytes returned by sys_read
    syscall

    ; 8. CLOSE FILE
    mov rax, 3       
    mov rdi, r12
    syscall

    test rax, rax
    js .error

    ; 9. EXIT SUCCESSFULLY
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