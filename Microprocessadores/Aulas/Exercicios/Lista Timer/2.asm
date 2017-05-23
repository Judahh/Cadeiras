        .chip 8051

        mov TMOD,#09h
        setb TR0

INICIO:
       clr P1.0
       jnb INT0,$
       mov TL0,#<(65536-20000)
       mov TH0,#>(65536-20000)

       jb INT0,$
       jnb TF0,FOTO
       clr TF0
       sjmp INICIO

FOTO: 
      setb P1.0
      sjmp INICIO
      

	   
