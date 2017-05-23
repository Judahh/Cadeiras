module part4(LEDG, SW);

	input [9:0] SW;
	output [9:0] LEDG;
	
	FlipFlopDLatch D0 (SW[0], SW[1], LEDG[0], LEDG[1]);
	FlipFlopDPositiveEdgeTriggered D1 (SW[0], SW[1], LEDG[2], LEDG[3]);
	FlipFlopDNegativeEdgeTriggered D2 (SW[0], SW[1], LEDG[4], LEDG[5]);
	FlipFlopDv2 D3 (SW[0], SW[1], LEDG[6]);
	
endmodule	

module FlipFlopDv2 (D, Clk, Q);
	input D, Clk;
	output reg Q;
	always @ (Clk or D)begin
		if (Clk)
			Q <= D;
		end	
endmodule

module FlipFlopDLatch (D, Clk, Q, nQ);
	input D, Clk;
	output reg Q, nQ;
	always @ (Clk or D)begin
		if (Clk)
			Q <= D;
		
		nQ <=~Q;
		end	
endmodule

module FlipFlopDPositiveEdgeTriggered (D, Clk, Q, nQ);
	input D, Clk;
	output reg Q, nQ;
	always @ (posedge Clk)begin
		//if (Clk)
			Q <= D;
		
		nQ <=~D;
	end
endmodule

module FlipFlopDNegativeEdgeTriggered (D, Clk, Q, nQ);
	input D, Clk;
	output reg Q, nQ;
	always @ (negedge Clk)begin
		//if (~Clk)
			Q <= D;
		
		nQ <=~D;
	end
endmodule
