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
		
	mov dl, [D]
	mov al, -1
	imul dl		;passo o D para -D [ax = -D]
	mov cx, ax	;passo o ax para cx
	mov dl, [B]	;mover B para bx
	mov al, -1
	imul dl		;b passa a ser -b (está no ax)
	imul cx		;multiplica o ax (-D) com cx (-B) e joga para eax
	;mov ebx, eax	;conferir
	
	mov edx, eax	; move 8 para edx
	mov dl, [C]
	mov al, -1
	imul dl		;passa para ax o -C
	mov bx, [G]	;passa a bx o G
	imul bx		;multiplica -C e G resultado é -21
	add edx, eax	;soma 8 e -21 = -13
	add edx, [A]	;soma com A tudo
	add edx, [H]	;soma tudo com H
	mov ebx, edx	;passa para ebx o valor de retorno (sem sinal)
	
	;not ebx		;complemento de 2
	;inc ebx	
	  
	mov eax, 1
	int 0x80
