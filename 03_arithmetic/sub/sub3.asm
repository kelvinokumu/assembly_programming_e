; sbb.asm
section .data
    num1 dw 0x0000
    num2 dw 1
    result dw 0

section .text
    global _start

_start:
    mov ax, [num1]
    sub ax, [num2]       ; AX = 0 - 1 → FFFFh, CF=1
    sbb ax, 0            ; AX = AX - CF
    mov [result], ax

    mov eax, 1
    xor ebx, ebx
    int 0x80
