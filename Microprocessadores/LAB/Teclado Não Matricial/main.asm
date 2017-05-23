pulso reg p1.0
display1 reg p3.0
display2 reg p3.1
counter EQU 0Eh

Port_WR EQU 4000H
Port_RD EQU 4000H
       .chip 8051

     clr p2.4
     clr p2.5
     clr p2.6
     clr p2.7
     mov counter,#00h

init:
     call  refreshDisplay
     jb pulso,init

init2:
      call  refreshDisplay
      mov a,p2
      jnb pulso,init2

      mov b,a
      clr a
      add a,b

      da a
      mov counter,a

      sjmp  init

refreshDisplay:
               mov a,counter
               swap a
               anl a,#0fh
               call convert
               clr display2
               mov p0,a
               setb display1
               call delay


               mov a,counter
               anl a,#0fh
               call convert
               clr  display1
               mov p0,a
               setb display2
               call delay
               ret

delay:
       mov r0,#255
       djnz r0,$
       ret

convert:
        mov DPTR, #table
        movc A, @A+DPTR
        CPL A
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
      DB 01100111b;A
      DB 01100111b;B
      DB 01100111b;C
      DB 01100111b;D
      DB 01100111b;E
      DB 01100111b;F
      end

