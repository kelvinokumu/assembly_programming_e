
; 10101010 XOR 11001100 = 01100110

section .data
    val1 db 0b10101010
    val2 db 0b11001100

section .text
    global _start

_start:
    mov al, [val1]
    mov bl, [val2]
    xor al, bl           ; al = 01100110 (0x66, 102)

    ; Exit call
    mov eax, 1     ;sys call number to exit
    xor ebx, ebx   ; 0 for successful exit
    int 0x80       ; invoke call

; flags set
; PF (Parity Flag) is Set if result’s low byte has an even number of 1s
; 01100110b has 4 ones → even → PF = 1