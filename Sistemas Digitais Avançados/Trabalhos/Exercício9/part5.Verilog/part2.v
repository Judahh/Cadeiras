
//módulo principal
module part2 (SW, KEY, LEDG, HEX1, HEX0);

//sinais de entrada e saída
  input [9:0] SW;
  input [3:0] KEY;
  output reg [9:0] LEDG;
  output [0:6] HEX1, HEX0;

//sinais auxiliares  
  wire [8:0] DIN, BusWires;
  wire Resetn, Clock, Run, Done;
  
  //adiciona os sinais da chave
  assign MClock = KEY[1];
  assign PClock = KEY[2];
  assign Resetn = KEY[0];
  assign Run = SW[9];
  //assign Done = SW[8];
  
  always
    if (SW[8])
      LEDG[8:0] = DIN;
    else
		LEDG[8:0] = BusWires;
  
  //assign LEDG[4:0] = addr;
  wire [4:0] addr;

  //módulo do contador
  counterModK C0 (MClock, Resetn, addr);
  defparam C0.n = 5;
  defparam C0.k = 32;
  //módulo gerado pelo MegaWizard
  Rom1Port R0 (addr, MClock, DIN);
  //módulo do processador da parte 1
  proc P0 (DIN, Resetn, PClock, Run, Done, BusWires);

  //intancia dos módulo do display
  hexD H0 (BusWires[3:0], HEX0);
  hexD H1 (BusWires[7:4], HEX1);
endmodule
