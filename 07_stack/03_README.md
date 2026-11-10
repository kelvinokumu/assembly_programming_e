# 03.asm - Function Calls and Return Address Management

## Overview

This program illustrates how the `call` and `ret` instructions use the stack to save and restore the return address.

## Stack Flow Step-by-Step

1. `mov rax, 10` initializes `RAX` to 10.
2. `call calculate` pushes the address of `after_call` (the next instruction) onto the stack (`RSP - 8`) and jumps to `calculate`.
3. Inside `calculate`:
   - `add rax, 5` changes `RAX` to 15.
   - `ret` pops the return address into `RIP` (`RSP + 8`) and resumes execution at `after_call`.
4. At `after_call`, `RAX` holds 15. The program exits with the Linux `sys_exit` system call (`RAX = 60`, `RDI = 0`).

## Key Observations

- `call` behaves conceptually like pushing the next instruction's address and jumping to the target.
- `ret` uses the address at the top of the stack as the return address.
- If the stack is corrupted before `ret`, execution may jump to an invalid address and crash.
