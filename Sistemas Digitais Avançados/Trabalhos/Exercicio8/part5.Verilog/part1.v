module part1 (SW, LEDG, HEX0);
  input [9:0] SW;
  output [9:0] LEDG;
  output [0:6] HEX0;
  
  wire [9:0] din, dout;
  wire [2:0] addr;
  wire wren, clock;

  wire Bt;
  
  DeBounce D0(1, SW[9], SW[8], Bt);
  
  assign addr = SW[6:3];
  assign clock = Bt;
  assign din = SW[2:0];
  assign wren = SW[7];  
  assign LEDG = dout;

  ramlpm16bits4 R0 (addr, clock, din, wren, dout);
  
  hexD H0(dout, HEX0);

endmodule
