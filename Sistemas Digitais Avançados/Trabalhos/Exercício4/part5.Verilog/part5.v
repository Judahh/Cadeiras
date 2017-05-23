module part5 (SW,HEX0,HEX1, HEX2, HEX3,CLOCK_50, LEDG);
   input [9:0] SW;
	output [0:6] HEX0,HEX1, HEX2, HEX3;
	input CLOCK_50;
	output [9:0]LEDG;
	
	 wire [25:0] Q3;
	 wire [15:0] Q4;
	reg Clr, Clr2,Clk;
	counter_26bit (1, CLOCK_50, Clr, Q3);
	counter_16bit DISPLAY1 (1, Clk, Clr2, Q4);

	
	
  always @ (negedge CLOCK_50) begin
    if (Q3 >= 50000000) begin
      Clr = 0;
    end else begin
      Clr = 1;
    end
	 Clk =~Clr;
  end
	
	
	
	always @ (posedge Clr) begin
    if (Q4 >= 9) begin
      Clr2 = 0;
    end else begin
      Clr2 = 1;
    end
  end
  
  bin2DEO0 H0(Q4[3:0], HEX0);
  bin2DEO1 H1(Q4[3:0], HEX1);
  bin2DEO2 H2(Q4[3:0], HEX2);
  bin2DEO3 H3(Q4[3:0], HEX3);
  
  assign LEDG = Q4;
	
endmodule



module bin2DEO3 (BIN, Display);
  input [3:0] BIN;
  output reg [0:6] Display;

  always begin
    case (BIN)
      8:Display=7'b1111111;
      0:Display=7'b1111111;
      1:Display=7'b1000010;
      2:Display=7'b0110000;
      3:Display=7'b0000001;
      4:Display=7'b1111111;
      5:Display=7'b1000010;
      6:Display=7'b0110000;
      7:Display=7'b0000001;
    endcase
  end
endmodule

module bin2DEO2 (BIN, Display);
  input [3:0] BIN;
  output reg [0:6] Display;

  always begin
    case (BIN)
      7:Display=7'b1111111;
      8:Display=7'b1000010;
      0:Display=7'b1000010;
      1:Display=7'b0110000;
      2:Display=7'b0000001;
      3:Display=7'b1111111;
      4:Display=7'b1000010;
      5:Display=7'b0110000;
      6:Display=7'b0000001;
    endcase
  end
endmodule

module bin2DEO1 (BIN, Display);
  input [3:0] BIN;
  output reg [0:6] Display;

  always begin
    case (BIN)
      6:Display=7'b1111111;
      7:Display=7'b1000010;
      8:Display=7'b0110000;
      0:Display=7'b0110000;
      1:Display=7'b0000001;
      2:Display=7'b1111111;
      3:Display=7'b1000010;
      4:Display=7'b0110000;
      5:Display=7'b0000001;
    endcase
  end
endmodule

module bin2DEO0 (BIN, Display);
  input [3:0] BIN;
  output reg [0:6] Display;

  always begin
    case (BIN)
      0:Display=7'b0000001;
      1:Display=7'b1111111;
      2:Display=7'b1000010;
      3:Display=7'b0110000;
      4:Display=7'b0000001;
      5:Display=7'b1111111;
      6:Display=7'b1000010;
      7:Display=7'b0110000;
      8:Display=7'b0000001;
    endcase
  end
endmodule
