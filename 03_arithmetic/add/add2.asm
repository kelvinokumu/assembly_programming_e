; add16.asm
section .data
    num1 dw 32000
    num2 dw 500
    result dw 0

section .text
    global _start

_start:
    mov ax, [num1]
    add ax, [num2]       ; AX = num1 + num2
    mov [result], ax

    mov eax, 1
    xor ebx, ebx   ; zero flag set
    int 0x80

