// This is the complete code from Figure 8
module part5 (SW, HEX0, HEX1, HEX2, HEX3);
	input  [0:9] SW;		// toggle switches
	output [0:7] HEX0;	// 7-seg displays
	output [0:7] HEX1;	// 7-seg displays
	output [0:7] HEX2;	// 7-seg displays
	output [0:7] HEX3;	// 7-seg displays

	// wire [0:7] M;

	// module mux_2bit_3to1 (S, U, V, W, M);
	// mux_2bit_3to1 M0 (0, 0, SW[9], SW[8], M);
	// mux_2bit_3to1 M1 (0, 1, SW[9], SW[8], M);
	// mux_2bit_3to1 M2 (1, 0, SW[9], SW[8], M);
	// mux_2bit_3to1 M3 (1, 1, SW[9], SW[8], M);

	// module char_7seg (C, Display);
	// char_7seg H0 (0, 0, SW[8], SW[9], HEX0);
	// char_7seg H1 (0, 1, SW[8], SW[9], HEX1);
	// char_7seg H2 (1, 0, SW[8], SW[9], HEX2);
	// char_7seg H3 (1, 1, SW[8], SW[9], HEX3);
	
endmodule

// implements a 2-bit wide 3-to-1 multiplexer
module mux_2bit_3to1 (SL0, SL1, S0, S1, M);
	input [0:1] S0, S1, SL0, SL1;
	output [0:7] M;

	assign M[0] = (~S0) & (SL1 & SL1); // 3-to-1 multiplexer output
	assign M[1] = (~S1) |  S0; // 3-to-1 multiplexer output
	assign M[2] = (S0); // 3-to-1 multiplexer output
	assign M[3] = (S1); // 3-to-1 multiplexer output
	assign M[4] = (~SL0); // 3-to-1 multiplexer output
	assign M[5] = (~SL1); // 3-to-1 multiplexer output
	assign M[6] = (SL0); // 3-to-1 multiplexer output
	assign M[7] = 1; // 3-to-1 multiplexer output
endmodule	

// Converts 2-bit input code on C1-0 into 7-bit code that produces
// a character on a 7-segment display. The conversion is defined by:
// 	 C  1 0		Char
// 	----------------
// 	    0 0  	'd'
// 		0 1		'E'
// 		1 0 	'0'
// 		1 1		' ' Blank
//
//    
//
module char_7seg (SL0, SL1, S0, S1, Display);
	input [0:1] S0, S1, SL0, SL1;
	output [0:7] Display;	// output 7-seg code

	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */
	// the following equations describe display functions in cannonical SOP form

	assign Display[0] = ~((~(S0&S1))|(S0&S1)); 
	assign Display[1] = S1;
	assign Display[2] = S1;
	assign Display[3] = ~(~S0&~S1);
	assign Display[4] = ~(~S0&~S1);
	assign Display[5] = S0;
	assign Display[6] = ~((~(S0&S1))|(S0&S1));
	assign Display[7] = 1;

endmodule

