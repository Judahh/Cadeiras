module counterModK(clk, cln, Q);
  parameter n ;
  parameter k ;

  input clk, cln;
  output [n-1:0] Q;
  reg [n-1:0] Q;

  always @(posedge clk or negedge cln)
  begin
    if (~cln)
      Q <= 'd0;
    else begin
      Q <= Q + 1'b1;
      if (Q == k-1)
        Q <= 'd0;
    end
  end
endmodule
