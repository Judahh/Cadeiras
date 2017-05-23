READ_KEY: clr   SearchOK
          mov   P1,#FEh                 ;alimenta a primeira linha do teclado
          mov   A,P1                    ;Le teclado
          cjne  A,#FEh,leu              ;Compara o valor lido com FEh:
          mov   P1,#FDh                                  ;Se for igual nenhuma tecla da primeira linha foi pressionada continua executando
          mov   A,P1                                     ;Se for diferente uma tecla da primeira linha foi pressionado, vai para o subprograma LEU
          cjne  A,#FDh,leu
          mov   P1,#FBh
          mov   A,P1
          cjne  A,#FBh,leu
          mov   P1,#F7h
          mov   A,P1
          cjne  A,#F7h,leu
          ret
;-------------------------------------------------------------------------------------
leu:                       mov   B,A
                           mov   Counter,#0
                           mov   dptr,#codigo_tec
procura_codigo_lido:       clr   A
                           movc  A,@A+dptr
                           jz    sai
                           cjne  A,B,incr_ponteiros
procura_funcao_tecla:      mov   dptr,#funcoes_tec
                           mov   A,Counter
                           movc  A,@A+dptr
                           setb  SearchOK
                           mov   B,A
                           call  solta_tecla
sai:                       ret
;-------------------------------------------------------------------------------------
incr_ponteiros:            inc   dptr
                           inc   Counter
                           sjmp  procura_codigo_lido
;-------------------------------------------------------------------------------------
solta_tecla:               mov   P1,#F0h
st:                        mov   A,P1
                           cjne  A,#F0h,st
                           ret
;-------------------------------------------------------------------------------------
codigo_tec:                db    7Eh,BEh,DEh,EEh
                           db    7Dh,BDh,DDh,EDh
                           db    7Bh,BBh,DBh,EBh
                           db    77h,B7h,D7h,E7h,0
;-------------------------------------------------------------------------------------
funcoes_tec:               db    0Ah,'9','8','7'
                           db    0Bh,'6','5','4'
                           db    0Ch,'3','2','1'
                           db    0Dh,0Eh,'0',0Fh

