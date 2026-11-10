section .data

    num dd 50

section .text
global _start

_start:

    mov ebx, num    
    mov eax, [ebx]

    mov ecx, eax

    mov eax, 1
    int 0x80