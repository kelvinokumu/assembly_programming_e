section .text
global _start

_start:

    mov eax, 10
    mov ebx, 20

    add eax, ebx

    mov ebx, eax

    mov eax, 1
    int 0x80