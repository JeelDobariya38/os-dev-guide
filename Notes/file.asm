jmp $

; fill the rest of file with 0's
times 510 - ($-$$) db 0

; boot sector signature
db 0x55
db 0xaa
