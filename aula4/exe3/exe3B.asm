SECTION .data
var: db 2

SECTION .text
	global _start
	_start:
	
	mov ax, [var]
	mov bx, -1
	imul bx
	mov ebx, eax
	
	mov eax, 1
	int 0x80
	

