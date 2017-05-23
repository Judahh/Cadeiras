module part3(SW,LEDG, BUTTON, HEX0, HEX1,CLOCK_50);

	input [9:0] SW;
	input [2:0] BUTTON;
	output [9:0] LEDG;
	output [0:6] HEX0;
	output [0:6] HEX1;
   input CLOCK_50;
	
	wire [7:0] Q;
	wire [7:0] T;
	
	wire Bt;
	
	DeBounce D0(1, SW[4], SW[3], Bt);
	
	//counter16bits def1(SW[1], 1, SW[0],Q);
	cont16 (Bt, SW[1], SW[0], Q);
	
	
	hexD H0 (Q[3:0], HEX0);
   hexD H1 (Q[7:4], HEX1);
	assign LEDG = Q;
	
endmodule

module counter16bits(En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [15:0] Q;

  wire [15:0] T, Qs;

  flipFlopD1Bit T0 (Clk, En, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  flipFlopD1Bit T1 (Clk, T[0], Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  flipFlopD1Bit T2 (Clk, T[1], Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  flipFlopD1Bit T3 (Clk, T[2], Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];

  flipFlopD1Bit T4 (Clk, T[3], Clr, Qs[4]);
  assign T[4] = T[3] & Qs[4];

  flipFlopD1Bit T5 (Clk, T[4], Clr, Qs[5]);
  assign T[5] = T[4] & Qs[5];

  flipFlopD1Bit T6 (Clk, T[5], Clr, Qs[6]);
  assign T[6] = T[5] & Qs[6];

  flipFlopD1Bit T7 (Clk, T[6], Clr, Qs[7]);
  assign T[7] = T[6] & Qs[7];

  flipFlopD1Bit T8 (Clk, T[7], Clr, Qs[8]);
  assign T[8] = T[7] & Qs[8];

  flipFlopD1Bit T9 (Clk, T[8], Clr, Qs[9]);
  assign T[9] = T[8] & Qs[9];

  flipFlopD1Bit T10 (Clk, T[9], Clr, Qs[10]);
  assign T[10] = T[9] & Qs[10];

  flipFlopD1Bit T11 (Clk, T[10], Clr, Qs[11]);
  assign T[11] = T[10] & Qs[11];

  flipFlopD1Bit T12 (Clk, T[11], Clr, Qs[12]);
  assign T[12] = T[11] & Qs[12];

  flipFlopD1Bit T13 (Clk, T[12], Clr, Qs[13]);
  assign T[13] = T[12] & Qs[13];

  flipFlopD1Bit T14 (Clk, T[13], Clr, Qs[14]);
  assign T[14] = T[13] & Qs[14];

  flipFlopD1Bit T15 (Clk, T[14], Clr, Qs[15]);
  
  
  assign Q = Qs;
  
 endmodule 