READ_KEY:
    clr	    SearchOK
    mov     P1,#0FEh           ; alimenta a primeira linha do teclado
    mov     A,P1               ; Le teclado
    cjne    A,#0FEh,leu        ; Compara o valor lido com FEh
    mov     P1,#0FDh           ; Alimenta a segunda linha do teclado
    mov     A,P1               ; Le teclado
    cjne    A,#0FDh,leu        ; Compara o valor lido com FDh
    mov     P1,#0FBh           ; Alimenta a terceira linha do teclado
    mov     A,P1               ; Le teclado
    cjne    A,#0FBh,leu        ; Compara o valor lido com FBh
    mov     P1,#0F7h           ; Alimenta a quarta linha do teclado
    mov     A,P1               ; Le teclado
    cjne    A,#0F7h,leu        ; compara o valor lido com F7h
    RET
;---------------------------------------------------------------------------        	
leu:
    mov	    B,A                ; CODIGO_LIDO guardara o codigo do teclado lido
    mov     OFFSET,#0          ; inicializa o OFFSET
    mov     dptr,#codigos_tec  ; dptr aponta para a tabela codigos_tec
procura_codigo_lido:
    clr     A                  ; Zera o acumulador
    movc    A,@A+dptr          ; Move o dptr para o acumulador
    jz 	    volta              ; Caso dptr aponte para NULL, retorna
    cjne    A,B,inc_ponteiros  ; Compara o codigo de codigos_tec com o valor lido do teclado
procura_funcao_tecla:   
    mov     dptr,#funcoes_tec  ; Dptr aponta para a tabela funcoes_tec
    mov     A,OFFSET
    movc    A,@A+dptr          ; Chama rotina que le um valor na tab. funcoes_tec
    setb    SearchOK           ; Seta o sinalizador de leitura de tecla válida
    MOV	    b,a
    call    solta_tecla        ;Chama rotina que espera soltar a tecla
volta:
    ret
;---------------------------------------------------------------------------
inc_ponteiros:
    inc     DPTR               ; Dptr aponta para o proximo codigo em codigos_tec
    inc     OFFSET             ; Incrementa OFFSET
    sjmp    procura_codigo_lido; Compara próximo byte na ROM
;---------------------------------------------------------------------------        	
solta_tecla:
    mov     P1,#F0h             ; Varre todas as linha de uma vez com zero
st: mov	    A,P1                ; Ler a porta 1
    cjne    A,#F0h,st           ; Verifica se existe qualquer tecla pressionada
    RET
;---------------------------------------------------------------------------        
codigos_tec:
    db	    EEh,DEh,BEh,7Eh
    db      EDh,DDh,BDh,7Dh
    db 	    EBh,DBh,BBh,7Bh
    db      E7h,D7h,B7h,77h,0
funcoes_tec:
    db      '7','8','9','/'
    db      '4','5','6','X'
    db 	    '1','2','3','-'
    db      'o','0','=','+'
        
   END
   
   
   
