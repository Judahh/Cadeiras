Port_WR EQU 4000H
Port_RD EQU 4000H
       .chip 8051

init:  
       mov  DPTR, #Port_RD
       movx A, @DPTR
       ANL A, #0FH
       
       call convert

       mov DPTR, #Port_WR
       movx @DPTR, A
       sjmp init

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

convert:
      mov DPTR, #table
      movc A, @A+DPTR
      CPL A
      ret

;init:  setb p1.0
;       clr p1.1
;       setb p1.2
;       clr p1.3

;       call delay

;       clr p1.0
;       setb p1.1
;       clr p1.2
;       setb p1.3
;       sjmp init

;delay: mov r0,#255
;       djnz r0,$
;       ret



