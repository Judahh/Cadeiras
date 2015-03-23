READ_KEY:
         clr SearchOK
         mov P1,#0FEh
         mov A,P1
         cjne A,#0FEh,leu
         mov P1,#0FDh
         mov A,P1
         cjne A,#0FDh,leu
         mov P1,#0FBh
         mov A,P1
         cjne A,#0FBh,leu
         mov P1,#0F7h
         mov A,P1
         cjne A,#0F7h,leu
         RET

leu:
	mov b,a
	mov counter,#0
	mov dptr,#codigos_tec
procura_codigo_lido:
	clr a
	movc a,@a+dprt
	jz sai
	cjne a,b,inc_ponteiros
procura_funcao_tecla:
	mov dprt,#funcoes_tec
	mov a,counter
	movc a,@a+dptr
	setb SearchOK
	mov b,a
	call solta_tecla
sai:
	ret

inc_ponteiros:
	inc dptr
	inc counter
	sjmp procura_codigo_lido

solta_tecla:
	mov p1,#F0h
st: 	mov a,p1
	cjne a,#F0h,st
	ret
codigos_tec:
            db EEh,DEh,BEh,7Eh
            db EDh,DDh,BDh,7Dh
            db EBh,DBh,BBh,7Bh
            db E7h,D7h,B7h,77h
            
funcoes_tec:
            db '7','8','9',':'
            db '4','5','6',';'
            db '1','2','3','<'
            db 'o','0','>','='
            end
