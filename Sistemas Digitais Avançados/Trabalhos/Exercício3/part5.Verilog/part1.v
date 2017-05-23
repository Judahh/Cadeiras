module part1(SW,LEDG);

	input [9:0] SW;
	output [9:0] LEDG;

	FlipFlopSR_1 SR1(SW[0],SW[1],SW[2],LEDG[0],LEDG[1]);

//	FlipFlopSR_2 SR2(R,S,Clk,Q1,Q2);

endmodule

module FlipFlopSR_1(Clk,S,R,Q1,Q2);
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

module FlipFlopSR_2(Clk,S,R,Q1,Q2);
	input R,S,Clk;
	output Q1,Q2;
	
	wire R_g, S_g, Qa, Qb;
	
	assign R_g = R & Clk;
	assign S_g = S & Clk;
	assign Qa = ~(R_g | Qb);
	assign Qb = ~(S_g | Qa);

	assign Q1 = Qa;
	assign Q2 = Qb;

endmodule	