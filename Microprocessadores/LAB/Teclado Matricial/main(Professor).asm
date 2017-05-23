pulso reg p1.0

dpy1 reg p3.0
dpy2 reg p3.1
counter EQU 0Eh

keyPressed reg 20h.0

Port_WR EQU 4000H
Port_RD EQU 4000H
       .chip 8051


     mov counter,#00h

init:
     call  refreshDisplay
     call readKeyboard
     jnb keyPressed,init
     mov r7,b
     cjne r7,#0,init
     ;call refreshCounter

     sjmp  init

readKeyboard:
             clr keyPressed

             mov p1,#feh
             mov a,p1
             cjne a,#feh,readKey
             
             mov p1,#fdh
             mov a,p1
             cjne a,#fdh,readKey

             mov p1,#fbh
             mov a,p1
             cjne a,#fbh,readKey

             mov p1,#f7h
             mov a,p1
             cjne a,#f7h,readKey

             ret

readKey:
       mov counter,#00h
       mov b,a;b=edh
       mov dptr,#codeRead
loop:
     clr a
     movc a,@a+dptr;beh
     jz getOut
     cjne a,b,incrementPointers
     mov dptr,#ASCIICode
     mov a,counter;A=7
     movc a,@a+dptr
     mov b,a;a=34h(4)
     setb keyPressed
     call releaseKey
getOut:
       ret
       

incrementPointers:
                  inc dptr;
                  inc counter
                  sjmp loop
releaseKey:
           mov p1,f0h
           mov a,p1
           cjne a,#f0h,releaseKey
           ret


refreshDisplay:
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
   call  refreshDisplay
   ret

keyboard:
         mov r0,#08h
column:
       mov @r0,#1

line:
     mov p2,@r0
     mov 78h,@r1
     JB 78h,onKey
     inc r1
     cjne r0,#11h,line
     mov r0,#08h
     inc r0
     cjne r1,#a8h,column
     ret

ASCIICode:
      DB '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'


codeRead:
      DB 7eh;0
      DB beh;1
      DB deh;2
      DB eeh;3
      DB 7dh;4
      DB bdh;5
      DB ddh;6
      DB edh;7
      DB 7bh;8
      DB bbh;9
      DB dbh;A
      DB ebh;B
      DB 77h;C
      DB b7h;D
      DB d7h;E
      DB e7h;F

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

