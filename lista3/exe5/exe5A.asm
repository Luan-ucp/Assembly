%include "macros.txt"
	SECTION .data
a db 20
b db 5

	SECTION .text

global _start
	_start:

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	op_a bl

	mov eax, 1
	int 0x80
