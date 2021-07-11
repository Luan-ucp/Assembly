SECTION .data

input: db 200 
cmp50: db 50
cmp100: db 100
cmp150: db 150
cmp200: db 200
valido: db 'Numero valido   ',10
invalido: db 'Numero invalido ',10

SECTION .text
	global _start
	_start:
	
	mov eax, 0	;limpa o eax
	mov al, [input]
	
	cmp al, 0
	jz _valido
	
	cmp al, [cmp50]
	jae menor_igual_100	;maior ou igual a 50
	jmp _invalido		;se o numero for menor que 50, com certeza nao sera maior ou igual a 150 ou 200
menor_igual_100:
	cmp al, [cmp100]	
	jbe _valido		;menor ou igual a 100
				;invalido, o numero ainda pode ser igual ou maior que 150 ou menor que 200

	cmp al, [cmp150]
	jae menor_igual_200	;maior ou igual a 150
	jmp _invalido		;nao é maior ou igual a 150, portanto ja descartado
menor_igual_200:
	cmp al, [cmp200]
	jbe _valido		
	jmp _invalido		;o numero nao e menor ou igual a 200

_valido: 
	mov ecx, valido
	mov edx, 17
	mov eax, 4
	mov ebx, 1
	int 0x80
	
	mov eax, 1
	int 0x80
_invalido:
	mov ecx, invalido
	mov edx, 17
	mov eax, 4
	mov ebx, 1
	int 0x80
	
	mov eax, 1
	int 0x80
