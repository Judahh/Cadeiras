module part3(SW, LEDG);
	input [9:0] SW;
	output [9:0]LEDG;
	
	FlipFlopMasterSlaveD D1(SW[1], SW[0], LEDG[0], LEDG[1]);
	
endmodule	

module FlipFlopMasterSlaveD(Clk, D, Q1, Q2);
	input Clk, D;
	output Q1, Q2;
		
	wire Qm1, Qm2, Clk1;
	
	assign Clk1 = ~Clk;
	
	FlipFlopD D1(Clk1, D,Qm1, Qm2);
	FlipFlopD D2(Clk, Qm1, Q1, Q2);
	
endmodule	
	
	