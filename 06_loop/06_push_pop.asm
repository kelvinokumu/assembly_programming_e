section .data
    star db "*"
    newline db 10

section .text
    global _start

_start:
    mov rcx, 3       

outer_loop:
    push rcx          

    mov rcx, 2 

inner_loop:
    push rcx

    ; Print *
    mov rax, 1              
    mov rdi, 1         
    mov rsi, star
    mov rdx, 1
    syscall


    pop rcx

    loop inner_loop    

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall


    pop rcx

    loop outer_loop    

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall