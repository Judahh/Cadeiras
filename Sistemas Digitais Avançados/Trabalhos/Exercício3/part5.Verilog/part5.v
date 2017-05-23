module part5(SW, LEDG, HEX0, HEX1, HEX2, HEX3);
	input [9:0] SW;
	output [0:6] HEX0, HEX1, HEX2, HEX3;
	output  [9:0] LEDG;

	wire [7:0] A;
	wire [7:0] B;
	/*wire [7:0] C;
	
	
	
	assign C[0]=SW[0];
	assign C[1]=SW[1];
	assign C[2]=SW[2];
	assign C[3]=SW[3];
	assign C[4]=SW[4];
	assign C[5]=SW[5];
	assign C[6]=SW[6];
	assign C[7]=SW[7];*/
	
	counter counter0(SW[8],SW[9],A,B,SW[7:0]);	//SW[8]=clock, SW[9]=reset
	segmentDecoder7 dec0(HEX0,HEX1,A);
	segmentDecoder7 dec1(HEX2,HEX3,B);
	
endmodule

module counter(clock,reset,A,B,C);
	input [7:0] C;
	input clock, reset;	
	output reg[7:0] A;
	output reg[7:0] B;
	reg [4:0] count;
	
	always @(posedge clock or negedge reset) begin
	
		if (~reset) begin
			count <= 'd0;
		end
		else begin
			if (clock)
			count <= count + 1;
		end
	
		case (count) 
			0 : begin
				A<=0;
			end
			1 : begin
				B<=0;
			end
			2 : begin
				A<=C;
			end
			3 : begin
				B<=C;
			end
			default : count <= 'd2;
		endcase
	end
endmodule

module segmentDecoder7(HEX0,HEX1,A);	
	input [0:7] A;
	output [0:6] HEX0,HEX1;
	
	assign HEX0[0] = ~(~A[2]&~A[0] | ~A[3]&A[1] | A[2]&A[1] | A[3]&~A[0] | ~A[3]&A[2]&A[0] | A[3]&~A[2]&~A[1]);
	assign HEX0[1] = ~(~A[2]&~A[0] | ~A[2]&~A[1] | ~A[3]&~A[1]&~A[0] | A[3]&~A[1]&A[0] | ~A[3]&A[1]&A[0]);
	assign HEX0[2] = ~(A[3]&~A[2] | ~A[1]&A[0] | ~A[2]&~A[1] | ~A[3]&A[0] | ~A[3]&A[2]);
	assign HEX0[3] = ~(~A[3]&~A[2]&~A[0] | ~A[2]&A[1]&A[0] | A[2]&~A[1]&A[0] | A[3]&~A[1] | A[2]&A[1]&~A[0]);
	assign HEX0[4] = ~(~A[2]&~A[0] | A[3]&A[2] | A[1]&~A[0] | A[3]&A[1]);
	assign HEX0[5] = ~(~A[1]&~A[0] | A[3]&~A[2] | A[2]&~A[0] | A[3]&A[1] | ~A[3]&A[2]);
	assign HEX0[6] = ~(A[3]&~A[2] | A[1]&~A[0] | A[3]&A[0] | ~A[3]&A[2]&~A[1] | ~A[2]&A[1]);
	assign HEX1[0] = ~(~A[6]&~A[4] | ~A[7]&A[5] | A[6]&A[5] | A[7]&~A[4] | ~A[7]&A[6]&A[4] | A[7]&~A[6]&~A[5]);
	assign HEX1[1] = ~(~A[6]&~A[4] | ~A[6]&~A[5] | ~A[7]&~A[5]&~A[4] | A[7]&~A[5]&A[4] | ~A[7]&A[5]&A[4]);
	assign HEX1[2] = ~(A[7]&~A[6] | ~A[5]&A[4] | ~A[6]&~A[5] | ~A[7]&A[4] | ~A[7]&A[6]);
	assign HEX1[3] = ~(~A[7]&~A[6]&~A[4] | ~A[6]&A[5]&A[4] | A[6]&~A[5]&A[4] | A[7]&~A[5] | A[6]&A[5]&~A[4]);
	assign HEX1[4] = ~(~A[6]&~A[4] | A[7]&A[6] | A[5]&~A[4] | A[7]&A[5]);
	assign HEX1[5] = ~(~A[5]&~A[4] | A[7]&~A[6] | A[6]&~A[4] | A[7]&A[5] | ~A[7]&A[6]);
	assign HEX1[6] = ~(A[7]&~A[6] | A[5]&~A[4] | A[7]&A[4] | ~A[7]&A[6]&~A[5] | ~A[6]&A[5]);
	//assign Display[7] = 1; // 3-to-1 multiplexer output 
	
endmodule
	
/*module bitsSave(BITS, CLOCK, Q);
		input [9:2] BITS;
		input CLOCK;
		
		output [7:0] Q;
		
		FlipFlopDv2  bit1(CLOCK, BITS[2], Q[0]);
		FlipFlopDv2  bit2(CLOCK, BITS[3], Q[1]);
		FlipFlopDv2  bit3(CLOCK, BITS[4], Q[2]);
		FlipFlopDv2  bit4(CLOCK, BITS[5], Q[3]);
		FlipFlopDv2  bit5(CLOCK, BITS[6], Q[4]);
		FlipFlopDv2  bit6(CLOCK, BITS[7], Q[5]);
		FlipFlopDv2  bit7(CLOCK, BITS[8], Q[6]);
		FlipFlopDv2  bit8(CLOCK, BITS[9], Q[7]);
endmodule
		
module mutex (X,Y,S,M);
	input X, Y, S;
	output  M;
	
	assign M = (!S&X) | (S&Y);
	
endmodule*/