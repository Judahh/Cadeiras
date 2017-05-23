module part2(SW,LEDG, BUTTON, HEX0, HEX1, HEX2, HEX3);

	input [9:0] SW;
	input [2:0] BUTTON;
	output [9:0] LEDG;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	
	wire [15:0] Q;
	wire [15:0] T;
	
	wire Bt;
	
	DeBounce D0(1, SW[4], SW[3], Bt);
	/*
	always@(Bt)
	begin
	if(~SW[3)
	Bt = 0;
	end
	*/
	
	
	FlipFlip16Bits b(SW[1], Bt, SW[0], Q);
	
	hexD H0 (Q[3:0], HEX0);
   hexD H1 (Q[7:4], HEX1);
	hexD H2 (Q[11:8], HEX2);
   hexD H3 (Q[15:12], HEX3);
	
	assign LEDG = Q;
	
endmodule


module FlipFlip16Bits (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [15:0] Q;

  wire [15:0] T, Qs;

  FlipFlipDMod T0 (En, Clk, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  FlipFlipDMod T1 (T[0], Clk, Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  FlipFlipDMod T2 (T[1], Clk, Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  FlipFlipDMod T3 (T[2], Clk, Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];

  FlipFlipDMod T4 (T[3], Clk, Clr, Qs[4]);
  assign T[4] = T[3] & Qs[4];

  FlipFlipDMod T5 (T[4], Clk, Clr, Qs[5]);
  assign T[5] = T[4] & Qs[5];

  FlipFlipDMod T6 (T[5], Clk, Clr, Qs[6]);
  assign T[6] = T[5] & Qs[6];

  FlipFlipDMod T7 (T[6], Clk, Clr, Qs[7]);
  assign T[7] = T[6] & Qs[7];

  FlipFlipDMod T8 (T[7], Clk, Clr, Qs[8]);
  assign T[8] = T[7] & Qs[8];

  FlipFlipDMod T9 (T[7], Clk, Clr, Qs[9]);
  assign T[9] = T[7] & Qs[9];

  FlipFlipDMod T10 (T[9], Clk, Clr, Qs[10]);
  assign T[10] = T[9] & Qs[10];

  FlipFlipDMod T11 (T[10], Clk, Clr, Qs[11]);
  assign T[11] = T[10] & Qs[11];

  FlipFlipDMod T12 (T[11], Clk, Clr, Qs[12]);
  assign T[12] = T[11] & Qs[12];

  FlipFlipDMod T13 (T[12], Clk, Clr, Qs[13]);
  assign T[13] = T[12] & Qs[13];

  FlipFlipDMod T14 (T[13], Clk, Clr, Qs[14]);
  assign T[14] = T[13] & Qs[14];

  FlipFlipDMod T15 (T[14], Clk, Clr, Qs[15]);
  //assign T[15] = T[14] & Qs[15];

  assign Q = Qs;
endmodule

module FlipFlipDMod (En, Clk, Clr, Q);
  input En, Clk, Clr;
  output reg Q;

  always @ (posedge Clk)
    if (~Clr)
      Q = 0;
    else if (En)
      Q <= Q + 1;

endmodule
