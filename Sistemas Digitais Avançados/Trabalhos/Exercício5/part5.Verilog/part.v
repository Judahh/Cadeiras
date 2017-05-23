module part6(SW,HEX0,HEX1,LEDG);

	input  [9:0] SW;		// toggle switches
	output [9:0] LEDG;
	output [0:6] HEX0;	// 7-seg displays
	output [0:6] HEX1;	// 7-seg displays
	
	wire [3:0]T0;
	
	assign T0[0]=SW[4];
	assign T0[1]=SW[5];
	assign T0[2]=0;
	assign T0[3]=0;

	segmentDecoder7 (HEX0,SW[3:0]);
	segmentDecoder7 (HEX1,T0[3:0]);
	
endmodule