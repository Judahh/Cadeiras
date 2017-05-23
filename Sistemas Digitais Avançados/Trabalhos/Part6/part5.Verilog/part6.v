// This is the complete code from Figure 8
module part6 (SW, HEX0, HEX1, HEX2, HEX3);
	input  [0:9] SW;		// toggle switches
	output [0:7] HEX0;	// 7-seg displays
	output [0:7] HEX1;	// 7-seg displays
	output [0:7] HEX2;	// 7-seg displays
	output [0:7] HEX3;	// 7-seg displays

	shifter M0 (0, 0, SW[9], SW[8], HEX0);
	shifter M1 (0, 1, SW[9], SW[8], HEX1);
	shifter M2 (1, 0, SW[9], SW[8], HEX2);
	shifter M3 (1, 1, SW[9], SW[8], HEX3);

	
	
endmodule

// implements a 2-bit wide 3-to-1 multiplexer
module shifter (S1, S0, SW1, SW0, HEX);
	input S1, S0, SW1, SW0;
	output [0:7] HEX;
	
	//wire w1;

	assign M0 = (~SW0&S0)|(SW0&~S0); // 3-to-1 multiplexer output

	assign M1 = ((~SW1&~SW0)&S1)|((~SW1&SW0)&(S1^S0))|((SW1&~SW0)&~S1)|((SW1&SW0)&~(S1^S0)); // 3-to-1 multiplexer output
	
	char_7seg H0 (M1, M0, HEX);
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
module char_7seg (S1, S0, Display);
	input S0, S1;
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

	assign Display[0] = S1; 
	assign Display[1] = S0;
	assign Display[2] = S0;
	assign Display[3] = (S0&S1);
	assign Display[4] = (S0&S1);
	assign Display[5] = S1;
	assign Display[6] = ~(S0^S1);
	assign Display[7] = 1;

endmodule

