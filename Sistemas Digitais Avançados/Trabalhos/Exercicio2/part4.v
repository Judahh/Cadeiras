// This is the complete code from Figure 8
module part4(SW,HEX0,HEX1,HEX2,HEX3,LEDG);
   input  [9:0] SW;		// toggle switches
	output [9:0] LEDG;
	output [0:6] HEX0;	// 7-seg displays
	output [0:6] HEX1;	// 7-seg displays
	output [0:6] HEX2;	// 7-seg displays
	output [0:6] HEX3;	// 7-seg displays
	wire cv;
	wire [0:3]T0;
	wire [0:3]co;

	segmentDecoder7 SD70(HEX0,SW[3:0]);
	segmentDecoder7 SD71(HEX1,SW[7:4]);
	adder4 a4(SW[8], co[0:3], SW[3:0], SW[7:4],T0[0:3]);
	
	//segmentDecoder7 SD72(HEX2,T0[0:3]);
	//segmentDecoder7 SD72(HEX3,T0[0:3]);
	
	sub9(co[0], cv, T0[0:3], HEX2, HEX3);
	
endmodule


module adder4(ci, co, a, b,T);
	input [3:0]a;
	input	[3:0]b;
	input	ci;
	output [3:0]T, co;
	
	adder(ci,    co[0], a[0], b[0],T[0]);
	adder(co[0], co[1], a[1], b[1],T[1]);
	adder(co[1], co[2], a[2], b[2],T[2]);
	adder(co[2], co[3], a[3], b[3],T[3]);
	
endmodule

module sub9(ci, co, a, HEX2, HEX3);
	input [3:0]a;
	input	ci;
	output [0:6] HEX2;	// 7-seg displays
	output [0:6] HEX3;	// 7-seg displays
	output co;
	wire [3:0]T1;
	wire cf;
	
	comparatorBiggerThan9(a, co);
	
	assign cf=co|ci;
	
	assign T1[0]=a[0];
	assign T1[1]=(a[1]&~cf)|(~a[1]&cf);
	assign T1[2]=(a[2]&~cf)|(((a[1]&a[2])|ci)&cf);
	assign T1[3]=(a[3]&~cf);
	
	segmentDecoder7 SD72(HEX2,T1[3:0]);
	segmentDecoder7 SD73(HEX3,cf);
	
endmodule

module adder(ci, co, a, b,T);
	input a, b, ci;
	output T, co;
	
	wire s1;
	
	assign s1 = (a & ~b) | (~a & b);
	assign T = (ci & ~s1) | (~ci & s1) | (ci & a & b);
	assign co = (ci & a) | (ci & b) | (a & b);
	
endmodule

module comparatorBiggerThan9(B,EQ);
	input [3:0] B;
	output EQ;
	
	assign EQ = B[3] & (B[2] | B[1]); 
	
endmodule	
	