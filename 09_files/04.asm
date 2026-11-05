section .data
    filename      db "test32.txt", 0

    text_to_write db "Hello from NASM 32-bit file IO!", 0xa
    text_len      equ $ - text_to_write

    err_msg       db "File operation failed!", 0xa
    err_len       equ $ - err_msg

section .bss
    read_buf      resb 64

section .text
    global _start

_start:

    ; 1. OPEN / CREATE FILE FOR WRITING
    mov eax, 5                 ; sys_open
    mov ebx, filename
    mov ecx, 577               ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 420               ; 0644 permissions
    int 0x80

    test eax, eax
    js .error

    ; Save returned file descriptor
    mov esi, eax

    ; 2. WRITE DATA TO FILE
    mov eax, 4                 ; sys_write
    mov ebx, esi               ; Reuse file descriptor
    mov ecx, text_to_write
    mov edx, text_len
    int 0x80

    test eax, eax
    js .error

    ; 3. CLOSE FILE
    mov eax, 6                 ; sys_close
    mov ebx, esi
    int 0x80

    test eax, eax
    js .error

    ; 4. OPEN FILE FOR READING
    mov eax, 5                 ; sys_open
    mov ebx, filename
    xor ecx, ecx               ; O_RDONLY
    xor edx, edx
    int 0x80

    test eax, eax
    js .error

    ; Save new file descriptor
    mov esi, eax

    ; 5. READ FILE CONTENT
    mov eax, 3                 ; sys_read
    mov ebx, esi
    mov ecx, read_buf
    mov edx, 64                ; Maximum bytes to read
    int 0x80

    test eax, eax
    js .error

    ; Save number of bytes actually read
    mov edi, eax

    ; 6. DISPLAY CONTENT ON SCREEN
    mov eax, 4                 ; sys_write
    mov ebx, 1                 ; stdout
    mov ecx, read_buf
    mov edx, edi               ; Reuse bytes returned by sys_read
    int 0x80

    ; 7. CLOSE FILE
    mov eax, 6                 ; sys_close
    mov ebx, esi
    int 0x80

    ; 8. EXIT PROGRAM
    mov eax, 1
    xor ebx, ebx
    int 0x80


.error:
    ; Display error message
    mov eax, 4
    mov ebx, 1
    mov ecx, err_msg
    mov edx, err_len
    int 0x80

    ; Exit with error status
    mov eax, 1
    mov ebx, 1
    int 0x80