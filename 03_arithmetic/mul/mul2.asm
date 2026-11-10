
section .data
    num1 dw 3000   ; 1011 10111000
    num2 dw 200    ;      11001000
    result dd 0    ; 32-bit result 1001 00100111 11000000

section .text
    global _start

_start:
    mov ax, [num1]      ; moving the value from num1 to ax
    mul word [num2]     ; DX:AX = AX * num2
    mov [result], ax    ; lower 16 bits
    mov [result+2], dx  ; upper 16 bits

    mov eax, 1
    xor ebx, ebx
    int 0x80


