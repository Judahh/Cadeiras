PULSO REG P3.2
BUTTON REG P1.0



       .chip 8051

       org 0
       mov sp,#(125-15)
       mov IE,#10000010b
       mov TL0,#0
       mov TH0,#0
       mov TMOD,#00000001B

inicio:
       call AT_DISPLAY
       jb BUTTON,inicio
       jnb BUTTON,$
       mov TL0,#0
       mov TH0,#0
       ;call AT_DISPLAY
       jnb PULSO,$-3
       setb TR0
       jb PULSO,$
       CLR TR0
       sjmp inicio

AT_DISPLAY: mov	p2,#00
						call	AT_DPY_TL0
						call	AT_DPY_TH0
						mov		p2,#00
						RET
AT_DPY_TL0: mov	a,TL0
						call convert
						setb	p2.5
						mov		p0,a
						call delay
						mov a,TL0
						swap a
						call convert
						clr p2.5
						mov p0,a
						setb p2.4
						call delay
						ret
						
AT_DPY_TH0: mov a,TH0
						call convert
						clr p2.4
						mov p0,a
						setb p2.3
						call delay
						mov a,TH0
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
				 
delay: mov	r7,#1
       djnz	r7,$
       ret

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




