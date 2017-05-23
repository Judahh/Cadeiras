module part4 (SW,HEX0,CLOCK_50);
   input [9:0] SW;
	output [0:6] HEX0;
	input CLOCK_50;
	
	 wire [25:0] Q1;
	 wire [15:0] Q2;
	reg Clr, Clr2,Clk;
	counter_26bit as(1, CLOCK_50, Clr, Q1);
	counter_16bit DISPLAY(1, Clk, Clr2, Q2);
	b2dD display(HEX0,Q);
	
	
  always @ (negedge CLOCK_50) begin
    if (Q1 >= 50000000) begin
      Clr = 0;
    end else begin
      Clr = 1;
    end
	 Clk =~Clr;
  end
	
	
	
	always @ (posedge Clr) begin
    if (Q2 >= 9) begin
      Clr2 = 0;
    end else begin
      Clr2 = 1;
    end
  end
  
  b2dD H0(Q2[3:0], HEX0);
	
endmodule


