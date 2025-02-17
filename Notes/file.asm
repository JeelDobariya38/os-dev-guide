bits 16
org 0x7c00

mov ah, 0x0e ; teletype mode
mov al, 64

print:
    ; print the current uppercase alphabet character
    inc al
    int 0x10

    ; print the current lowercase alphabet character
    add al, 32
    int 0x10
    sub al, 32
    
    cmp al, 'Z'
    je quit
    jmp print

quit:
    jmp $

times 510 - ($-$$) db 0
dw 0xaa55
