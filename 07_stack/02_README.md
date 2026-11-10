# 02.asm - 64-bit Stack Frame Management

## Overview

This program demonstrates a standard 64-bit stack frame setup (prologue) and teardown (epilogue) for allocating local stack variables.

## Stack Flow Step-by-Step

1. `call work` pushes the return address onto the stack (`RSP - 8`) and jumps to `work`.
2. The function prologue:
   - `push rbp` saves the caller's frame pointer (`RSP - 8`).
   - `mov rbp, rsp` establishes the new base pointer for the local stack frame.
   - `sub rsp, 16` allocates 16 bytes on the stack for local variables.
3. Local variable assignment:
   - `mov qword [rbp - 8], 100` stores the first local variable at `[RBP - 8]`.
   - `mov qword [rbp - 16], 200` stores the second local variable at `[RBP - 16]`.
   - The program loads the values into `RAX` and `RBX`.
4. The function epilogue:
   - `mov rsp, rbp` deallocates the local stack space.
   - `pop rbp` restores the caller's base pointer (`RSP + 8`).
   - `ret` pops the return address into `RIP` (`RSP + 8`) and resumes execution in `_start`.

## Key Observations

- Stack frame space can be reserved by adjusting `RSP` with `sub rsp, X`, rather than pushing each local variable.
- `RBP` remains stationary during function execution and provides a fixed reference for negative offsets such as `[rbp - 8]` and `[rbp - 16]`.
