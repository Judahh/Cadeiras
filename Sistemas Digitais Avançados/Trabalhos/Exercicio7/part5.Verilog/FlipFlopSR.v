module FlipFlopSR(Clk,S,R,Q1,Q2);
	input R,S,Clk;
	output Q1,Q2;
	
	wire R_g, S_g, Qa, Qb;
	
	and (R_g, R, Clk);
	and (S_g, S, Clk);
	nor (Qa, R_g, Qb);
	nor (Qb, S_g, Qa);
	
	assign Q1 = Qa;
	assign Q2 = Qb;
	
endmodule