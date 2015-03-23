        .chip 8051

        org 0
        sjmp INIT
        org timer0
        sjmp INTERRUPTION
        mov TMOD,#09h
        setb TR0

INIT:
       clr P1.0
       jnb INT0,$
       mov 40h,#20

       jb INT0,$
       jnb TF0,FOTO
       clr TF0
       sjmp INICIO

RECHARGE:
         djnz  40h,CHARGE
         ret
         
INTERRUPTION:

             reti;

CHARGE:
       mov TL0,#<(65536-50000)
       mov TH0,#>(65536-50000)
       ret


