;---------------------------------------------------------------------
;							 INíCIO DO PROGRAMA
;---------------------------------------------------------------------
	INCLUDE	VAR.ASM	
;----------------------------------------------------------------------------

	.CHIP	8052	

	ORG	0
	SJMP	Initialize		;Desvia para a rotina de inicializa‡Æo
	
        ORG 	TIMER0
	LJMP    Clock                   ;Rotina de rel¢gio

Initialize:

	MOV	IE,#10000000b           ;Habilita todas as interrup‡äes
	mov 	IP,#00000010b           ;Prioridade ALTA para o Relogio
	mov	SP,#(128-60)		;Reserva espa‡o para pilha
 	clr     RS0                 	;Seleciona banco de registros 0
	clr     RS1
	
; ---------------------------------------------------------------------------
; INT:  TIMER0
; AÇÃO: Relógio
; ---------------------------------------------------------------------------

	setb    PT0                     ;Prioridada alta
	setb    ET0                     ;Habilitada
	clr     TF0                     ;Reseta sinalizador de pedido de INT
	clr     A.3                     ;Habilita
	clr     A.2                     ;Temporizador
	clr     A.1                     ;Modo 1 = 01b -> Contador de 16 bits
	setb    A.0
	mov     TL0,#<CLOCK_COUNTER	;Inicializa TIMER1 (byte baixo)
	mov     TH0,#>CLOCK_COUNTER	;Inicializa TIMER1 (byte alto)
	mov     TMOD,A                  ;Configura timer 0 e 1
	setb	TR0                     ;Liga o temporizador
;------------------------------------------------------------------------------
	mov     MilSeconds,#CLOCK_ENTRYS
;-----------------------------------------------------------------------------	
	mov	Hours,#00h              ;Inicializa os registros do relógio (Hora)
	mov     Minutes,#00h            ;Inicializa Minutos
	mov     Seconds,#00h       	;Inicializa Segundos

;-----------------------------------------------------------------------------
INICIO: CALL	AT_DISPLAY              ;Atualiza display
        CALL	READ_KEY                ;Ler o teclado
	JNB	SearchOK,INICIO         ;Verifica se uma tecla foi pressionada
deckey:
        MOV     A,B                     ;Copia a tecla pressionada no Acumulador
	CJNE	A,#'o',INICIO           ;Compara se é a tecla de atualização do relógio

	CALL	AT_RELOGIO              ;Se for atualiza o relógio
	sjmp	INICIO

;-----------------------------------------------------------------------------
; Sub-rotina: AT_RELOGIO
; Ação: Atualiza o relógio com dados de entrada do teclado
; Entrada: Dados de entrada no teclado
; Saídas: Hours, Minutes
;-----------------------------------------------------------------------------
AT_RELOGIO:
        clr     TR0                     ;Desliga o timer
        mov     Seconds,#AAh            ;Coloca (-) no display de Segundos
        mov     Minutes,#AAh            ;Coloca (-) no display de minutos
        mov     Hours,#AAh              ;Coloca (-) no display de horas
        CALL	WAIT_KEY                ;Espera por uma entrada no teclado ref. digito mais significativo da hora (timeout=10s)
        MOV     a,b
        anl     a,#0Fh                  ;Converte a tecla lida em binário
        swap    a                       ;Coloca o valor a ser carregado no registro de hora no nibble alto do ACC
        anl     Hours,#0Fh              ;Mascara o nibble alto do registro de horas
	orl	Hours,A                 ;Copia o nibble alto no registrado de horas
        CALL	WAIT_KEY                ;Espera por uma entrada no teclado ref. digito menos significativo da hora (timeout=10s)
        mov     a,b
        anl     a,#0Fh                  ;Converte a tecla lida em binário
        anl     Hours,#F0h              ;Mascara o nibble baixo do registro de horas
	orl	Hours,A                 ;Copia o nibble baixo no registrado de horas
        CALL	WAIT_KEY                ;Espera a entrada dos minutos
	MOV     a,b                     ;          ..
        anl     a,#0Fh                  ;          ..
        swap    a                       ;          ..
	anl     Minutes,#0Fh            ;          ..
	orl	Minutes,A               ;
        CALL	WAIT_KEY                ;
	MOV     a,b                     ;
        anl	a,#0Fh                  ;
        anl     Minutes,#F0h            ;
	orl	Minutes,A               ;
	setb    TR0                     ;Liga o timer
        RET

;-----------------------------------------------------------------------------
; Sub-rotina: WAIT_KEY
; Ação: Espera  uma tecla ser pressionada
; Entrada: Nenhuma
; Saídas: SearchOK E B
;-----------------------------------------------------------------------------
WAIT_KEY:
        call	AT_DISPLAY              ;Atualiza o display
        CALL	READ_KEY                ;Ler o teclado
        JNB	SearchOK,WAIT_KEY       ;Testa o flag sinalizador do teclado
        RET


;----------------------------------------------------------------------------

;Sub-rotina: AT_DISPLAY
;Entrada: registro de hora e minutos (Hours, Minutes)
;Saída: Nenhuma
;Ação: Atualiza o display de 7 segmentos de horas e minutos
;-----------------------------------------------------------------------------
AT_DISPLAY:
        mov     p2,#00
        mov     a,Minutes
	CALL	AT_DPY_MIN              ;Chama rotina de atualiza o display de minutos
        mov     a,Hours
	CALL	AT_DPY_HORA             ;Chama rotina de atualiza o display de horas
	RET
;-----------------------------------------------------------------------------
;Sub-rotina: AT_DPY_MIN
;Entrada: registro Minutos (Minutes)
;Saída: Nenhuma
;Ação: Atualiza o display de minutos
;-----------------------------------------------------------------------------
AT_DPY_MIN:
	push    a
        anl     a,#0Fh
	mov	dptr,#table
	movc	a,@a+dptr
	cpl     a
        setb    p2.2            ;P2.2 = Habilita o display menos significativo dos minutos
        mov     p0,a
	pop     a
	swap    a
        anl     a,#0Fh
	mov	dptr,#table
	movc	a,@a+dptr
	cpl     a
        clr     p2.2
        setb    p2.0            ;P2.0 = Habilita o display mais significativo dos minutos
        mov     p0,a
	ret
;-----------------------------------------------------------------------------
;Sub-rotina: AT_DPY_HORA
;Entrada: registro Minutos (Hours)
;Saída: Nenhuma
;Ação: Atualiza o display de horas
;-----------------------------------------------------------------------------
AT_DPY_HORA:
	push    a
        anl     a,#0Fh
	mov	dptr,#table
	movc	a,@a+dptr
	cpl     a
        clr     p2.0
        setb    p2.1            ;P2.1 = Habilita o display menos significativo das horas
        mov     p0,a
	pop     a
	swap    a
        anl     a,#0Fh
	mov	dptr,#table
	movc	a,@a+dptr
	cpl     a
	clr     p2.1
        setb    p2.3            ;P2.3 = Habilita o display mais significativo das horas
	mov     p0,a
	ret
;-----------------------------------------------------------------------------
DELAY:
         MOV     R4,#100
         CLR     P2.6
         DJNZ    R4,$
         SETB    P2.6
         RET
;-----------------------------------------------------------------------------
; Tabela de conversão dos valores binários (0-A) em 7 segmentos
;-----------------------------------------------------------------------------
table:  DB	00111111b    ; 0                      ____a____          a=d0
	DB	00000110b    ; 1                    /          /         b=d1
	DB      01011011b    ; 2                  f/          /          c=d2
	DB	01001111b    ; 3                  /          /b          d=d3
	DB	01100110b    ; 4                 /____g____ /            e=d4
	DB	01101101b    ; 5                /          /             f=d5
	DB	01111101b    ; 6              e/          /c             g=d6
	DB	00000111b    ; 7              /          /               h=d7
	DB	01111111b    ; 8             /____d_____/
	DB	01101111b    ; 9                           *h
        DB      01000000b    ; Ah = (-)
        DB      00000000b    ; Eh = ( ) Display apagado
;-----------------------------------------------------------------------------
        INCLUDE	CLOCK.ASM
        INCLUDE TECLADO.ASM

	END
;-----------------------------------------------------------------------------
