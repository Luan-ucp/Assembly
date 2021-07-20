	SECTION .data
array db 11,155,7
menor db 0
	
	SECTION .text

%macro	verifica_menor 1

		mov eax, 0
		mov ebx, 0
		mov ecx, 0

		mov al, [array]		;move para o al o primeiro elemento do array
		mov [menor], al		;move para menor o al
	
loop:		mov al, [array+ecx]	;incia o loop movendo o valor da primeira posicao ao al
		cmp al, [menor]		;compara com o valor contido em menor
		jb if_menor		;se o al for menor...
		jmp else_continue

if_menor:	mov [menor], al		;...passa o valor de al para o menor
			
else_continue:	inc ecx			;incrementa o contador
		cmp ecx, 3		;compara com 3 (tamanho do array)
		jb loop			;se menor, volta ao loop

		mov bl, [menor]		;retorna o valor de menor
	
%endmacro

global _start
_start:
	
	verifica_menor bl
	
	mov eax, 1
	int 0x80
	
