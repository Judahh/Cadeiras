.chip 8051

mov	A,#00
mov	DPTR,#00

movc	A,@A+DPTR
mov		DPTR,2000H
movx 	@DPTR,A
mov		DPTR,3000H
movx	@DPTR,A
	
