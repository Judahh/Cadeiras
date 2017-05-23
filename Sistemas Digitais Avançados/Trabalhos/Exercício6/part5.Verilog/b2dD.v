module b2dD (Bin, D);
  input [3:0] Bin;
  output reg [0:6] D;

  always begin
    case(Bin)
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
		default:D=7'b0000001;
    endcase
  end
endmodule
