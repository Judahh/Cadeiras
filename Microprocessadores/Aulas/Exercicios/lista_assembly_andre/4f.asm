.chip 8051

_sub:
	mov	A,R0
	mov	B,R0
	mul	AB
	mov	R1,B
	mov	R2,A
