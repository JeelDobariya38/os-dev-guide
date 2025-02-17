# x86-64 Assembly Language

In this file, we will learn about x86 Assembly written in Intel syntax. you can consider this as beginner guide to low level programming. It will prepare you to become a os developer or will make you a low level programmer if that matters.


## Overview

- [Getting Started](#getting-started)

---

## Getting Started

For getting started with assembly, you will need two things. `nasm` assembler for assembling the assembly code & `qemu` for running the code. you can use any virtualization software but we will go with qemu.

If you don't have this both things setup. Please do install them, because the text below assumes that you have nasm and qemu setup. both have relative simple installation process.

### For Linux Users:-

```bash
apt install nasm
apt install qemu
```

### Verify Installion:-

```bash
nasm --version
qemu-system-x86_64 --version
```

After installation both nasm and qemu, you can run any of assembly code given in this file.

### Step 1: Save the code locally.

- copy the code.
- then, save it as file (let say) on your desktop. `file.asm`

### Step 2: Assembly the code.

```bash
nasm -f bin -o file.bin file.asm
```

### Step 3: Run the code

```bash
qemu-system-x86_64 file.bin
```

