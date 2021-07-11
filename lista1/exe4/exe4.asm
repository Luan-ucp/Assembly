SECTION .data
var: db 5
soma: db 0		
SECTION .text
	global _start
	_start:
	
	mov eax, 0	;limpa eax

	;************fatorial******************
	mov al, [var]	;passa 5 pra al	
	mov bh, al
	dec bh		;bh é 4
	mul bh		;al é igual a 20
	;mov ebx, eax 	;ok ate aqui
	dec bh 		;bh é 3
	;mov ebx, eax	;ok ate aqui
	mul bh		;al e 20 * 3
	;mov ebx, eax	;ok aqui também
	dec bh		;bh é 2
	mul bh		;al é 20*3*2
	dec bh 		;bh é 1
	mov edx, eax	;salva o valor em edx por enquanto
	;**************************************

	;*************soma*********************
	mov al, [var]
	mov bh, al
	dec bh		;bh é 4
	add al, bh	;soma 5 + 4
	dec bh		;bh é 3
	add al, bh	; 5 + 4 + 3
	dec bh		;bh é 2
	add al, bh	;5 + 4 + 3 + 2
	dec bh		;bh é 1
	add al, bh	;5 + 4 + 3 + 2 +1
	;*************************************

	sub edx, eax	;subtrai 120 - 15 e salva em edx
	mov ebx, edx	;move para ebx
		
	mov eax, 1
	int 0x80
							
