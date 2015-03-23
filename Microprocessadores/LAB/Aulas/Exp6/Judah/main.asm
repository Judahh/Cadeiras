TIMER0 equ 0Bh ;endereco do timer/contador 0
TIMER1 equ 1Bh ;endereco do timer/contador 0
T0_CLOCK_COUNTER EQU 45536h ; 65536-20000
T0_CLOCK_ENTRYS  EQU 50
T1_CLOCK_COUNTER EQU 15536h ; 65536-50000
T1_CLOCK_ENTRYS  EQU 100

hours EQU 12h ;endereco da horas
minutes EQU 13h ;endereco dos minutos
seconds EQU 14h ;endereco dos segundos
miliseconds EQU 15h ;endereco dos milisegundos

flag_timeout reg 20h.1
SearchOK     reg 20h.0
counter      EQU 0Eh

.chip 8051

      org 0
      sjmp init
      org  TIMER0
      ljmp clock
      org  TIMER1
      ljmp timeout
init:
	mov	sp,#(128-20)
	mov	IE,#10001010b ;habilita interrupções do timer 0 e 1
	mov	TL0,#<T0_CLOCK_COUNTER ;inicializa timer 0 (byte baixo)
	mov	TH0,#>T0_CLOCK_COUNTER ;inicializa timer 0 (byte alto)
	mov	TL1,#<T1_CLOCK_COUNTER ;inicializa timer 1 (byte baixo)
	mov	TH1,#>T1_CLOCK_COUNTER ;inicializa timer 1 (byte alto)
	mov	TMOD,#00010001b ; habilita timers 0 e 1 de 16 bits
	setb	TR0 ;liga timer 0 (responsavel pelo tempo)

	mov	miliseconds,#T0_CLOCK_ENTRYS
	mov	hours,#12h ;inicializa hora
	mov	minutes,#23h ;inicializa minuto
	mov	seconds,#56h ;inicializa segundo

start:
	clr	TR1 ;desliga timer 1 (responsavel pelo timeout)
	clr	flag_timeout ;limpa flag de timeout
	call	WAIT_KEY
	cjne	a,#'o',start ;verifica se foi digitada a tecla para setar o relogio
	setb	TR1 ;comeca a contar tempo de setagem de relogio
	call	refreshClock ;atualiza relogio
	sjmp	start

WAIT_KEY:
	call	refreshDisplay ;atualiza display
	call	READ_KEY
	jb	flag_timeout,start
	jnb	SearchOK,WAIT_KEY
	mov	a,b
	ret

refreshClock:;atualiza reogio
	call	WAIT_KEY
	anl	a,#0Fh
        mov	R2,a
        clr	c
        mov    	b,a
        mov    	a,#02
        subb   	a,b
        jc     	refreshClock
        mov	a,R2
        swap	a
        anl	hours,#0Fh
        orl	hours,a

getHours:;recebe horas do teclado
	call	WAIT_KEY
	anl	a,#0Fh
        mov	R2,a
        mov	a,hours
        anl	a,#F0h
        orl	a,R2
        clr	c
        mov	b,a
        mov	a,#23h
        subb	a,b
        jc	getHours
        mov	a,R2
        anl	hours,#F0h
        orl	hours,a

getMinutes:;recebe minutos do teclado
	call	WAIT_KEY
	anl	a,#0Fh
        mov	R2,a
        clr	c
        mov	b,a
        mov	a,#05
        subb	a,b
        jc	getMinutes
        mov	a,R2
        swap	a
        anl	minutes,#0Fh
        orl	minutes,a

        call	WAIT_KEY
        anl	a,#0Fh
        anl	minutes,#F0h
        orl	minutes,a

getSeconds:;recebe segundos do teclado
	call	WAIT_KEY
	anl	a,#0Fh
        mov	R2,a
        clr	c
        mov	b,a
        mov	a,#05
        subb	a,b
        jc	getSeconds
        mov	a,R2
        swap	a
        anl	seconds,#0Fh
        orl	seconds,a

        call	WAIT_KEY
	anl	a,#0Fh
        anl	seconds,#0F0h
        orl	seconds,a
	ret

READ_KEY:;le tecla digitada (se foi digitada)
	clr	SearchOK
        mov	P1,#0FEh
        mov	A,P1
        cjne	A,#0FEh,read
        mov	P1,#0FDh
        mov	A,P1
        cjne	A,#0FDh,read
        mov	P1,#0FBh
        mov	A,P1
        cjne	A,#0FBh,read
        mov	P1,#0F7h
        mov	A,P1
        cjne	A,#0F7h,read
        ret

read:;b armazena codigo lido em P1
	mov 	b,a
	mov 	counter,#0
	mov 	dptr,#keyboardCodesTable

searchReadCode:;"decodifica" codigo da tecla
	clr	a
	movc	a,@a+dptr
	jz	exit
	cjne	a,b,incrementsPointers

searchKeyboardTableKey:;verifica o valor digitado
	mov	dptr,#keyboardTable
	mov	a,counter
	movc	a,@a+dptr
	setb	SearchOK
	mov	b,a
	call	releasedKey
exit:
	ret

incrementsPointers:;incrementa ponteiro e contador
	inc	dptr
	inc	counter
	sjmp	searchReadCode

releasedKey:;verifica se a tecla foi solta
	mov	p1,#0F0h
released:
	mov	a,p1
	cjne	a,#0F0h,released
	ret

keyboardCodesTable:;tabela com codigos do teclado
	db 0EEh,0DEh,0BEh,7Eh
	db 0EDh,0DDh,0BDh,7Dh
	db 0EBh,0DBh,0BBh,7Bh
	db 0E7h,0D7h,0B7h,77h,0

refreshDisplay:;atualiza display
	mov	p2,#00h
	call	refreshSecondDisplay
	call	refreshMinuteDisplay
	call	refreshHourDisplay
	mov	p2,#00h
	ret

refreshSecondDisplay:;atualiza display dos segundos
	mov	a,seconds
	call	convert
	setb	p2.5
	mov	p0,a
	call	delay
	mov	a,seconds
	swap	a

	call	convert
	clr	p2.5
	mov	p0,a
	setb	p2.4
	call	delay
	ret

refreshMinuteDisplay:;atualiza display dos minutos
	mov	a,minutes
	call	convert
	clr	p2.4
	mov	p0,a
	setb	p2.3
	call	delay
	mov	a,minutes
	swap	a
	call	convert
	clr	p2.3
	mov	p0,a
	setb	p2.2
	call	delay
	ret

refreshHourDisplay:;atualiza display das horas
	mov	a,hours
	call	convert
	clr	p2.2
	mov	p0,a
	setb	p2.1
	call	delay
	mov	a,hours
	swap	a
	call	convert
	clr	p2.1
	mov	p0,a
	setb	p2.0
	call	delay
	ret

convert:;converte valor para o valor do display de 7 segmentos
	anl	a,#0Fh
	mov	dptr,#displayTable
	movc	a,@a+dptr
	cpl	a
	ret

delay:
	mov	r1,#255
	djnz	r1,$
	ret

displayTable:;tabela com os codigos do display de 7 segmentos
	DB 00111111b;0
	DB 00000110b;1
	DB 01011011b;2
	DB 01001111b;3
	DB 01100110b;4
	DB 01101101b;5
	DB 01111101b;6
	DB 00000111b;7
	DB 01111111b;8
	DB 01100111b;9
	DB 01110111b;A
	DB 01111100b;B
	DB 00111001b;C
	DB 01011110b;D
	DB 01111001b;E
	DB 01110001b;F

timeout:;recarrega timer 1 (responsavel por timeout) e dispara timeout
	mov	TL1,#<T1_CLOCK_COUNTER
	mov	TH1,#>T1_CLOCK_COUNTER
	djnz	T1_CLOCK_ENTRYS,endTimeout
	mov	T1_CLOCK_ENTRYS,#199
	setb	flag_timeout
	cpl	p3.0

endTimeout:
	reti

clock:  ; verifica relogio e recarrega timer 0 (responsavel velo relogio)
	mov	R6,a
	mov	TL0,#<T0_CLOCK_COUNTER
	mov	TH0,#>T0_CLOCK_COUNTER
	djnz	miliseconds,clockExit
	mov	miliseconds,#T0_CLOCK_ENTRYS

	mov	a,seconds
	add	a,#01h
	da	a
	mov	seconds,a
	cjne	A,#60h,clockExit
	mov	seconds,#00h

	mov	A,minutes
	add	a,#01h
	da	a
	mov	minutes,a
	cjne	A,#60h,clockExit
	mov	minutes,#00h

	mov	A,hours
	add	a,#01h
	da	a
	mov	hours,a
	cjne	A,#24h,clockExit
	mov	hours,#00h

clockExit:
	mov	a,R6
	reti

keyboardTable:;valores do teclado
	db '7','8','9','/'
	db '4','5','6','x'
	db '1','2','3','-'
	db 'o','0','=','+'
	end





