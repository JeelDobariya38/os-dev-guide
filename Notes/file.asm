bits 16
org 0x7c00

mov ah, 0x0e ; teletype mode
mov bx, data ; init the bl register

print:
    mov al, [bx]
    cmp al, 0
    je quit
    int 0x10
    inc bx
    jmp print

quit:
    jmp $

data:
    db "My Simple OS!!!", 0

times 510 - ($-$$) db 0
dw 0xaa55
