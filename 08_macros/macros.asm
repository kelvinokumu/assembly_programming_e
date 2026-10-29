section .data
    msg1 db "start ...", 10
    len1 equ $ - msg1
    
    msg2 db "stop ...", 10
    len2 equ $ - msg2

section .text
    global _start

%macro print 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro delay 1
mov rcx, %1
loop_delay:
    loop loop_delay
%endmacro

_start:
    print msg1, len1
    
    delay 1000000000
    
    print msg2, len2
    
    mov eax, 60
    xor edi, edi
    syscall

