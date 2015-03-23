timer0 equ 0Bh

       .chip 8051
       org 0
       sjmp INIT
       org timer0
       sjmp sendOK


INIT: mov dptr,#table
      mov IE,#10010010b
      mov TMOD,#00101101b
      mov PCON,#10000000b
      mov SCON,#11000000b
      mov TL0,#<(65536-15000)
      mov TH0,#>(65536-15000)
      mov TH1,#253
      setb TR0

INICIO:
	sjmp INICIO


sendOK:
           clr a
           movc a,@a+dptr
           mov sbuf ,a
           jnb ti,$
           inc dptr
           clr ti
           mov TL0,#<(65536-15000)
           mov TH0,#>(65536-15000)
           reti

table: db "Meta atingida",0