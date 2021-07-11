SECTION .data
P: db 2,3,5
N: db 8,6,7
SomaP: db 0
SomaPN: db 0

SECTION .text
	global _start
	_start:
	
	mov edx, [P]
	mov [SomaP], edx
	mov edx, [P+1]
	add [SomaP], edx
	mov edx, [P+2]
	add [SomaP], edx	;fiz somatório dos Pesos para SomaP
	;mov ebx, [SomaP] ate aqui okay
	mov al, [N]
	mov ah, [P]
	mul ah
	mov [SomaPN], al
	;mov ebx, [SomaPN]	até aqui okay
	mov al, [N+1]
	mov ah, [P+1]
	mul ah
	add [SomaPN], al	;multiplica o segundo valor e já soma a SomaPN
	mov al, [N+2]
	mov ah, [P+2]
	mul ah
	add [SomaPN], al	;até aqui foi feita a soma dos valores de peso * nota
	sub edx, [SomaP]
	mov ebx, 0
	
	sub [SomaPN], edx
	inc ebx			;soma 1  a media
	sub [SomaPN], edx
	inc ebx			;soma 2 a media
	sub [SomaPN], edx			
	inc ebx			;soma 3 a media
	sub [SomaPN], edx
	inc ebx			;soma 4 a media
	sub [SomaPN], edx
	inc ebx			;soma 5 a media
	sub [SomaPN], edx
	inc ebx			;soma 6 a media
	
	sub ebx, 5		;irá retornar 1, pois 6 - 5 = 1 então o aluno foi aprovado

	mov eax, 1
	int 0x80
