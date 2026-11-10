; Basic types
; Assemble the program: nasm -f elf64 data_types.asm -o data_types.o
                    ;   nasm -f elf64 -o data_types.o data_types.asm 
; Link it:              ld data_types.o -o data_types
; Run the file          ./data_types

section .data
    ; Basic integer types
    myByte   db  0x41            ; 1 byte
    myWord   dw  0x4243          ; 2 bytes
    myDword  dd  123456          ; 4 bytes
    myQword  dq  1234567890123   ; 8 bytes

    ; Null-terminated string to mark where end of the string is
    myString db "Hello", 0

section .bss
    ; Uninitialized data - allocated by OS
    buffer   resb 64             ; Reserve 64 bytes

section .text
    global _start

_start:
    ; Load different data types into registers
    mov al, [myByte]     ; 1 byte into AL
    mov ax, [myWord]     ; 2 bytes into AX
    mov eax, [myDword]   ; 4 bytes into EAX
    mov rax, [myQword]   ; 8 bytes into RAX

    ; Exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall
