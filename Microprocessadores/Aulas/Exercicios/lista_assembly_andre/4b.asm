.chip 8051

clr		RS1
setb	RS0
mov		R0,#32H
mov		R1,#0E5H
 
push	R0
push	R1
pop		R0
pop		R1

