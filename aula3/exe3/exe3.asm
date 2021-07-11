	SECTION .data
dado: db '@'
;qual o hexadecimal deste caracter?

	SECTION .text
global _start
_start:
	mov ebx,[dado]	;passando valor do caracter para ebx
	mov eax, 1
	int 0x80	
