	SECTION .data
p db 4
x db 0

	SECTION .text

%macro fatorial 1
	
	mov eax, 0
	mov ecx, 0
	mov al, [p]
	mov cl, [p]

loop:	dec cl		;reg contador
	mul cl		;multiplica ele pelo valor de al
	cmp cl, 2	;para em 2
	jae loop	;pulo para o loop

	mov %1, al	;retorna com o resultado em al	

%endmacro

%macro soma 1

	mov eax, 0
	mov ebx, 0
	mov ecx, 0	;funcionara como contador

	mov al, [p]
	mov bl, [p]
	sub bl, 1	;subtrai 1 com antecedencia para que comece o loop com p-1 já
	
loop1:	add al, bl	;al = p + (p-1)+(p-2)...
	cmp bl, 1	;compara para saber se o bl ja chegou em 1
	sub bl, 1	;subtrai 1
	jae loop1

	mov %1, al	
%endmacro

global _start
	_start:

	
	fatorial al	;calcula o fatorial de p
	mov edx, 0
	mov dl, al	;salva o fatorial
	soma al	
	
	sub dl, al	;p! - (p + (p-1) + (p-2) ....)
	mov ebx, 0
	mov bl, dl	

	mov eax, 1
	int 0x80
