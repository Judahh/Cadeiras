pulso reg p1.0
contador equ 0Eh

   .chip 8051
   
   mov contador,#00h
   mov a,#00h
   call convert
   mov p0,a
   
inicio:
        jb pulso,$
        jnb pulso,$
        mov a,contador
        add a,#01h
        da a
        mov contador,a
        call convert
        mov p0,a
        sjmp inicio

convert: 
         mov dptr,#table
         movc a,@a+dptr
         cpl a
         ret

table: 
         db 00111111b
         db 00000110b
         db 01011011b
         db 01001111b
         db 01100110b
         db 01101101b
         db 01111101b
         db 00000111b
         db 01111111b
         db 01101111b
         
         end
         
