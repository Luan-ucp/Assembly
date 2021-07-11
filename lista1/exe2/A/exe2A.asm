SECTION .data
A: db 1
B: db 2
C: db 3
D: db 4
F: db 6
G: db 7
H: db 8

SECTION .text
	global _start
	_start:
	
	mov ax, [B]
	mov dx, [C]
	mul dx		;multiplica B com C
	mov ebx, eax	;passa o resultado 6 para ebx
	mov ax, [D]
	mov dx, [F]
	mul dx		;multiplica o D e F e o valor permanece em eax
	mov edx, [A]	;atribui a edx o A
	add edx, ebx	;soma A com (b*c) [edx + ebx]
	sub edx, eax	;subtrai a soma com (d*f)
	add edx, [G]	;soma tudo com G
	sub edx, [H]	; subtrai tudo com H
	mov ebx, edx	;move tudo para ebx
	
	not ebx		;converte complemento de dois
	inc ebx

	mov eax, 1
	int 0x80
	
	
	
