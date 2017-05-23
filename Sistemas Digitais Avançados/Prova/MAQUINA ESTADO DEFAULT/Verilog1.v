module machine(T1, clock);

reg [32:0] T,T_NEXT;
input clock;
output SIGNAL;
always @(posedge clock or )
	begin
     T = T_NEXT;
case (T)
	begin

		4: 
				ENPCA = 1;
				T_NEXT = 5
				
		5:	
				ENPCA = 1;
				MR = 0;
				T_NEXT = 6;
		
		6:
				ENPCA = 1;
				MR = 0;
				LMAH = 1;
				T_NEXT = 7;
				
		7:
				INCPC = 1;
				T_NEXT = 8;
		
		8:		ENPCA = 1
				T_NEXT = 9;
				
		9:		ENPCA = 1;
				MR = 0;
				T_NEXT = 10;
		
		10:	ENPCA = 1;
				MR = 0;
				LMAL = 1;
				T_NEXT = 11;
				
		11:	
				INCPC = 1;
				ENMAA = 1;
				T_NEXT = 12;
		12:
				ENMAA = 1;
				MR = 0;
				T_NEXT = 13;
				
		13:
				ENMAA = 1;
				MR = 0;
				LMD = 1;
				T_NEXT = 14;
		
		14:	
				ENDES = 1;
				LAC = 1;
				T_NEXT = 15;
				
		15:
				ENSPA = 1;
				ENFLD = 1;
				T_NEXT = 16;
				
		16:
				ENSPA = 1;
				ENFLD = 1;
				MW = 0;
				T_NEXT = 17;
				
		17:
				DECSP = 1;
				T_NEXT = 18;
		
		18:
				ENSPA = 1;
				ENDES = 1;
				T_NEXT = 19;
				
		19:
				ENSPA = 1;
				ENDES = 1;
				MW = 0;
				T_NEXT = 20;
				
		20:	DECSP = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 21;
		
		21:
				ENDES = 1;
				LMD = 1;
				T_NEXT = 22;
				
		22:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 25;
				
		23:
				ENDES = 1;
				LMD = 1;
				T_NEXT = 24;
		
		24:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 25;
				
		25:
				ENDES = 1;
				LMD = 1;
				T_NEXT = 26;
				
		26:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 27;
				
		27:
				ENDES = 1;
				LMD = 1;
				T_NEXT = 28;
				
		28:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 29
				
		29:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 30;
				
		30:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 31;
				
		31:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 32;
				
		32:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 33;
				
		33:
				ENDES = 1;
				LMD = 1;
				T_NEXT = 34;
				
		34:
				INCSP = 1;
				T_NEXT = 35;
				
		35:
				ENSPA = 1;
				T_NEXT = 36;
				
		36:
				ENSPA = 1;
				MR = 0;
				T_NEXT = 37;
				
		37:
				ENSPA = 1;
				MR = 0;
				LAC = 1;
				T_NEXT = 38;
				
		38:
				INCSP = 1;
				T_NEXT = 39;
				
		39:
				ENSPA = 1;
				T_NEXT = 40;
				
		40:
				ENSPA = 1;
				MR = 0;
				T_NEXT = 41;
		
		41:
				ENSPA = 1;
				MR = 0
				LINTE = 1;
				LCARRY = 1;
				LZERO = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 42;
		
		42:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 43;
				
		43:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 44;
				
		44:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 45;
				
		45:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T_NEXT = 46;
				
				
=============================================================================================
				
				
				
				
				
				
				
				
				
				
				
				
	default:
				
end
endcase
