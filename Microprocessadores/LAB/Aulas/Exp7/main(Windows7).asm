MILISEGUNDOS 	EQU 0Ah
TIMER0_COUNTER EQU	65535-50000
FLAG_1S	reg	20h.0
PULSO	reg	P1.0

			.chip 8051
			org	0
			sjmp	init
			org	0Bh
			ljmp	TIME_1S
init: mov	sp,#(128-15)
			mov	IE,#10000010b
			mov TL0,#<TIMER0_COUNTER
			mov	TH0,#>TIMER0_COUNTER
			mov	TMOD,#01010001b
			mov	TL1,#00
			mov	TH1,#00
			
			mov	MILISEGUNDOS,#20
			clr	FLAG_1S
			
inicio: call	AT_DISPLAY
				JB	PULSO,inicio
				JNB	PULSO,$
				MOV	TL1,#00
				MOV	TH1,#00
				SETB	TR1
				SETB	TR0
				CALL	AT_DISPLAY
				JNB		FLAG_1S,$-3
				CLR		TR1
				CLR		FLAG_1S
				sjmp	inicio
				
AT_DISPLAY: mov	p2,#00
						call	AT_DPY_TL1
						call	AT_DPY_TH1
						mov		p2,#00
						RET
AT_DPY_TL1: mov	a,TL1
						call convert
						setb	p2.5
						mov		p0,a
						call delay
						mov a,TL1
						swap a
						call convert
						clr p2.5
						mov p0,a
						setb p2.4
						call delay
						ret
						
AT_DPY_TH1: mov a,TH1
						call convert
						clr p2.4
						mov p0,a
						setb p2.3
						call delay
						mov a,TH1
						swap a
						call convert
						clr p2.3
						mov p0,a
						setb p2.2
						call delay
						ret
convert: anl a,#0Fh
				 mov	dptr,#table
				 movc	a,@a+dptr
				 cpl a
				 ret
				 
delay: mov	r7,#255
			 djnz	r7,$
			 ret
			 
TIME_1S: mov TL0,#<TIMER0_COUNTER
				 mov	TH0,#>TIMER0_COUNTER
				 djnz	MILISEGUNDOS,EXIT
				 mov	MILISEGUNDOS,#20
				 SETB FLAG_1S
				 CLR	TR0
EXIT:	RETI

table: DB 00111111b;0
       DB 00000110b;1
       DB 01011011b;2
       DB 01001111b;3
       DB 01100110b;4
       DB 01101101b;5
       DB 01111101b;6
       DB 00000111b;7
       DB 11111111b;8
       DB 01100111b;9
       DB 01110111b;A
       DB 01111100b;B
       DB 00111001b;C
       DB 01011110b;D
       DB 01111001b;E
       DB 01110001b;F

			 end


