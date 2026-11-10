; sub8.asm
section .data
    num1 db 50   ; 00110010
    num2 db 80   ; 01010000
    result db 0

section .text
    global _start

_start:
    mov al, [num1]
    sub al, [num2]       ; al = 50 - 80
    mov [result], al   ;

    mov eax, 1
    xor ebx, ebx
    int 0x80

