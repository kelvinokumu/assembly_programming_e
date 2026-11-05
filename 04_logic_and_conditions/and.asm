; nasm -f elf32 hello_world_32.asm -o hello_world_32.o
; ld -m elf_i386 -o hello32 hello_world_32.o
; ./hello32

section .data
    val1 db 0b10101010   ; 170 decimal
    val2 db 0b11001100   ; 204 decimal

section .text
    global _start

_start:
    mov al, [val1]
    mov bl, [val2]
    and al, bl           ; AL = 10001000 (0x88, 136)
    ; flags set
    ; Sign Flag - Set if the Most significant bit of the result is 1
    ; Parity Set if the number of set bits in the least significant byte is even.


    mov eax, 1     ;sys call number to exit
    xor ebx, ebx   ; 0 for successful exit
    int 0x80       ; invoke call
