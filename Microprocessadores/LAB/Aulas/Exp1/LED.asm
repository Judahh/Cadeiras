       .chip 8051

init:  setb p1.0
       clr p1.1
       setb p1.2
       clr p1.3
       
       call delay
       
       clr p1.0
       setb p1.1
       clr p1.2
       setb p1.3
       sjmp init
       
delay: mov r0,#255
       djnz r0,$
       ret