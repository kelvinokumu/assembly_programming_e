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