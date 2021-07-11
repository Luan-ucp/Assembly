	SECTION .data
nome1: db 'LU', 10
nome2: db 'AN', 10

        SECTION .text
 global _start
 _start:
        mov edx, 3      ;vai exibir 3 caracters (LU ~quebra de linha~)
        mov ebx, 1      ;escrever na tela a string
        mov ecx, nome1  ;string que será escrita na tela, endereco dela
        mov eax, 4      ;comando do so
        int 0x80        ;finaliza o programa

        mov edx, 3      ;vai exibir 3 caracters (AN ~quebra de linha~)
        mov ebx, 1      ;escrever na tela
        mov ecx, nome2  ;string a escrever
        mov eax, 4      ;comando so
        int 0x80        ;finaliza o programa
