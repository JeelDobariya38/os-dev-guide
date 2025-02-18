bits 16
org 0x7c00

mov ah, 0x0e

mov al, '>'
int 0x10

mov al, ' '
int 0x10

read_str:
    ; read a char
    mov ah, 0x00
    int 0x16
    
    ; exit if its return key
    cmp al, 13
    je quit
    
    ; print char
    mov ah, 0x0e
    int 0x10
    jmp read_str

quit:
    jmp $

times 510 - ($-$$) db 0
dw 0xaa55
