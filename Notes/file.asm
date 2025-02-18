bits 16
org 0x7c00

; initalize stack
mov sp, 0x7c00
mov bp, sp

mov bx, data ; init the bl register

read_str:
    ; read a key
    mov ah, 0x00
    int 0x16
    
    ; check wether if it return key or not.
    cmp al, 13
    je print_msg
    
    ; print the key
    mov ah, 0x0e
    push ax
    int 0x10
    
    jmp read_str


print_msg:
    mov ah, 0x0e
    mov al, [bx]
    
    cmp al, 0
    je print_str
    
    int 0x10
    inc bx
    jmp print_msg


print_str:
    ; print the all values from stack
    pop ax
    mov ah, 0x0e
    int 0x10
    
    cmp bp, sp
    je quit
    jmp print_str

quit:
    jmp $

data:
    db 10, 'Your input in reverse: ', 0

times 510 - ($-$$) db 0
dw 0xaa55
