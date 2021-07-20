%include "macros.txt"

	SECTION .data
base db 5
expo db 2

	SECTION .text
global _start
	_start:

	mov ebx, 0
	mov eax, 0
	mov ecx, 0

	multi al

	mov ebx, 0
	mov bl, al
	
	mov eax, 1
	int 0x80
