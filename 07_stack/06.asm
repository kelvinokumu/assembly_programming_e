; nasm -f elf64 06.asm -o 06.o
; ld 06.o -o 06
; gdb ./06
; break _start
; run
; si


BITS 32
section .text
    global _start

_start:
    mov eax, 0x11223344
    mov ebx, 0x1234

    push eax
    push ebx
    nop

    pop ebx
    pop eax

    mov eax, 1
    xor ebx, ebx
    int 0x80