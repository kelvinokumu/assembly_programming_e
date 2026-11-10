# 06.asm - 32-bit Push and Pop Operations

## Overview

This program demonstrates stack operations in 32-bit mode (`BITS 32`) using `EAX`, `EBX`, and `int 0x80` to exit.

## Stack Flow Step-by-Step

1. `_start` initializes `EAX = 0x11223344` and `EBX = 0x1234`.
2. `push eax` decrements `ESP` by 4 bytes and stores `0x11223344` on the stack.
3. `push ebx` decrements `ESP` by 4 bytes and stores `0x00001234` on the stack.
4. `pop ebx` loads the top 4 bytes (`0x00001234`) into `EBX` and increments `ESP` by 4 bytes.
5. `pop eax` loads the next 4 bytes (`0x11223344`) into `EAX` and increments `ESP` by 4 bytes.
6. The program exits using `int 0x80` (`EAX = 1`, `EBX = 0`).

## Key Observations

- In 32-bit mode, each push or pop moves `ESP` by 4 bytes.
