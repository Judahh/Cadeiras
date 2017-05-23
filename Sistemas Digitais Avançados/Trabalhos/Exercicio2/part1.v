// This is the complete code from Figure 8
module part1(SW,HEX0,HEX1,LEDG);
   input  [9:0] SW;		// toggle switches
	output [9:0] LEDG;
	output [0:6] HEX0;	// 7-seg displays
	output [0:6] HEX1;	// 7-seg displays

	segmentDecoder7 (HEX0,SW[3:0]);
	segmentDecoder7 (HEX1,SW[7:4]);	
	
endmodule
	
module segmentDecoder7(Display,D);	
	input [0:3] D;
	output [0:6]Display;
	
	assign Display[0] = ~(D[0]|D[2]|(D[1]&D[3])|~(D[1]|D[3])); // 3-to-1 multiplexer output
	assign Display[1] = ~(~D[1] | (D[2]&D[3]) | ~(D[2]|D[3])); // 3-to-1 multiplexer output
	assign Display[2] = ~(D[1] | ~D[2] | D[3]); // 3-to-1 multiplexer output
	assign Display[3] = ~(D[0] |(D[2]&~D[1]) | (D[2]&~D[3]) | ~(D[1]|D[3]) | (D[1]&~D[2]&D[3])); // 3-to-1 multiplexer output
	assign Display[4] = ~((D[2]&~D[3])| ~(D[1]|D[3])); // 3-to-1 multiplexer output
	assign Display[5] = ~(D[0] | (D[1]&~D[2]) | (D[1]&~D[3]) | ~(D[2]|D[3])); // 3-to-1 multiplexer output
	assign Display[6] = ~(D[0] | (D[1]&~D[2]) | (D[1]&~D[3]) | (~D[1]&D[2])); // 3-to-1 multiplexer output
	//assign Display[7] = 1; // 3-to-1 multiplexer output 
	
endmodule