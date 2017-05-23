module hexD (BIN, D);
  input [15:0] BIN;
  output reg [0:6] D;

  always begin
    case(BIN)
      0:D=7'b0000001;
      1:D=7'b1001111;
      2:D=7'b0010010;
      3:D=7'b0000110;
      4:D=7'b1001100;
      5:D=7'b0100100;
      6:D=7'b0100000;
      7:D=7'b0001111;
      8:D=7'b0000000;
      9:D=7'b0001100;
      10:D=7'b0001000;
      11:D=7'b1100000;
      12:D=7'b0110001;
      13:D=7'b1000010;
      14:D=7'b0110000;
      15:D=7'b0111000;
		default:D=7'b0000001;
    endcase
  end
endmodule
