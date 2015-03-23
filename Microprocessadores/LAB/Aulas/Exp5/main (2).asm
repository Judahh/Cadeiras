CLOCK_ENTRYS EQU 50
CLOCK_COUNTER EQU 65536-(12000000/12/CLOCK_ENTRYS)

horas EQU 12h
minutos EQU 13h
segundos EQU 14h
milisegundos EQU 15h

.chip 8051


      org 0
      sjmp init
      org 0Bh
      ;sjmp clock
init: mov sp,#(128-15)
      mov IE,#10000000b
      mov TL0,#<CLOCK_COUNTER
      mov TH0,#>CLOCK_COUNTER
      mov TMOD,#01h
      setb TR0

      mov milisegundos,#CLOCK_ENTRYS
      mov horas,#23h
      mov minutos,#15h
      mov segundos,#17h

inicio: call AT_DISPLAY
        sjmp inicio

AT_DISPLAY:
      mov p2,#00
      call AT_DPY_SEC
      call AT_DPY_MIN
      call AT_DPY_HORA
      mov p2,#00
      ret

AT_DPY_SEC:
      mov a,segundos
      call convert
      setb p2.5
      mov p0,a
      call delay
      mov a,segundos
      swap a

      call convert
      clr p2.5
      mov p0,a
      setb p2.4
      call delay
      ret

AT_DPY_MIN:
      mov a,minutos
      call convert
      clr p2.4
      mov p0,a
      setb p2.3
      call delay
      mov a,minutos
      swap a
      call convert
      clr p2.3
      mov p0,a
      setb p2.2
      call delay
      ret

AT_DPY_HORA:
      mov a,horas
      call convert
      clr p2.2
      mov p0,a
      setb p2.1
      call delay
      mov a,horas
      swap a
      call convert
      clr p2.1
      mov p0,a
      setb p2.0
      call delay
      ret

convert: anl a,#0Fh
         mov dptr,#table
         movc a,@a+dptr
         cpl a
         ret

delay:   mov r7,#255
         djnz r7,$
         ret

table: db 00111111b ;0
       db 00000110b ;1
       db 01011011b ;2
       db 01001111b ;3
       db 01100110b ;4
       db 01101101b ;5
       db 01111101b ;6
       db 00000111b ;7
       db 01111111b ;8
       db 01101111b ;9
       db 01000000b ;Ah
       db 01111001b ;Bh
       db 01010000b ;Ch
       db 01011100b ;Dh
       db 00000000b ;Eh

       end
