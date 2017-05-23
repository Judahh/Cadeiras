module part6 (SW, HEX0, HEX1, HEX2, HEX3);
	input  [0:9] SW;		// toggle switches
	output [0:7] HEX0;	// 7-seg displays
	output [0:7] HEX1;	// 7-seg displays
	output [0:7] HEX2;	// 7-seg displays
	output [0:7] HEX3;	// 7-seg displays

	shifter M0 (0, 0, SW[9], SW[8], HEX0);
	shifter M1 (0, 1, SW[9], SW[8], HEX1);
	shifter M2 (1, 0, SW[9], SW[8], HEX2);
	shifter M3 (1, 1, SW[9], SW[8], HEX3);
endmodule
Este modulo “shifteia” as entradas do módulo do display para que o texto possa “correr”.
module shifter (S1, S0, SW1, SW0, HEX);
	input S1, S0, SW1, SW0;
	output [0:7] HEX;

	assign M0 = (~SW0&S0)|(SW0&~S0); 
	assign M1 = ((~SW1&~SW0)&S1)|((~SW1&SW0)&(S1^S0))|((SW1&~SW0)&~S1)|((SW1&SW0)&~(S1^S0)); 
	
	char_7seg H0 (M1, M0, HEX);
endmodule	
Este módulo imprime no display selecionado pelas chaves S1 e S0, fazendo, caso não haja tratamento nas chaves, o inicio da rotação do display (XdE0).

module char_7seg (S1, S0, Display);
	input S0, S1;
	output [0:7] Display;	// output 7-seg code

	assign Display[0] = S1; 
	assign Display[1] = S0;
	assign Display[2] = S0;
	assign Display[3] = (S0&S1);
	assign Display[4] = (S0&S1);
	assign Display[5] = S1;
	assign Display[6] = ~(S0^S1);
	assign Display[7] = 1;

endmodule