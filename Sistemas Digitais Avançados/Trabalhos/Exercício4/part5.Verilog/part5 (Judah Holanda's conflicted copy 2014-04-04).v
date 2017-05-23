module part5 (SW,HEX0,HEX1,HEX2);
   input [9:0] SW;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	
	
	wire[1:0] M;
	
	mutex_2bit_3To1 M0(SW[9:8], SW[5:4], SW[3:2], SW[1:0], M);
	
	SegmentDecodeHex0 DEC0(M,HEX0);
	SegmentDecodeHex1 DEC1(M,HEX1);
	SegmentDecodeHex2 DEC2(M,HEX2);
	
endmodule



module mutex_2bit_3To1 (S, U, V, W, M);
	input[1:0]  U, V, W, S;
	output  [1:0] M;
	
	wire m0,m1;
	
	assign m0 = (~S[0]&U[0]) | (S[0]&V[0]);
	
	assign M[0] = (~S[1]&m0) | (S[1]&W[0]);
	
	assign m1 = (~S[0]&U[1]) | (S[0]&V[1]);
	
	assign M[1] = (~S[1]&m1) | (S[1]&W[1]);
	
	
endmodule



module SegmentDecodeHex0 (C,DISPLAY);
	input [1:0] C;
	output [0:6] DISPLAY;
	
	assign DISPLAY[0] = (C[0] & C[1]) | (~C[0] & ~C[1]);
	assign DISPLAY[1] = C[0];
	assign DISPLAY[2] = C[0];
	assign DISPLAY[3] = (C[0] & C[1]);
	assign DISPLAY[4] = (C[0] & C[1]);
	assign DISPLAY[5] = (C[0] & C[1]) | (~C[0] & ~C[1]);
	assign DISPLAY[6] = C[1];
	
	
endmodule
	
module SegmentDecodeHex1 (C,DISPLAY);
	input [1:0] C;
	output [0:6] DISPLAY;
	
	assign DISPLAY[0] = C[1];
	assign DISPLAY[1] = C[0]&C[1] | (~C[0] & ~C[1]);
	assign DISPLAY[2] = C[0]&C[1] | (~C[0] & ~C[1]);
	assign DISPLAY[3] = (C[0] & C[1]);
	assign DISPLAY[4] = (C[0] & C[1]);
	assign DISPLAY[5] = C[1];
	assign DISPLAY[6] = C[0];
	
	
endmodule

module SegmentDecodeHex2 (C,DISPLAY);
	input [1:0] C;
	output [0:6] DISPLAY;
	
	assign DISPLAY[0] = C[0];
	assign DISPLAY[1] = C[1];
	assign DISPLAY[2] = C[1];
	assign DISPLAY[3] = (C[0] & C[1]);
	assign DISPLAY[4] = (C[0] & C[1]);
	assign DISPLAY[5] = C[0];
	assign DISPLAY[6] = C[0]&C[1] | (~C[0] & ~C[1]);
	
	
endmodule	