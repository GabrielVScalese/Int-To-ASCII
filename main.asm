.486                                   
.model flat, stdcall                   
option casemap :none

; Includes
include \masm32\include\windows.inc     
include \masm32\macros\macros.asm       
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib


.data
    result      db      100 dup (0) ; Array que contera o resultado final a ser printado

.code
    inicio:
        mov eax, 130 ; Valor numerico a ser printado
        mov ebx, 10 ; Divisor para obtencao de caracteres
        lea ecx, result 

    ; Divide eax por ebx (10), obtendo os caracteres (resto da divisao), ate que o valor de eax seja zero
    divide:
        xor edx, edx ; Zera o resto
        div ebx ; eax = eax / ebx
                ; edx = eax % ebx

        add edx, 48 ; Soma 48 ao valor de edx para converter em caracter ASCII

        push edx ; Armazena o resto na pilha

        ; Se eax for maior que zero continua a divisao, senao va para o inserirResult
        cmp eax, 0
        jne divide

        xor ebx, ebx ; Zera o contador

        jmp inserirResult
    
    inserirResult:
        pop eax ; Obtem o topo da pilha

        ; Insercao do valor do topo da pilha e um caracter de espaco
        mov dword ptr[ecx + ebx], eax
        mov dword ptr[ecx + ebx + 1], ' '

        add ebx, 2

        ; Realiza insercao de caracteres por 3 vezes
        cmp ebx, 6
        jne inserirResult
        jmp fim

    fim:
        print ecx ; Printa o resultado final

        end inicio

   
    


    


    
    