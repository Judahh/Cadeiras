pulso reg p1.0

dpy1 reg p3.0
dpy2 reg p3.1
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
     ;call  show_display
     ;jb pulso,init

;init2:
     ;call  show_display
     ;mov a,p2
     ;jnb pulso,init2

     call keyboard

     sjmp  init

show_display:
     mov a,counter
     swap a
     anl a,#0fh
     call convert
     clr dpy2
     mov p0,a
     setb dpy1
     call delay


     mov a,counter
     anl a,#0fh
     call convert
     clr  dpy1
     mov p0,a
     setb dpy2
     call delay
     ret

delay:
       mov r7,#255
       djnz r7,$
       ret

convert:
      mov DPTR, #table
      movc A, @A+DPTR
      CPL A
      ret

onKey:
   mov a,r0
   anl a,#0fh
   mov r2,a

   mov a,r1
   anl a,#0fh
   subb a,#04h

   mov b,#04h
   mul ab
   add a,r2
   mov counter,a
   
   mov a,counter
   da a
   mov counter,a
   call  show_display
   ret

keyboard:
         mov r0,#a0h
         mov r1,#a4h
column:
       mov @r0,#1

line:
     mov 78h,@r1
     JB 78h,onKey
     inc r1
     cjne r0,#a4h,line
     mov @r0,#0
     inc r0
     cjne r1,#a8h,column
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

