module machine(T1, clock);

reg [32:0] T;
input clock;
output SIGNAL;
always @(posedge clock or )
	begin
case (T)
	begin

		4: 
				ENPCA = 1;
				T = 5
				
		5:	
				ENPCA = 1;
				MR = 0;
				T = 6;
		
		6:
				ENPCA = 1;
				MR = 0;
				LMAH = 1;
				T = 7;
				
		7:
				INCPC = 1;
				T = 8;
		
		8:		ENPCA = 1
				T = 9;
				
		9:		ENPCA = 1;
				MR = 0;
				T = 10;
		
		10:	ENPCA = 1;
				MR = 0;
				LMAL = 1;
				T = 11;
				
		11:	
				INCPC = 1;
				ENMAA = 1;
				T = 12;
		12:
				ENMAA = 1;
				MR = 0;
				T = 13;
				
		13:
				ENMAA = 1;
				MR = 0;
				LMD = 1;
				T = 14;
		
		14:	
				ENDES = 1;
				LAC = 1;
				T = 15;
				
		15:
				ENSPA = 1;
				ENFLD = 1;
				T = 16;
				
		16:
				ENSPA = 1;
				ENFLD = 1;
				MW = 0;
				T = 17;
				
		17:
				DECSP = 1;
				T = 18;
		
		18:
				ENSPA = 1;
				ENDES = 1;
				T = 19;
				
		19:
				ENSPA = 1;
				ENDES = 1;
				MW = 0;
				T = 20;
				
		20:	DECSP = 1;
				LRESET = 1;
				LINT = 1;
				T = 21;
		
		21:
				ENDES = 1;
				LMD = 1;
				T = 22;
				
		22:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 25;
				
		23:
				ENDES = 1;
				LMD = 1;
				T = 24;
		
		24:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 25;
				
		25:
				ENDES = 1;
				LMD = 1;
				T = 26;
				
		26:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 27;
				
		27:
				ENDES = 1;
				LMD = 1;
				T = 28;
				
		28:
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 29
				
		29:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 30;
				
		30:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 31;
				
		31:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 32;
				
		32:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 33;
				
		33:
				ENDES = 1;
				LMD = 1;
				T = 34;
				
		34:
				INCSP = 1;
				T = 35;
				
		35:
				ENSPA = 1;
				T = 36;
				
		36:
				ENSPA = 1;
				MR = 0;
				T = 37;
				
		37:
				ENSPA = 1;
				MR = 0;
				LAC = 1;
				T = 38;
				
		38:
				INCSP = 1;
				T = 39;
				
		39:
				ENSPA = 1;
				T = 40;
				
		40:
				ENSPA = 1;
				MR = 0;
				T = 41;
		
		41:
				ENSPA = 1;
				MR = 0
				LINTE = 1;
				LCARRY = 1;
				LZERO = 1;
				LRESET = 1;
				LINT = 1;
				T = 42;
		
		42:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 43;
				
		43:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 44;
				
		44:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 45;
				
		45:
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				T = 46;
				
				
=============================================================================================
				
				
				
				
				
				
				
				
				
				
				
				
	default:
				
end
endcase
