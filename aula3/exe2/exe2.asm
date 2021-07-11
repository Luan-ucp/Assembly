	SECTION .data
nome: db 'ASSEMBLY',10,10
	
	SECTION .text
global _start
_start:
	mov edx,10	;irá exibir os 10 caracters
	mov ecx,nome	;copia endereco da primeira posicao de nome para ecx
	add ecx, 32	;vai para a posicao nome[7]
	mov [ecx],'E'	;coloca E na posicao 7
	add ecx, 4	;soma mais 4 para pular mais uma posicao nome[8]
	mov [ecx], 'R'	;coloca o R na posicao 8
;	mov ecx, ebx	;movendo o ebx para o ecx
	mov ebx, 1	;printar na tela
	mov eax, 4	;comando so
	int 0x80	;finaliza o programa
	;deu tudo errado aqui
