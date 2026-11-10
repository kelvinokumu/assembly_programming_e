; NOT 10101010 = 01010101

section .data
    val1 db 0b10101010 ; 

section .text
    global _start

_start:
    mov al, [val1]       ; 170
    not al               ; al = 01010101 (0x55, 85)

    ; Exit call
    mov eax, 1     ;sys call number to exit
    xor ebx, ebx   ; 0 for successful exit
    int 0x80       ; invoke call
