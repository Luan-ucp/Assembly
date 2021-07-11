SECTION .data

idade16: db 16
idade18: db 18
idade70: db 70
idadeIn: db 19
string1: db 'O cidadao nao pode votar  ',10
string2: db 'O voto e facultativo      ',10
string3: db 'O cidadao e obrigado votar',10

SECTION .text
	global _start
	_start:
	
	mov al, [idadeIn]
	
	cmp al, [idade16]
	jb if_kid		;nao pode votar (se menor que 16 anos)
	
	cmp al, [idade18]
	jae if_maior_igual_18		;se maior ou igual a 18 anos
	jmp continue			;continuar o codigo
if_maior_igual_18: 
	cmp al, [idade70]	;se menor ou igual a 70 anos
	jb if_must_vote		;mostrar mensagem se validar tudo

continue:			
	cmp al, [idade70]		
	jae if_facultativo		;se maior ou igual que 70 anos

	cmp al, [idade16]		;coloquei aqui, porque se a pessoa tiver 17, é menor que 18 e ja passou pela validacao e maior que 16 e obrigatoriamente cai aqui pela lógica
	jae if_facultativo		

if_kid:
	mov ecx, string1	;nao pode votar
	jmp write_screen	        
if_must_vote:
	mov ecx, string3	;obrigado votar
	jmp write_screen
if_facultativo:
	mov ecx, string2	;facultativo        

write_screen: 
        mov edx, 27
        mov ebx, 1
        mov eax, 4
        int 0x80
	mov eax, 1
	int 0x80
