section .data
    num1 dw 0xFFFF ; 1111111111111111   65535
    num2 dw 1
    result dw 0

section .text
    global _start

_start:
    mov ax, [num1]
    add ax, [num2]       ; AX = 0xFFFF + 1 → 0 with CF=1
    adc ax, 0            ; AX = AX + CF → demonstrates ADC
    mov [result], ax

    mov eax, 1
    xor ebx, ebx
    int 0x80

