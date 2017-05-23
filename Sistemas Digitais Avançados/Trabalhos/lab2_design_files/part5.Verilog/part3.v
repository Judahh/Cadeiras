// This is the complete code from Figure 8
module part3(SW,HEX0,HEX1,LEDG);
   input  [9:0] SW;		// toggle switches
	output [9:0] LEDG;
	output [0:6] HEX0;	// 7-seg displays
	output [0:6] HEX1;	// 7-seg displays
	
		wire [3:0] c0, T, z1,S0;
	reg [3:0]z0;
	reg c1;
	wire EQ;

	adder add_1(SW[8], c0[0], SW[4],SW[0], T[0]);
	adder add_2(c0[0], c0[1], SW[5],SW[1], T[1]);
	adder add_3(c0[1], c0[2], SW[6],SW[2], T[2]);
	adder add_4(c0[2], c0[3], SW[7],SW[3], T[3]);
	
	assign LEDG[3:0] = T[3:0];
	assign LEDG[7:4] = c0[3:0];
	
	segmentDecoder7 as(HEX0,T);	
	
endmodule
	