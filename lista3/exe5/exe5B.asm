%include "macros.txt"

	SECTION .data
a db 6
	SECTION .text
global _start
	_start:
	
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	op_b bl

	mov eax, 1
	int 0x80
