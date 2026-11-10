# 04.asm - 32-bit Stack Frame Allocation

## Overview

This program demonstrates a 32-bit (`x86`) function prologue, local variable allocation, and epilogue using `EBP` and `ESP`.

## Stack Flow Step-by-Step

1. `call work` pushes the 32-bit return address onto the stack (`ESP - 4`).
2. The function prologue:
   - `push ebp` saves the old base pointer (`ESP - 4`).
   - `mov ebp, esp` sets the new frame boundary.
   - `sub esp, 8` reserves 8 bytes for two 32-bit local variables.
3. Local variable access:
   - `mov dword [ebp - 4], 100` stores 100 at the first local variable address.
   - `mov dword [ebp - 8], 200` stores 200 at the second local variable address.
   - The program reads the values into `EAX` and `EBX`.
4. The epilogue:
   - `mov esp, ebp` deallocates the local space by resetting `ESP`.
   - `pop ebp` restores the caller's `EBP` (`ESP + 4`).
   - `ret` pops the return address (`ESP + 4`) and returns from the function.
5. After returning, the program exits using the Linux 32-bit `int 0x80` system call (`EAX = 1`, `EBX = 0`).

## Key Observations

- **Pointer sizes:** Stack pointer adjustments are in 4-byte increments instead of 8-byte increments because this is 32-bit code.
- The program uses `int 0x80` for its system calls instead of the 64-bit `syscall` instruction.
