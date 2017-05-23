module part1 (SW, LEDG);
  input [9:0] SW;
  output [9:0] LEDG;

  wire [8:0] D, Y;
  wire w;

  assign w = SW[0];

  my_lpm_ff FF (~SW[2], SW[1], D[8:0], Y[8:0]);

  assign D[0] = ~(~(~Y[0] | Y[1] | Y[2] | Y[3] | Y[4] | Y[5] | Y[6] | Y[7] | Y[8]) | ~(D[1] | D[2] | D[3] | D[4] | D[5] | D[6] | D[7] | D[8])); 

  assign D[1] = (~Y[0] | Y[5] | Y[6] | Y[7] | Y[8]) & ~w; // B
  assign D[2] = Y[1] & ~w; // C
  assign D[3] = Y[2] & ~w; // D
  assign D[4] = (Y[3] | Y[4]) & ~w; // E

  assign D[5] = (~Y[0] | Y[1] | Y[2] | Y[3] | Y[4]) & w; // F
  assign D[6] = Y[5] & w; // G
  assign D[7] = Y[6] & w; // H
  assign D[8] = (Y[7] | Y[8]) & w; // I

  assign LEDG[9] = Y[0];
  assign LEDG[8:0] = D;
endmodule
