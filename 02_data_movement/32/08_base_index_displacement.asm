section .data

    numbers dd 10, 20, 30, 40, 50

section .text
global _start

_start:

    mov ebx, numbers
    mov esi, 2

    mov eax, [ebx + esi * 4 + 4]

    mov ecx, eax

    mov eax, 1
    int 0x80