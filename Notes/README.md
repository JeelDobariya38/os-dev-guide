# x86-64 Assembly Language

In this file, we will learn about x86 Assembly written in Intel syntax. you can consider this as beginner guide to low level programming. It will prepare you to become a os developer or will make you a low level programmer if that matters.


## Overview

- [Getting Started](#getting-started)
- [Boot Sector Signature](#boot-sector-signature)

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

---

## Boot Sector Signature

When a computer starts, first BIOs (Legacy Booting) is started and there happened a complicated booting processing.

There are two different methods of booting `UEFI (Modern Way)` & `BIOS (Legacy Booting)` we will talk about legacy booting over here. 

The responsibility of bios is to get os up in run and provide basic input & output functionality. So, the legacy booting system need to find & start the operating system and then, hand a control of computer to it.

There is specific ways bios identify where the operating system {or bootloader} is situation. for this, bios check very first section of every storage device connected. It simply look for a specific boot sector signature. 

In short, `BIOS` assume which ever of storage devices first sector ends with `0x55aa` will be the boot sector.

```nasm
jmp $

; fill the rest of file with 0's
times 510 - ($-$$) db 0

; boot sector signature
db 0x55
db 0xaa
```

#### More Cleaner Version & Standardized Version

```nasm
bits 16
org 0x7c00

jmp $

; boot sector signature
times 510 - ($-$$) db 0
dw 0x55aa
```

