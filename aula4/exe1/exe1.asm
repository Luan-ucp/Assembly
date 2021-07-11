SECTION .data
	vet: db 1,1,1,1 
	soma: db 0
SECTION .text
	global _start
	_start:
	
	mov eax, 0		;limpa eax
		
	mov edx, 0
	inc edx			;edx = 1 (primeira posicao
	mov ebx, 2		; atribui 2 a ebx
	mov eax, 1		;carrega o valor da primeira posicao
	add [soma], eax		;soma eax a soma (somador)
	mov [vet+edx], ebx	;atribui 2 a segunda posicao
	add [soma], ebx		;soma 1 + 2
	inc edx			;edx = 2 segunda posicao
	add ebx, 2		;ebx = 4
	mov [vet+edx], ebx	;atribui 4 a terceira posicao
	add [soma], ebx		;soma 1 + 2 + 4 
	inc edx			;edx = 3 terceira posicao
	add ebx, 4		;ebx = 8 (4+4)
	mov [vet+edx], ebx	;atribui 8 a terceira posicao
	add [soma], ebx 	;soma 1 + 2 + 4 + 8
	
;	mov ebx, [soma]	;somatorio final
	
	mov eax, 1
	int 0x80


	
	
		
