module part3 (CLOCK_50, SW, LEDG, HEX3, HEX2, HEX1, HEX0);

  input CLOCK_50;
  input [9:0] SW;
  output [9:0] LEDG;
  output [0:6] HEX0;
  output [0:6] HEX1;
  output [0:6] HEX2;
  output [0:6] HEX3;

  wire [25:0] PERSEC;
  wire [31:0] PERMIN;
  wire [37:0] PERHOUR;

  wire [6:0] SECONDS, MINUTES;
  wire [6:0] HOURS;

  reg sec, min, hour;



  counterModK C0 (CLOCK_50, SW[0], PERSEC);
  defparam C0.n = 26;
  defparam C0.k = 50000000;

  counterModK C1 (CLOCK_50, SW[0], PERMIN);
  defparam C1.n = 32;
  defparam C1.k = 3000000000;

  counterModK C2 (CLOCK_50, SW[0], PERHOUR);
  defparam C2.n = 38;
  defparam C2.k = 180000000000;


  counterModK C3 (sec, SW[0], SECONDS);
  defparam C3.n = 6;
  defparam C3.k = 60;

  counterModK C4 (min, SW[0], MINUTES);
  defparam C4.n = 6;
  defparam C4.k = 60;

  counterModK C5 (hour, SW[0], HOURS);
  defparam C5.n = 5;
  defparam C5.k = 24;



  always @ (negedge CLOCK_50) begin
    if (PERSEC == 49999999)
      sec = 1;
    else
      sec = 0;

    if (PERMIN == 2999999999)
      min = 1;
    else
      min = 0;

    if (PERHOUR == 179999999999)
      hour = 1;
    else
      hour = 0;
  end


  twodigit_b2d_ssd D7 (HOURS, HEX3, HEX2);
  twodigit_b2d_ssd D5 (MINUTES, HEX1, HEX0);

 // assign HEX1 = 7'b1111111;
 // assign HEX0 = 7'b1111111;
endmodule
