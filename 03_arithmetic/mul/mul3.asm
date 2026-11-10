; 
section .data
    num1 dd 100000
    num2 dd 300000
    result dq 0 ; 64-bit result 30 000 000 000
    ; 110 11111100 00100011 10101100 00000000
section .text
    global _start

_start:
    mov eax, [num1]
    mul dword [num2]    ; edx:eax = eax * num2
    mov [result], eax   ; 4 bytes low 32 bits
    mov [result+4], edx ; 4 bytes high 32 bits

    mov eax, 1
    xor ebx, ebx
    int 0x80
