module flipFlopDCount(Clk, Clr,En, Q);

input Clk,Clr, En;
output reg Q;

always@(posedge Clk)
if(Clr)
Q = 0;
else	if(En)
	Q <= Q + 1;

endmodule
