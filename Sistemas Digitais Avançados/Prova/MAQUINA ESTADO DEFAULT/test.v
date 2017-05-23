module push(input clock, output ENSPA,output ENFLD,output MW,
output DECSP,output ENDES,output MW,output DECSP,output LRESET,
output LINT, input T, T_next);

input clock;
output  ENSPA, ENFLD, MW,
 DECSP, ENDES, MW, DECSP, LRESET, LINT;
 
 reg [32:0] T_LOCAL,T_NEXT_LOCAL;
input clock;
output SIGNAL;
always @(posedge clock or )
	begin
     T_LOCAL = T_NEXT_LOCAL;
case (T)
	begin
	
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