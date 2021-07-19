%include "macros.txt"

 	SECTION .data

size: db 11
vet:  db 7, 8, 1, 99, 0, 9, 3, 2, 6, 4, 5, 10
count: db 0
median: db 0
	SECTION .text 

 global _start
	_start:
 	
	mov eax, 0
	mov ebx, 0
	mov edx, 0

	ordenacao 
	
	mov ebx, 0
	mov eax, 0
	mov ecx, 0
	
	mediana	

	exibe
		
	mov ebx, 0
	mov ebx, [median]	;para mostrar o valor da mediana		
	mov eax,1 
	int 0x80 
