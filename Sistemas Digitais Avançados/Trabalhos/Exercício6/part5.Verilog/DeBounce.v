module DeBounce (En, Clk, Clr, Q);

  input En, Clk, Clr;
  output reg Q;

  always @ (posedge Clk)
  begin
    if (~Clr)
      Q = 0;
    else if (En)
      Q = ~Q;
	end
endmodule
