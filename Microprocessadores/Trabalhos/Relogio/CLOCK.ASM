__CLOCK

; Rotina Clock --------------------------------------------------------------
; Sum†rio:
;
;	Rel¢gio do sistema.
;
; Entrada: nenhuma
; Sa°da:   nenhuma
; ---------------------------------------------------------------------------

;----------------------------------------------------------------------
Clock:
	push    PSW         ;Salva flags
	push	A			;Salva acumulador
	clr     TF0                     ;Ocorreu overflow, zera indicador
	mov     TL0,#<CLOCK_COUNTER	;Reinicializa TIMER1 (byte baixo)
	mov     TH0,#>CLOCK_COUNTER	;Reinicializa TIMER1 (byte alto)
	CLR	ET0                     ;Reabilita TIMER1
        djnz    MilSeconds,$Exit         ;Se n∆o passou 1 s, finaliza
	mov     MilSeconds,#CLOCK_ENTRYS ;

        mov	a,Seconds
	add     a,#01h			;Incrementa segundos
	da      a
	mov	Seconds,a		;Move para comparar
	cjne	A,#60h,$Exit		;Verifica se chegou 60 segundos
	mov	Seconds,#00h		;Inicializa contador de segundos

	mov	A,Minutes
	add	a,#01h			;Incrementa minuto
	da	a
	mov	Minutes,a
	cjne	A,#60h,$Exit		;Verifica se chegou 60 minutos
	mov	Minutes,#00h		;Inicializa contador de minutos

	mov	A,Hours			;Move para comparar
	add	a,#01h
	da	a
	mov	Hours,a
	cjne	A,#24h,$Exit		;Verifica se chegou 24 horas
	mov	Hours,#00h		;Inicializa contador de horas
$Exit:
	SETB	ET0
	pop	A			;Restaura acumulador
	pop     PSW                     ;Restaura flags
	RETI

; Fim Clock -----------------------------------------------------------------

; Rotina Date ---------------------------------------------------------------
; Sum†rio:
;
;	Atualiza data do sistema.
;
; Entrada: nenhuma
; Sa°da:   nenhuma
; ---------------------------------------------------------------------------
	END
	
	
