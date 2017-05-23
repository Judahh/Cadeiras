module part3(SW, LEDG, KEY, HEX0, HEX1, HEX2, HEX3);

 input [9:0] SW;	  // if this is 1, add; else subtract
	output [9:0] LEDG;
	input [2:0] KEY;
	reg [9:0] result;
	reg carry;
	output [0:6] HEX0, HEX1, HEX2, HEX3;

	wire [4:0] dataa, datab;
	
	 assign dataa = SW [3:0];
	 assign datab = SW [7:4];
	//assign datab = SW [7:4];
	DeBounce D0(1, SW[9], SW[8], Bt);
	
	always @ (posedge Bt)// or negedge SW[7] )//or posedge KEY[2] or posedge KEY[1])
	begin
	
	
	if(Bt == 1)
	begin
		result <= dataa * datab;
	if( result >= 127)
	  carry = 1'b1;
	else
	  carry = 1'b0;
	 end 
	  /*if(SW[7] == 0)
	  begin
	  result <= 0;
	  carry <=0;
	  end*/
	end

	hexD H1 (dataa, HEX0);
	hexD H2 (datab, HEX1);
	hexD H3 (result[3:0], HEX2);
	hexD H4 (result[7:4],HEX3);
	
	
endmodule
