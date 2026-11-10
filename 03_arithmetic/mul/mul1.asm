; mul_byte.asm
section .data
    num1 db 25
    num2 db 10
    result dw 0         ; needs 16 bits for result

section .text
    global _start

_start:
    mov al, [num1]      ; al = first operand
    mul byte [num2]     ; ax = al * num2 (25 * 10 = 250)
    mov [result], ax    ; store result in memory

    mov eax, 1
    xor ebx, ebx
    int 0x80


; what flags are set
; inspect the registers