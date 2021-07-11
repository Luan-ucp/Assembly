SECTION .data 

lados: db 12,12,12
equilatero: db 'equilatero',10
isosceles: db 'isosceles',10
escaleno: db 'escaleno',10
aviso: db 'Nao e possivel fazer triangulo',10
a: db 0
b: db 0
c: db 0
cont: db 0
SECTION .text
	global _start
	_start:
	
	mov ecx,0 

;****ira passar para variaveis na memoria os valores do vetor*******	
	
	lea edx,[lados+ecx]
	mov eax, [edx]	
	mov [a], eax
	;mov ebx, [a]	;tudo ok
	inc ecx
	
	lea edx, [lados+ecx]
	mov eax, [edx]
	mov [b], eax
	inc ecx
	
	lea edx, [lados+ecx]
	mov eax, [edx]
	mov [c], eax
;********************************************************************	
	mov al,[b]
	add al, [c]		;esta soma deve ser maior que a
	cmp al,[a]		;al deve ser maior que a
	jb nao_e_triangulo	;pula se al for menor que a
	
	mov al, [a]
	add al, [c]		;esta soma deve ser menor que b
	cmp al, [b]		;al deve ser maior que b
	jb nao_e_triangulo	;pula se al for menor que b

	mov al, [b]
	add al, [a]		;esta soma deveser menor que c
	cmp al, [c]		;al deve ser menor que c
	jb nao_e_triangulo	;pula se al for menor que c
	
	jmp inicio		;pula para inicio(para saber que tipo de triangulo e) caso todas as validacoes aqui deram certo	
	
	
nao_e_triangulo:

       mov ecx, aviso
       mov edx, 31
       mov ebx, 1
       mov eax, 4
       int 0x80
       mov eax, 1
       int 0x80

;********************verifica tipo de triangulo***********************

inicio:
	;mov ebx, eax	;passou o correto, tudo ok até aqui
	mov ecx , 0
	;mov ebx, 0	;contador de quantas vezes os valores se repetem, se 0 é escaleno, se 1 isosceles se 2 equlatero
	mov edx, 0	;este ira armazenar os valores de ecx+1 (uma posicao a frente)
	mov dh, 0
do:
	lea eax, [lados+ecx]
	mov edx, ecx		;passa o valor atual de ecx ao edx
	inc edx			;edx sera sempre 1 a mais que ecx
	mov eax, [eax]
	;mov ebx, eax		;tudo ok aqui também
	;jmp exit		;foio feito um teste
	;cmp eax, [lados+edx]	;comparando o eax com o lados+edx (que é uma posicao a frente)
	lea ebx, [lados+edx]	;passa o valor do endereco lados+edx para o reg ebx
	mov ebx, [ebx]		;mov o valor de ebx par ao proprio ebx
	cmp eax, ebx		;cmp eax com o ebx (valor da frente com o de trás)	
	je somador
	inc ecx

while:  cmp ecx, 2		;controle irá parar no 2, porque ecx será 2 e edx 3 simultaneamente
	jbe do
	jmp exit		; o ecx é maior que o 2, entao sai

somador: mov ebx, [cont]	;pega o valor armazenado na variavel aux
	 inc ebx		;soma 1 toda vez que encontrar algum valor igual 
	mov [cont], ebx
	;mov [cont], dh 
	 inc ecx 		;soma 1 ao ecx 
	 jmp while

exit: 
;A IDEIA AQUI ERA: QUANDO O SOMADOR (CONT) FOR 0, SERIA UM ESCALENO, QUANDO 1 SERIA ISOSCELES E 2 AQUILATERO
;POIS, 0 QUER DIZER QUE NAO TEM NENHUM LADO QUE REPITA, 1 QUE DOIS LADOS SE REPETEM (UMA REPETICAO) E 2 3 LADOS IGUAIS (DUAS REPETICOES) 
	;mov ax, bx
	;mov eax, 0
	;mov al, dh
	;xchg ebx,dh
	;mov ebx, [ebx]
	mov eax, 1
	int 0x80	
;********************************************************************
	
