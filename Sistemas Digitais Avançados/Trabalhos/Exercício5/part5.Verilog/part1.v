module part1(SW,LEDG);

	input [9:0] SW;
	output [9:0] LEDG;

	wire Bt;
	
	DeBounce D0(1, SW[4], SW[3], Bt);

	counterModK counter0 (Bt, SW[0], LEDG[3:0]);
	defparam counter0.n = 4;
	defparam counter0.k = 7;
	
	
endmodule

