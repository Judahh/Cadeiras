CLOCK_ENTRYS            equ             50
CLOCK_COUNTER           equ             65536-(12000000/12/CLOCK_ENTRYS)
horas                   equ             08h
minutos                 equ             09h
segundos                equ             0Ah
milisegundos            equ             0Bh
SearchOK                reg             20h.0
Counter                 equ             0Eh
         .chip 8051
         org   0
         sjmp  init
         org   0Bh
         ljmp  clock
init:    mov   sp,#(128-15)
         mov   IE,#10000010b                          ;habilita interrupção 0
         mov   TL0,#<CLOCK_COUNTER                    ;inicializa timer1 (LSB)
         mov   TH0,#>CLOCK_COUNTER                    ;inicializa timer1 (MSB)
         mov   TMOD,#01h                              ;Configura timer 0 e 1 modo 1
         setb  TR0                                    ;Liga temporizador
;--------------------------------------------------------------------------------------------------------
         mov   milisegundos,#CLOCK_ENTRYS
         mov   horas,#00h                             ;inicializa os registros do relogio(hora)
         mov   minutos,#00h                           ;inicializa minutos
         mov   segundos,#00h                          ;inicializa segundos
;--------------------------------------------------------------------------------------------------------
inicio:  call  AT_DISPLAY
         call  READ_KEY
         call  at_relogio
         jnb   SearchOK,inicio
         sjmp  inicio
;--------------------------------------------------------------------------------------------------------
AT_DISPLAY:   mov   p2,#00
              call  AT_DPY_SEC                        ;chama rotina de atualiza o display de segundos
              call  AT_DPY_MIN                        ;chama rotina de atualiza o display de minutos
              call  AT_DPY_HORA                       ;chama rotina de atualiza o display de horas
              mov   p2,#00
              ret
;--------------------------------------------------------------------------------------------------------
AT_DPY_SEC:   mov   a,segundos
              call  convert
              setb  p2.5
              mov   p0,a
              call  delay
              mov   a,segundos
              swap  a
              call  convert
              clr   p2.5
              mov   p0,a
              setb  p2.4
              call  delay
              ret
;--------------------------------------------------------------------------------------------------------
 AT_DPY_MIN:  mov   a,minutos
              call  convert
              clr   p2.4
              mov   p0,a
              setb  p2.3
              call  delay
              mov   a,minutos
              swap  a
              call  convert
              clr   p2.3
              mov   p0,a
              setb  p2.2
              call  delay
              ret
;--------------------------------------------------------------------------------------------------------
AT_DPY_HORA:  mov   a,horas
              call  convert
              clr   p2.2
              mov   p0,a
              setb  p2.1
              call  delay
              mov   a,horas
              swap  a
              call  convert
              clr   p2.1
              mov   p0,a
              setb  p2.0
              call  delay
              ret
;--------------------------------------------------------------------------------------------------------
convert:      anl   a,#0Fh
              mov   dptr,#table
              movc  a,@a+dptr
              cpl   a
              ret
;--------------------------------------------------------------------------------------------------------
delay:        mov   r7,#255
              djnz  r7,$
              ret
;--------------------------------------------------------------------------------------------------------
table:   ;     .gfedcba
         db    00111111b   ;0
         db    00000110b   ;1
         db    01011011b   ;2
         db    01001111b   ;3
         db    01100110b   ;4
         db    01101101b   ;5
         db    01111101b   ;6
         db    00000111b   ;7
         db    01111111b   ;8
         db    01100111b   ;9
         db    01000000b   ;A
         db    01111001b   ;b
         db    01000000b   ;C
         db    00111111b   ;O
         db    01111001b   ;E
         db    01010000b   ;r
;--------------------------------------------------------------------------------------------------------
clock:   push  A
         mov   TL0,#<CLOCK_COUNTER
         mov   TH0,#>CLOCK_COUNTER
         djnz  milisegundos,$Exit
         mov   milisegundos,#CLOCK_ENTRYS

         mov   a,segundos
         add   a,#01h
         da    a
         mov   segundos,a
         cjne  A,#60h,$Exit
         mov   segundos,#00h

         mov   A,minutos
         add   a,#01h
         da    a
         mov   minutos,a
         cjne  a,#60h,$Exit
         mov   minutos,#00h

         mov   a,horas
         add   a,#01h
         da    a
         mov   horas,a
         cjne  a,#24h,$Exit
         mov   horas,#00h
$Exit:   pop   A
         reti
;--------------------------------------------------------------------------------------------------------
want_key:   call   AT_DISPLAY
            call   READ_KEY
            jnb    SearchOK,want_key
            mov    a,b
            anl    a,#0Fh
            ret
            
            
 ;-------------------------------------------------------------           
            
            erro:   mov    horas,#CEh
                    mov    minutos,#FFh
                    mov    segundos,#DCh
                    clr    tr0
                    sjmp   at_relogio
;--------------------------------------------------------------------------------------------------------
erro1:              mov    horas,#CEh
                    mov    minutos,#FFh
                    mov    segundos,#DCh
                    clr    tr0
                    sjmp   at_relogio
;--------------------------------------------------------------------------------------------------------
erro2:              mov    horas,#CEh
                    mov    minutos,#FFh
                    mov    segundos,#DCh
                    clr    tr0
                    ljmp   at_relogio
;--------------------------------------------------------------------------------------------------------
at_relogio:        call   want_key
                   push   a
                   clr    c
                   mov    b,a
                   mov    a,#2
                   subb   a,b
                   jc     erro
                   clr    c
                   setb   tr0
                   pop    a
                   cjne   a,#2,at_relogio_hora
                   swap   a
                   anl    horas,#0Fh
                   orl    horas,a
at_relogio_ho2:    call   want_key
                   push   a
                   clr    c
                   mov    b,a
                   mov    a,#3
                   subb   a,b
                   jc     erro1
                   clr    c
                   setb   tr0
                   pop    a
                   anl    horas,#F0h
                   orl    horas,a
at_relogio_min:    call   want_key
                   push   a
                   clr    c
                   mov    b,a
                   mov    a,#5
                   subb   a,b
                   jc     erro2
                   clr    c
                   setb   tr0
                   pop    a
                   cjne   a,#5,at_relogio_min1
                   swap   a
                   anl    minutos,#0Fh
                   orl    minutos,a

                   call   want_key
                   anl    minutos,#F0h
                   orl    minutos,a

at_relogio_seg:    call   want_key
                   push   a
                   clr    c
                   mov    b,a
                   mov    a,#5
                   subb   a,b
                   jc     erro_s
                   clr    c
                   setb   tr0
                   pop    a
                   cjne   a,#5,at_relogio_seg1
                   swap   a
                   anl    segundos,#0Fh
                   orl    segundos,a
                   

                   call   want_key
                   anl    segundos,#F0h
                   orl    segundos,a
aki:               ret
;-----------------------------------------------------
erro_s:              mov    horas,#CEh
                    mov    minutos,#FFh
                    mov    segundos,#DCh
                    clr    tr0
                    ljmp   at_relogio
;--------------------------------------------------------------------------------------------------------
at_relogio_hora:    swap   a
                    anl    horas,#0Fh
                    orl    horas,a
                    call   want_key
                    anl    horas,#F0h
                    orl    horas,a
                    call   at_relogio_min
                    
at_relogio_min1:     swap   a
                    anl    minutos,#0Fh
                    orl    minutos,a
                    call   want_key
                    anl    minutos,#F0h
                    orl    minutos,a
                    call   at_relogio_seg
                    
at_relogio_seg1:    swap   a
                    anl    segundos,#0Fh
                    orl    segundos,a
                    call   want_key
                    anl    segundos,#F0h
                    orl    segundos,a
                    call   aki


;--------------------------------------------------------------------------------------------------------
         include Teclado.asm

         END
