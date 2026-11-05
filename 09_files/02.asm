section .data
    prompt     db "Enter your name: "
    prompt_len equ $ - prompt

    output     db "Hello, "
    output_len equ $ - output

section .bss
    input_buf resb 64

section .text
    global _start

_start:
    ; 1. Display prompt (sys_write)
    mov edx, prompt_len
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; 2. Read user's name (sys_read)
    mov edx, 63
    mov ecx, input_buf
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; EAX contains the number of bytes read.
    ; Save the value before another syscall overwrites EAX.
    mov esi, eax

    ; 3. Display greeting prefix (sys_write)
    mov edx, output_len
    mov ecx, output
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; 4. Display the user's actual input
    mov edx, esi             ; Reuse bytes returned by sys_read
    mov ecx, input_buf
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; 5. Exit program
    xor ebx, ebx
    mov eax, 1
    int 0x80