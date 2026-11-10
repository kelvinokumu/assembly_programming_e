section .data

    numbers dd 10, 20, 30, 40

section .text
global _start

_start:

    mov esi, numbers
    mov edi, 2

    mov eax, [esi + edi * 4]

    mov ebx, eax

    mov eax, 1
    int 0x80