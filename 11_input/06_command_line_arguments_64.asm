 ; Display argc and the first user-supplied command-line argument.
; Build: nasm -f elf64 06_command_line_arguments_64.asm -o args.o
;        ld args.o -o show_args
; Run:   ./show_args hello
;
; At Linux x86-64 process entry:
; [RSP] = argc, [RSP+8] = argv[0], [RSP+16] = argv[1], ...

section .data
    noarg db "No extra argument supplied.", 10
    noarg_len equ $ - noarg
    label db "First argument: "
    label_len equ $ - label
    newline db 10

section .text
global _start
_start:
    mov r12, [rsp]              ; argc
    cmp r12, 2
    jl .no_argument

    mov r13, [rsp + 16]         ; argv[1] pointer

    mov eax, 1
    mov edi, 1
    lea rsi, [rel label]
    mov edx, label_len
    syscall

    ; Find NUL terminator to calculate argument length.
    mov rsi, r13
    xor rdx, rdx
.length:
    cmp byte [r13 + rdx], 0
    je .print
    inc rdx
    jmp .length

.print:
    mov eax, 1
    mov edi, 1
    mov rsi, r13
    syscall

    mov eax, 1
    mov edi, 1
    lea rsi, [rel newline]
    mov edx, 1
    syscall
    jmp .exit

.no_argument:
    mov eax, 1
    mov edi, 1
    lea rsi, [rel noarg]
    mov edx, noarg_len
    syscall

.exit:
    mov eax, 60
    xor edi, edi
    syscall
