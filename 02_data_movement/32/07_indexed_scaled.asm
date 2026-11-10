section .data

    numbers dd 10, 20, 30, 40

section .text
global _start

_start:

    mov ebx, numbers
    mov esi, 8

    mov eax, [ebx + esi]

    mov ecx, eax

    mov eax, 1
    int 0x80