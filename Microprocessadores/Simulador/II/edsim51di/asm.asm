MOV c,#00h
MOV b,#00h

init:
	CALL first
	CALL second
	CALL third
	CALL fourth
	CALL iterator
SJMP init

iterator:
;incrementa o iterador
	MOV a,b
	ADD a,#01h
	MOV b,a
	JC bigIterator
RET

bigIterator:
;incrementa o iterador
	MOV a,c
	ADD a,#01h
	MOV c,a
RET

first:
;seleciona o 1 display
	CLR p0.7
	CLR p3.3
	CLR p3.4
;pega o bit
	MOV a,b
	DA a
	ANL a,#0fh
	CALL convert
	MOV p1,a
	SETB p0.7
	CALL delay
RET

second:
;seleciona o 2 display
	CLR p0.7
	SETB p3.3
	CLR p3.4
;pega o bit
	MOV a,b
	DA a
	SWAP a
	ANL a,#0fh
	CALL convert
	MOV p1,a
	SETB p0.7
	CALL delay
RET

third:
;seleciona o 1 display
	CLR p0.7
	CLR p3.3
	SETB p3.4
;pega o bit
	MOV a,c
	DA a
	ANL a,#0fh
	CALL convert
	MOV p1,a
	SETB p0.7
	CALL delay
RET

fourth:
;seleciona o 2 display
	CLR p0.7
	SETB p3.3
	SETB p3.4
;pega o bit
	MOV a,c
	DA a
	SWAP a
	ANL a,#0fh
	CALL convert
	MOV p1,a
	SETB p0.7
	CALL delay
RET
convert:
	MOV DPTR, #table
	MOVC A, @A+DPTR
	CPL A
RET

delay: 
	MOV r0,#255
	DJNZ r0,$
RET

table:
	DB 00111111b;0
	DB 00000110b;1
	DB 01011011b;2
	DB 01001111b;3
	DB 01100110b;4
	DB 01101101b;5
	DB 01111101b;6
	DB 00000111b;7
	DB 01111111b;8
	DB 01100111b;9
	DB 01100111b;A
	DB 01100111b;B
	DB 01100111b;C
	DB 01100111b;D
	DB 01100111b;E
	DB 01100111b;F
END
