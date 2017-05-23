SearchOK                reg             20h.0
Counter                 equ             0Eh

         .chip 8051

         mov   A,#00111111b
         cpl   A
         setb  P3.0
         setb  P3.1
         mov   P0,A
inicio:  call  at_display
         call  READ_KEY
         jnb   SearchOK,inicio

;         mov   A,Counter
 ;        mov   dptr,#ascii
  ;       movc  A,@A+dptr
   ;      mov   B,A
    ;     call  Convert
     ;    setb  p3.1
;         clr   p3.0
 ;        mov   P0,A
  ;       mov   A,B
   ;      swap  A
    ;     call  Convert
     ;    setb  p3.0
      ;   clr   p3.1
       ;  mov   P0,A
         sjmp  inicio
;---------------------------------------------------------------------
at_display:  mov   A,B
             swap  A
             call  Convert
             clr   P3.1
             setb  P3.0
             mov   P0,A
             call  delay
             mov   A,B
             call  Convert
             clr   P3.0
             setb  P3.1
             mov   P0,A
             call delay
             clr   P3.0
             ret
;---------------------------------------------------------------------
delay:   mov   R5,#200
         djnz  R5,$
         ret
;---------------------------------------------------------------------
Convert: anl   A,#0Fh
         mov   dptr,#table
         movc  A,@A+dptr
         cpl   A
         ret
;---------------------------------------------------------------------
ascii:   db    41h,39h,38h,37h
         db    42h,36h,35h,34h
         db    43h,33h,32h,31h
         db    44h,45h,30h,46h
;---------------------------------------------------------------------
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
         db    01110111b   ;A
         db    01111100b   ;b
         db    00111001b   ;C
         db    01011110b   ;d
         db    01111001b   ;E
         db    01110001b   ;F

         include Teclado.asm

         END
