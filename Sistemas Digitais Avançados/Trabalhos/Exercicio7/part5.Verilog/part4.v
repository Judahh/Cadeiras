module part4(SW, LEDG, KEY, HEX0, HEX1, HEX2, HEX3);
	input [9:0] SW;	  // if this is 1, add; else subtract
	output [9:0] LEDG;
	input [2:0] KEY;
	reg [15:0] result;
	reg carry;
	output [0:6] HEX0, HEX1, HEX2, HEX3;

	wire [4:0] dataa, datab;
	
	 assign dataa = SW [3:0];
	 assign datab = SW [7:4];
	DeBounce D0(1, SW[9], SW[8], Bt);
	
	always @ (posedge Bt)
	begin
		if(Bt == 1)
		begin
			result <= dataa * datab;
		end
	end
	hexD H1 (result[3:0], HEX0);
	hexD H2 (result[7:4], HEX1);
	hexD H3 (result[11:8], HEX2);
	hexD H4 (result[15:12],HEX3);
	
endmodule
