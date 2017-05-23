.chip 8051

clr		RS1
setb	RS0
mov		R0,#32H
mov		R1,#0E5H

inicio: 
	mov		A,R0
	mov		B,A
	mov		A,R1
	mov		R0,A
	mov		R1,B
	mov 	P1,R0
	mov		P2,R1

