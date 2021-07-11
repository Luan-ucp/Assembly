        SECTION .data
array: db 78,23,12,87,99,54,11,13,18,55,31,71,74,47,66,61,82,96,22,25
cont: dw 0
aux : db 0        
	SECTION .text

;****************ETAPA A*************************************************************
%macro etapa_A 1

        mov eax, 0      ;contador para a media (o al na verdade)
        mov ecx, 20     ;comparador
        mov ebx, 0     	;para zerar o ebx (conatdor do loop)

loop:
        mov al, [array+ebx]    	;primeiramente move o valor da posicao do array par al
        add [cont], ax		;faz soma do conteudo do cont (acumulador) e o valor atribuido anteriormente a al
        inc ebx                 ;incrementa o contador do loop
        cmp ebx, ecx            ;compara o contador com o tamanho do vetor
        jb loop                 ;verifica se ele é menor que 20

        mov ax, [cont]          ;passa a ax o valor do cont (acumulador)
        mov bl, 20		;move a bl o tamanho do vetor
        div bl                 	;divide o valor de ax com o 20 (bl)
	;mov [aux], al		;slava em aux o valor de al
        mov ebx, 0          	;zera ebx
        mov %1, al         	;passa como retorno o ax (quociente)
%endmacro
;**************************************************************************************
;*******************ETAPA B************************************************************
%macro	etapa_B 1

	mov eax, 0		;zera o eax
	mov al, bl		;move o valor de bx a ax
	mov cl, 10		;move para bl 10 a fim de estrair a casa decimal
	div cl			;divide o ax por cl
	mov ebx, 0		;zera ebx
	mov %1, al		;retorna o quociente (al na verdade, mas usei o ax)
%endmacro
;**************************************************************************************
;*******************ETAPA C************************************************************
%macro	etapa_C 1
	
	mov ecx, 0
	mov eax, 0
	mov edx, 0
	
	mov cl, 1
	add cl, bl		;soma a1 com an (an = valor de bx)
	mov al, cl		;move para ax o valor da soma de a1 e an
	mul bl			;multiplica bl com o al
	mov bl, 2		;move 2 para bl
	div bl			;divide por 2 o valor da multiplicacao n.(a1+an) (ax)
	mov ebx, 0		;zera o ebx
	mov %1, al		 		
		
%endmacro	
;**************************************************************************************
global _start
        _start:

        etapa_A bl	;bx possui a media do vetor array

	etapa_B	bl 	;envia o valor de bx para a proxima etapa para extrair decimal
	
	etapa_C bl	;agora no ebx possui o valor final de uma soma aritmetica [n.(a1+an)]/2
	
	;mov ebx, 0
	mov eax, 1
        int 0x80
