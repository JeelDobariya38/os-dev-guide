[org 0x7c00]
[section .text]


mov ah, 0x0e
mov bx, data


print:
	mov ah, 0x0e
	mov al, [bx]

	cmp al, 0
	je halt

	int 0x10
	inc bx
	jmp print


halt:
	hlt
	jmp halt


data:
	db "Welcome To Jeel's OS!!", 10, 10, "> " 0


times 510 - ($ - $$) db 0
dw 0xaa55

