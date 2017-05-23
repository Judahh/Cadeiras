module part4 (SW,HEX0,CLOCK_50);
   input [9:0] SW;
	output [0:6] HEX0;
	input CLOCK_50;
	
	 wire [3:0] Q;
	
	count4Bits count1(CLOCK_50, SW[0], SW[1], Q) ;
	
	segmentDecoder7 display(HEX0,Q);
	
endmodule


module count4Bits(clk, reset,enable, Q);
input clk,reset, enable;
output reg [3:0] Q;

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

module segmentDecoder7(Display,D);	
	input [0:3] D;
	output [0:6]Display;
	
	assign Display[0] = ~(D[0]|D[2]|(D[1]&D[3])|~(D[1]|D[3])); // 3-to-1 multiplexer output
	assign Display[1] = ~(~D[1] | (D[2]&D[3]) | ~(D[2]|D[3])); // 3-to-1 multiplexer output
	assign Display[2] = ~(D[1] | ~D[2] | D[3]); // 3-to-1 multiplexer output
	assign Display[3] = ~(D[0] |(D[2]&~D[1]) | (D[2]&~D[3]) | ~(D[1]|D[3]) | (D[1]&~D[2]&D[3])); // 3-to-1 multiplexer output
	assign Display[4] = ~((D[2]&~D[3])| ~(D[1]|D[3])); // 3-to-1 multiplexer output
	assign Display[5] = ~(D[0] | (D[1]&~D[2]) | (D[1]&~D[3]) | ~(D[2]|D[3])); // 3-to-1 multiplexer output
	assign Display[6] = ~(D[0] | (D[1]&~D[2]) | (D[1]&~D[3]) | (~D[1]&D[2])); // 3-to-1 multiplexer output
	//assign Display[7] = 1; // 3-to-1 multiplexer output 
	
endmodule
