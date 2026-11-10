# 01.asm - Stack Operations & Register Swapping

## Overview

This 64-bit assembly program demonstrates basic stack push and pop mechanics. It pushes values from `RAX` and `RBX` onto the stack, then retrieves them into different registers (`RCX` and `RDX`).

## Stack Flow Step-by-Step

1. `_start` sets `RAX` to `100` (`0x64`) and `RBX` to `200` (`0xc8`).
2. `push rax` decrements `RSP` by 8 bytes and stores `0x0000000000000064` at `[RSP]`.
3. `push rbx` decrements `RSP` by 8 bytes and stores `0x00000000000000c8` at `[RSP]`.
4. `pop rcx` loads the top stack value (`0xc8`, or `200`) into `RCX`, then increments `RSP` by 8 bytes.
5. `pop rdx` loads the next value (`0x64`, or `100`) into `RDX`, then increments `RSP` by 8 bytes.
6. The program exits with a Linux `sys_exit` system call (`RAX = 60`, `RDI = 0`).

## Key Observations

- **Stack pointer:** In 64-bit mode, each `push` decreases `RSP` by 8 bytes; each `pop` increases it by 8 bytes.
- **LIFO order:** The last value pushed (`RBX = 200`) is the first value popped (into `RCX`).
- **Register swapping:** The values are popped into different registers, so `RCX` receives the original `RBX` value and `RDX` receives the original `RAX` value.
