// This is the complete code from Figure 8
module part5(SW,HEX0,HEX1,HEX2,HEX3,LEDG);
   input  [9:0] SW;		// toggle switches
	output [0:6] HEX0;	// 7-seg displays
	output [0:6] HEX1;	// 7-seg displays
	output [0:6] HEX2;	// 7-seg displays
	output [0:6] HEX3;	// 7-seg displays
	output [9:0] LEDG;

	
	wire [3:0] c0, T, z1,S0,S1;
	reg [3:0]z0,c1;

	wire EQ;

	adder add1(SW[8], c0[0], SW[4],SW[0], T[0]);
	adder add2(c0[0], c0[1], SW[5],SW[1], T[1]);
	adder add3(c0[1], c0[2], SW[6],SW[2], T[2]);
	adder add4(c0[2], c0[3], SW[7],SW[3], T[3]);
	
	comparatorMaior9 cp2(T,EQ);

	always@(EQ)
	if(EQ == 1'b1)
	 begin
		 z0=4'b1010;
		 c1 = 4'b0001;
	 end
	else
	  begin
		 z0=4'b0000;
		 c1 = 4'b0000;
	end
	
	
	assign z1[0] = (1 & ~z0[0]) | (0 & z0[0]);
	assign z1[1] = (1 & ~z0[1]) | (0 & z0[1]);
	assign z1[2] = (1& ~z0[2]) | (0 & z0[2]);
	assign z1[3] = (1 & ~z0[3]) | (0 & z0[3]);
	
	wire [3:0] c2;
	adder add5(1, c2[0], T[0],z1[0], S0[0]);
	adder add6(c2[0], c2[1], T[1],z1[1], S0[1]);
	adder add7(c2[1], c2[2], T[2],z1[2], S0[2]);
	adder add8(c2[2], c2[3], T[3],z1[3], S0[3]);
	
	assign S1[3:0] = c1;
	
	segmentDecoder7(HEX0,S0);
	segmentDecoder7(HEX1,S1);
	segmentDecoder7(HEX2,SW[3:0]);
	segmentDecoder7(HEX3,SW[7:4]);
	
	assign LEDG[3:0] = S0;
	assign LEDG[7:4] = z1;
	
	
endmodule

module adder(ci, co, a, b,T);
	input a, b, ci;
	output T, co;
	
	wire s1, s2;
	
	assign s1 = (a & ~b) | (~a & b);
	assign T = (ci & ~s1) | (~ci & s1);
	
	mutex2to1 mute(s1, b, ci, co);
	
	
endmodule





