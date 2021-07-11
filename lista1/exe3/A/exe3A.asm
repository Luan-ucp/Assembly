SECTION .data
var: db 255 

SECTION .text
	global _start
	_start:
	
	mov ax, [var]
	not ax
	inc ax
	mov ebx, eax
	
	mov eax, 1
	int 0x80
