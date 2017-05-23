TIMER0 equ 0Bh
CLOCK_COUNTER EQU 45536h
CLOCK_ENTRYS EQU 50h

hours EQU 12h
minutes EQU 13h
seconds EQU 14h
miliseconds EQU 15h

SearchOK bit 20h.0
counter EQU 0Eh

.chip 8051

      org 0
      sjmp init
      org TIMER0
      ljmp clock
init: 
      mov sp,#(128-15)
      mov IE,#10000010b
      mov TL0,#<CLOCK_COUNTER
      mov TH0,#>CLOCK_COUNTER
      mov TMOD,#01h
      setb TR0

      mov miliseconds,#CLOCK_ENTRYS
      mov hours,#00
      mov minutes,#00
      mov seconds,#00

inicio: 
        call	WAIT_KEY
        cjne	a,#'o',inicio
        call	AT_RELOGIO
        sjmp	inicio

WAIT_KEY: 
          call AT_DISPLAY
          call READ_KEY
          jnb	 SearchOK,WAIT_KEY
          mov	 a,b
          ret

AT_RELOGIO:	
            call	WAIT_KEY
						anl		a,#0Fh
            swap	a
            anl		hours,#0Fh
            orl		hours,a
            call	WAIT_KEY
						mov 	a,b
						anl		a,#0Fh
            anl		hours,#0F0h
            orl		hours,a

            call	WAIT_KEY
						anl		a,#0Fh
            swap	a
            anl		minutes,#0Fh
            orl		minutes,a
            call	WAIT_KEY
            anl		a,#0Fh
            anl		minutes,#0F0h
            orl		minutes,a

            call	WAIT_KEY
						anl		a,#0Fh
            swap	a
            anl		seconds,#0Fh
            orl		seconds,a
            call	WAIT_KEY
						anl		a,#0Fh
            anl		seconds,#0F0h
            orl		seconds,a
						ret
						
READ_KEY: clr SearchOK
          mov P1,#0FEh
          mov A,P1
          cjne A,#0FEh,read
          mov P1,#0FDh
          mov A,P1
          cjne A,#0FDh,read
          mov P1,#0FBh
          mov A,P1
          cjne A,#0FBh,read
          mov P1,#0F7h
          mov A,P1
          cjne A,#0F7h,read
          RET

read: mov b,a ; b armazena codigo lido em P1
		  mov counter,#0
		  mov dptr,#codigos_tec

search_readed_code: clr  a
										movc a,@a+dptr
										jz 	 exit
										cjne a,b,ponteirs_inc

procura_funcao_tecla: mov  dptr,#funcoes_tec
											mov  a,counter
											movc a,@a+dptr
											setb SearchOK
											mov  b,a
											call solta_tecla
exit: ret

ponteirs_inc:	inc dptr
							inc counter
							sjmp search_readed_code

solta_tecla: mov p1,#0F0h
st: mov a,p1
		cjne a,#0F0h,st
		ret

codigos_tec: db 0EEh,0DEh,0BEh,7Eh
             db 0EDh,0DDh,0BDh,7Dh
             db 0EBh,0DBh,0BBh,7Bh
             db 0E7h,0D7h,0B7h,77h,0 

AT_DISPLAY:
      mov p2,#00h
      call AT_DPY_SEC
      call AT_DPY_MIN
      call AT_DPY_HORA
      mov p2,#00h
      ret
      
AT_DPY_SEC:
      mov a,seconds
      call convert
      setb p2.5
      mov p0,a
      call delay
      mov a,seconds
      swap a
      
      call convert
      clr p2.5
      mov p0,a
      setb p2.4
      call delay
      ret
      
AT_DPY_MIN:
      mov a,minutes
      call convert
      clr p2.4
      mov p0,a
      setb p2.3
      call delay
      mov a,minutes
      swap a
      call convert
      clr p2.3
      mov p0,a
      setb p2.2
      call delay
      ret
      
AT_DPY_HORA:
      mov a,hours
      call convert
      clr p2.2
      mov p0,a
      setb p2.1
      call delay
      mov a,hours
      swap a
      call convert
      clr p2.1
      mov p0,a
      setb p2.0
      call delay
      ret

convert: 
         anl a,#0Fh
         mov dptr,#table
         movc a,@a+dptr
         cpl a
         ret

delay:  
        mov   r1,#255
        djnz  r1,$
        ret

table: 
       DB 00111111b;0
       DB 00000110b;1
       DB 01011011b;2
       DB 01001111b;3
       DB 01100110b;4
       DB 01101101b;5
       DB 01111101b;6
       DB 00000111b;7
       DB 11111111b;8
       DB 01100111b;9
       DB 01110111b;A
       DB 01111100b;B
       DB 00111001b;C
       DB 01011110b;D
       DB 01111001b;E
       DB 01110001b;F

clock:
      mov	R6,a
      mov TL0,#<CLOCK_COUNTER
      mov TH0,#>CLOCK_COUNTER
      djnz miliseconds,_Exit
      mov miliseconds,#CLOCK_ENTRYS

      mov a,seconds
      add a,#01h
      da a
      mov seconds,a
      cjne A,#60h,_Exit
      mov seconds,#00h

      mov A,minutes
      add a,#01h
      da a
      mov minutes,a
      cjne A,#60h,_Exit
      mov minutes,#00h

      mov A,hours
      add a,#01h
      da a
      mov hours,a
      cjne A,#24h,_Exit
      mov hours,#00h

_Exit:
      mov	a,R6
      reti      
            
funcoes_tec:
            db '7','8','9','/'
            db '4','5','6','x'
            db '1','2','3','-'
            db 'o','0','=','+'
            end

