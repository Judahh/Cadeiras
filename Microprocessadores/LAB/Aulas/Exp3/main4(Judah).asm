b2 EQU 20h
   .chip 8051
   mov  b,#0
   mov  b2,#0


init:
     mov r1,#1
     call refresh
     djnz r1,init

     call iterator
     sjmp init

refresh:
        call first
        call delay
        call second
        call delay
        call third
        call delay
        call fourth
        call delay
        ret

iterator:
         ;incrementaoiterador
         mov a,b
         add a,#01h
         mov b,a
         jc bigIterator
         ret

bigIterator:
            ;incrementaoiterador
            mov a,b2
            add a,#01h
            mov b2,a
            ret

first:
      ;selecionao1display
      clr p0.7
      clr p3.3
      clr p3.4
      ;pegaobit
      mov a,b
      da a
      anl a,#0fh
      call convert
      mov p1,a
      setb p0.7
      ret

second:
       ;selecionao2display
       clr p0.7
       setb p3.3
       clr p3.4
       ;pegaobit
       mov a,b
       da a
       swap a
       anl a,#0fh
       call convert
       mov p1,a
       setb p0.7
       ret

third:
      ;selecionao1display
      clr p0.7
      clr p3.3
      setb p3.4
      ;pegaobit
      mov a,b2
      da a
      anl a,#0fh
      call convert
      mov p1,a
      setb p0.7
      ret

fourth:
       ;selecionao2display
       clr p0.7
       setb p3.3
       setb p3.4
       ;pegaobit
       mov a,b2
       da a
       swap a
       anl a,#0fh
       call convert
       mov p1,a
       setb p0.7
       ret

convert:
        mov DPTR,#table
        movc A,@A+DPTR
        cpl A
        ret

delay:
      mov r0,#255
      djnz r0,$
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
      DB 01111111b;8
      DB 01100111b;9
      DB 01100111b;A
      DB 01100111b;B
      DB 01100111b;C
      DB 01100111b;D
      DB 01100111b;E
      DB 01100111b;F
      end
