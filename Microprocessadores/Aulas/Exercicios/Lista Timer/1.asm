timer0 equ 0Bh

       .chip 8051
       org 0
       sjmp INIT
       org timer0
       sjmp END_PULSE

INIT: mov IE,#82h ;(#10000010b)
      mov TMOD,#00000001b
      clr p2.0

INICIO: mov A,P1
	cjne A,#FEh,COMP55h
	mov TL0,#<(65536-60000)
	mov TH0,#>(65536-60000)
	setb P2.0
	setb tr0
	jb p2.0,$
	sjmp INICIO

COMP55h:cjne A,#FDh,INICIO
	mov TL0,#<(65536-15000)
	mov TH0,#>(65536-15000)
	setb P2.0
	setb TR0
	jb p2.0,$
	sjmp INICIO

END_PULSE: clr p2.0
	   reti
	   
