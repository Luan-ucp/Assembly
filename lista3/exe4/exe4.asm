%include "macro.txt"

	SECTION .data
n db 2 

	SECTION .text
global _start
	_start:

	fibonacci bl 

	mov eax, 1
	int 0x80
