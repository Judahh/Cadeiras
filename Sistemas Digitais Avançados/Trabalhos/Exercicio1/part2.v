module part2 (SW,LEDG);
	input [9:0] SW;
	output [9:0] LEDG;
	
	//count16Bits count1 ()
endmodule
	
module count16Bits(clk, reset,enable, Q);
input clk,reset, enable;
output reg [15:0] Q;

always@(posedge clk)
if(reset)
begin
Q <= 8'b0;
end
else
	if(enable)
	begin
	Q <= Q + 1;
	end

endmodule
	