# 05.asm - 64-bit Register Push and Pop

## Overview

This program demonstrates pushing and popping 64-bit register values.

## Stack Flow Step-by-Step

1. `_start` initializes:
   - `RAX = 0x1122334455667788`
   - `RBX = 0x1234`
2. `push rax` decreases `RSP` by 8 bytes and stores `0x1122334455667788` at `[RSP]`.
3. `push rbx` decreases `RSP` by 8 bytes and stores `0x0000000000001234` at `[RSP]`.
4. `pop rbx` restores `0x1234` into `RBX` and increases `RSP` by 8 bytes.
5. `pop rax` restores `0x1122334455667788` into `RAX` and increases `RSP` by 8 bytes.

## Key Observations

- Each 64-bit register push stores 8 bytes on the stack.
- Examining stack memory in GDB with `x/2gx $rsp` displays the values in little-endian byte order.
