module part4 (CLOCK_50, KEY, SW, LEDG, HEX3, HEX2, HEX1, HEX0);
  input CLOCK_50;
  input [3:0] KEY;
  input [2:0] SW;
  output reg [9:0] LEDG;
  output [0:6] HEX3, HEX2, HEX1, HEX0;

  wire [25:0] HALFSEC;
  wire HALFPULSE;
  wire [3:0] INDEX;

  wire reset;

  reg half;
  reg [13:0] SIGNAL;



  // generate half second clock
  counterModK C0 (CLOCK_50, KEY[0], HALFSEC);
  defparam C0.n = 26;
  defparam C0.k = 25000000;

  // generate half second pulse (full second signal with 50% duty cycle)
  counterModK C1 (half, KEY[0], HALFPULSE);
  defparam C1.n = 1;
  defparam C1.k = 2;

  always @ (negedge CLOCK_50) begin
    if (HALFSEC == 24999999)
      half = 1;
    else
      half = 0;
  end


// A    o-       -_--        101100000000
// B    -ooo     --_-_-_-    110101010000
// C    -o-o     --_-_--_-   110101101000
// D    -oo      --_-_-      110101000000
// E    o        -           100000000000
// F    oo-o     -_-_--_-    101011010000
// G    --o      --_--_-     110110100000
// H    oooo     -_-_-_-     101010100000


  always @ (negedge KEY[1]) begin
    case (SW[2:0])
      0: SIGNAL = 14'b00101100000000; // A
      1: SIGNAL = 14'b00110101010000; // B
      2: SIGNAL = 14'b00110101101000; // C
      3: SIGNAL = 14'b00110101000000; // D
      4: SIGNAL = 14'b00100000000000; // E
      5: SIGNAL = 14'b00101011010000; // F
      6: SIGNAL = 14'b00110110100000; // G
      7: SIGNAL = 14'b00101010100000; // H
    endcase
  end

  assign reset = KEY[1] && KEY[0];


  counterModK C2 (HALFPULSE, reset, INDEX);
  defparam C2.n = 4;
  defparam C2.k = 14;

  always begin
    case (INDEX)
      0:LEDG[0] = SIGNAL[13];
      1:LEDG[0] = SIGNAL[12];
      2:LEDG[0] = SIGNAL[11];
      3:LEDG[0] = SIGNAL[10];
      4:LEDG[0] = SIGNAL[9];
      5:LEDG[0] = SIGNAL[8];
      6:LEDG[0] = SIGNAL[7];
      7:LEDG[0] = SIGNAL[6];
      8:LEDG[0] = SIGNAL[5];
      9:LEDG[0] = SIGNAL[4];
      10:LEDG[0] = SIGNAL[3];
      11:LEDG[0] = SIGNAL[2];
      12:LEDG[0] = SIGNAL[1];
      13:LEDG[0] = SIGNAL[0];
    endcase
  end

  /*
  twodigit_b2d_ssd D7 (HOURS, HEX7, HEX6);
  twodigit_b2d_ssd D5 (MINUTES, HEX5, HEX4);
  twodigit_b2d_ssd D3 (SECONDS, HEX3, HEX2);

  assign HEX1 = 7'b1111111;
  assign HEX0 = 7'b1111111;
  */

  //always LEDR[1] = HALFPULSE;
endmodule
