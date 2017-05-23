module part1(SW,LEDG, BUTTON, HEX0, HEX1, CLOCK_50);

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
	/*
	always@(Bt)
	begin
	if(~SW[3)
	Bt = 0;
	end
	*/
	
	counter8bits(SW[1], Bt, SW[0], Q);
	
	hexD H0 (Q[3:0], HEX0);
   hexD H1 (Q[7:4], HEX1);
	assign LEDG = Q;
	
endmodule

module counter8bits(En, Clk, Clr, Q);
  input En, Clk, Clr;
  output [7:0] Q;
  
  wire [7:0] T, Qs;
  wire En;
  
  flipFlopD T0 (En, Clk, Clr, Qs[0]);
  assign T[0] = En & Qs[0];

  flipFlopD T1 (T[0], Clk, Clr, Qs[1]);
  assign T[1] = T[0] & Qs[1];

  flipFlopD T2 (T[1], Clk, Clr, Qs[2]);
  assign T[2] = T[1] & Qs[2];

  flipFlopD T3 (T[2], Clk, Clr, Qs[3]);
  assign T[3] = T[2] & Qs[3];
  
  flipFlopD T4 (T[3], Clk, Clr, Qs[4]);
  assign T[4] = T[3] & Qs[4];

  flipFlopD T5 (T[4], Clk, Clr, Qs[5]);
  assign T[5] = T[4] & Qs[5];

  flipFlopD T6 (T[5], Clk, Clr, Qs[6]);
  assign T[6] = T[5] & Qs[6];

  flipFlopD T7 (T[6], Clk, Clr, Qs[7]);
  
  
  assign Q = Qs;
  
 endmodule 