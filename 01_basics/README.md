# 01_basics examples
# 01_basics – Hello World in Assembly

This folder contains two versions of the classic **Hello, World!** program written in NASM assembly:
- `hello_world_32.asm` → for **32-bit Linux** (uses `int 0x80` syscalls).
- `hello_world_64.asm` → for **64-bit Linux** (uses `syscall` instruction).

---

## 🔹 1. hello_world_32.asm (32-bit)

### Key Points
- Uses **`int 0x80`** to request services from the Linux kernel.
- The `eax` register holds the syscall number.
- Arguments go into registers: `ebx`, `ecx`, `edx`.
- Exit uses syscall **1** (`sys_exit`).

### Syscalls Used
| Purpose     | Syscall Number | Registers Used                   |
|-------------|----------------|----------------------------------|
| write       | 4              | `ebx` = fd, `ecx` = buf, `edx` = len |
| exit        | 1              | `ebx` = exit code                |

---

## 🔹 2. hello_world_64.asm (64-bit)

### Key Points
- Uses the **`syscall`** instruction (modern replacement for `int 0x80`).
- The `rax` register holds the syscall number.
- Arguments go into registers in this order:  
  `rdi`, `rsi`, `rdx`, `r10`, `r8`, `r9`.
- Exit uses syscall **60** (`sys_exit`).

### Syscalls Used
| Purpose     | Syscall Number | Registers Used                   |
|-------------|----------------|----------------------------------|
| write       | 1              | `rdi` = fd, `rsi` = buf, `rdx` = len |
| exit        | 60             | `rdi` = exit code                |

---

## 🔧 Compilation & Execution

### For 64-bit version
```bash
nasm -f elf64 hello_world_64.asm -o hello_world_64.o
ld -o hello64 hello_world_64.o
./hello64



### For 32-bit version
```bash
nasm -f elf32 hello_world_32.asm -o hello_world_32.o
ld -m elf_i386 -o hello32 hello_world_32.o
./hello32
