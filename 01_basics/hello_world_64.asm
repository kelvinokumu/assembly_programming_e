; Assemble the file: nasm -f elf64 hello_world_64.asm -o hello_world_64.o
; Link:              ld hello_world_64.o -o hello64
; Run:               ./hello64

section .data

    ; message with newline 0xA, this indicates where the string ends
    msg db "Hello, World!", 0xA

    ; length of message
    ;Subtract the start address of msg from the current address.
    ;That gives you the number of bytes between the start of msg and “now.”
    ;Which is exactly the length of your string.
    len equ $ - msg

section .text
    global _start

_start:

;| Register | Purpose        |
;| -------- | -------------- |
;| RAX      | Syscall number |
;| RDI      | 1st argument   |
;| RSI      | 2nd argument   |
;| RDX      | 3rd argument   |
;| R10      | 4th argument   |
;| R8       | 5th argument   |
;| R9       | 6th argument   |

    ;How to display a message
    mov rax, 1        ; syscall number (sys_write)
    mov rdi, 1        ; file descriptor (stdout)/display on the terminal
    mov rsi, msg      ; address of message
    mov rdx, len      ; length of message
    syscall           ; call kernel

    ; exit
    mov rax, 60       ; syscall number (sys_exit)
    xor rdi, rdi      ; status 0
    syscall
