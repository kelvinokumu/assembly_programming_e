; Assemble the file   : nasm -f elf32 hello_world_32.asm -o hello_world_32.o
; Link:                 ld -m elf_i386 hello_world_32.o -o hello32 
; Run/Execute:          ./hello32

section .data
    ; message with newline 0xA, this indicates where the string ends
    msg db "Hello, World!", 0xA

    ;length of message
    ;Subtract the start address of msg from the current address.
    ;That gives you the number of bytes between the start of msg and “now.”
    ;Which is exactly the length of your string.
    len equ $ - msg             

section .text
    global _start

_start:

;| Register | Purpose                                                  |
;| -------- | -------------------------------------------------------- |
;| EAX      | Syscall number (tells the kernel which service you want) |
;| EBX      | 1st argument                                             |
;| ECX      | 2nd argument                                             |
;| EDX      | 3rd argument                                             |
;| ESI      | 4th argument (if needed)                                 |
;| EDI      | 5th argument                                             |
;| EBP      | 6th argument                                             |

    mov eax, 4        ; syscall number (sys_write)/diplay
    mov ebx, 1        ; file descriptor (stdout)
    mov ecx, msg      ; address of message
    mov edx, len      ; message length
    int 0x80          ; call kernel

    mov eax, 1        ; syscall number (sys_exit)
    xor ebx, ebx      ; status 0
    ; mov ebx, 0
    int 0x80
