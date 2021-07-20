	SECTION .data
vet db 'A', 'F', 'R', 'T', 'P', 'B', 'C', 'O', 'U', 'E'
size db 10
count db 0

	SECTION .text
global _start
	_start:
	
	mov al, 0
        mov ecx, vet
        jmp for2cond

for2body:
                mov bl, al
                mov edx, ecx
                jmp for1cond

        for1body:
                mov ah,[ecx]
                mov bh,[edx]
                cmp ah, bh
                jle end
                mov [ecx], bh
                mov [edx], ah
        end:

        inc bl
        inc edx

        for1cond:
                cmp bl, [size]
                jl for1body
        inc al
        inc ecx

for2cond:
         cmp al,[size]
         jl for2body
 
;exibe

        mov ecx, vet
        mov BYTE [count], 0
        jmp for3cond

for3body:
        mov eax,4
        mov ebx,1
        mov edx,1
        int 0x80
        inc ecx
        inc BYTE [count]

for3cond:
        mov al, [count]
        cmp al, [size]
        jl for3body



	mov eax,1 
	int 0x80 
