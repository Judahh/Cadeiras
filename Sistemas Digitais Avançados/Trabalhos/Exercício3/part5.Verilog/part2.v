module part2(SW,LEDG);

	input [9:0] SW;
	output [9:0] LEDG;
	
	
	
	FlipFlopD D1(SW[1],SW[0],LEDG[0],LEDG[1]);
	
endmodule	

module FlipFlopD(Clk,D,Q1,Q2);
	input Clk,D;
	output Q1,Q2;
	
	wire S,R;
	
	assign S = D;
	assign R = ~D;
	
	FlipFlopSR_1 SR2(Clk,S,R,Q1,Q2);
	
endmodule	