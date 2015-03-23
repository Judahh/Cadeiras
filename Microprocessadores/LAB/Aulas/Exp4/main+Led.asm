keyPressed reg 20h.0
counter equ 0Eh

  .chip 8051

init:
     clr p2.2
     call delay1Second
     setb p2.2
     call delay1Second

     call readKeyboard
     jnb keyPressed,init
     mov a,b
     call convert
     mov p0,a
     sjmp init

convert:
        anl a,#0Fh
        mov dptr,#table
        movc a,@a+dptr
        cpl a
        ret

delay1Second: 
              mov R0,#7
loop1: 
       mov R1, #0ffh
loop2: 
       mov R2, #2fh
       djnz R2, $
       djnz R1, loop2
       djnz R0, loop1
       ret

readKeyboard:
             clr keyPressed
             mov P1,#0FEh
             mov A,P1
             cjne A,#0FEh,readKey
             mov P1,#0FDh
             mov A,P1
             cjne A,#0FDh,readKey
             mov P1,#0FBh
             mov A,P1
             cjne A,#0FBh,readKey
             mov P1,#0F7h
             mov A,P1
             cjne A,#0F7h,readKey
             ret

readKey:
	 mov b,a
	 mov counter,#0
	 mov dptr,#lineXColumnCodeTable
checkIfKeyIsPressed:
	            clr a
	            movc a,@a+dptr
	            jz getOut
	            cjne a,b,incrementPointers
searchKeyValue:
	       mov dptr,#keyboardLayoutTable
	       mov a,counter
	       movc a,@a+dptr
	       setb keyPressed
	       mov b,a
               call checkKey
getOut:
       ret

incrementPointers:
	          inc dptr
	          inc counter
	          sjmp checkIfKeyIsPressed

checkKey:
	 mov p1,#F0h
checkIfKeyIsReleased: 	
                       mov a,p1
	               cjne a,#F0h,checkIfKeyIsReleased
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

lineXColumnCodeTable:
            db EEh,DEh,BEh,7Eh
            db EDh,DDh,BDh,7Dh
            db EBh,DBh,BBh,7Bh
            db E7h,D7h,B7h,77h,0

keyboardLayoutTable:
            db '7','8','9',Ah
            db '4','5','6',Bh
            db '1','2','3',Ch
            db Fh,'0',Eh,Dh
            end
                                                                                     h\
