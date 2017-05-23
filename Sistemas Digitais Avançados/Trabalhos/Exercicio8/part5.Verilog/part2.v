module part2(SW, LEDG, KEY);

 input [9:0] SW;	  // if this is 1, add; else subtract
	output [9:0] LEDG;
	input [2:0] KEY;
	reg [6:0] result;
	reg carry;

	wire [6:0] dataa, datab;
	
	 assign dataa = SW [6:0];
	//assign datab = SW [7:4];
	DeBounce D0(1, SW[9], SW[8], Bt);
	
	always @ (posedge Bt)// or negedge SW[7] )//or posedge KEY[2] or posedge KEY[1])
	begin
	
	
	if(Bt == 1)
	begin
		result <= dataa - datab;
	if( result >= 127)
	  carry = 1'b1;
	else
	  carry = 1'b0;
	 end 
	  if(SW[7] == 0)
	  begin
	  result <= 0;
	  carry <=0;
	  end
	end

	assign LEDG[6:0] = result;
	assign LEDG[9] = Bt;
	assign LEDG[8] = carry;
	assign datab = result;
	
endmodule