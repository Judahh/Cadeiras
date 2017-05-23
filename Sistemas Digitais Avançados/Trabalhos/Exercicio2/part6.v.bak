module verilog2(SW,HEX0,HEX1,LEDG);

	input [9:0] SW;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [9:0] LEDG;
	
	wire Z;
	wire [2:0] EQ;
	wire [3:0] M;
	comparatorMaior9 cm(SW[3:0],Z);

		assign LEDG[0] = Z;
	circuitA a(SW[3:0], EQ);
	
   mutex2to1 b1(Z,SW[3],0,M[3] );
	mutex2to1 b2(Z,SW[2],EQ[2],M[2] );
	mutex2to1 b3(Z,SW[1],EQ[1],M[1] );
	mutex2to1 b4(Z,SW[0],EQ[0],M[0] );
	
	circuitB c(HEX1[0:6],Z);
	segmentDecoder7 d(HEX0[0:6],M[3:0]);
	
endmodule

module mutex2to1(S,C1,C2,M );
	input S,C1,C2;
	output M;
	
	assign M = (C1 & ~S) | (C2 & S);
	
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


module comparatorMaior9(B,EQ);
	input [3:0] B;
	output EQ;
	
	assign EQ = B[3] & (B[2] | B[1]); 
	
endmodule	
	

module circuitB(Display,C);

	input  C;
	output [0:6] Display;

	assign Display [0] = C;
	assign Display [1] = 0; 
	assign Display [2] = 0;
	assign Display [3] = C;
	assign Display [4] = C;
	assign Display [5] = C;
	assign Display [6] = 1;
//	assign Display [7] = 1;
	
endmodule	

module circuitA(B, EQ);
	input [2:0] B;
	output [2:0] EQ;
	
	assign EQ[2] = B[2] & B[1];
	assign EQ[1] = ~B[1];
	assign EQ[0] = B[0];
	
endmodule
	