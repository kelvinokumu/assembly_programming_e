; TEST performs bitwise AND
; 10101010 TEST 00001111
; ZF=0 because at least one bit matches (AL & BL != 0)

section .data
    val1 db 0b10101010
    val2 db 0b00001111

section .text
    global _start

_start:
    mov al, [val1]
    mov bl, [val2]
    test al, bl          ; result not stored, flags updated
                         ; ZF = 0 (some bits overlap)

    ; Exit call
    mov eax, 1     ;sys call number to exit
    xor ebx, ebx   ; 0 for successful exit
    int 0x80       ; invoke call
