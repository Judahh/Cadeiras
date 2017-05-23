counter	equ	0Eh

.chip	8051

mov	counter,#00
start:	call	show_disp 
				jb		p1.0,start
_start: call	show_disp
				jnb		p1.0,_start
				
				mov 	a,counter
				add 	a,#01
				da 		a
				mov 	counter,a
				sjmp	start
					
show_disp: mov	a,counter			
				   anl	a,#0Fh
					 call convert
					 mov 	p0,a
					 setb	p3.1
					 call delay
								
					 mov	a,counter
					 swap	a
					 anl	a,#0Fh
					 call convert
					 clr	p3.1
					 mov	p0,a
					 setb	p3.0
					 call	delay
					 clr	p3.0
					 ret
												
convert: mov	dptr,#table
				 movc	a,@a+dptr
				 cpl	a
				 ret
						 
table:	db 	0111111b	;	0
				db	0000110b	;	1
				db 	1011011b	;	2
				db	1001111b	;	3
				db	1100110b	;	4
				db	1101101b	;	5
				db	1111101b	;	6
				db	0000111b	;	7
				db	1111111b	;	8
				db	1101111b	;	9
				
delay:  mov   r1,#255
        djnz  r1,$
        ret
