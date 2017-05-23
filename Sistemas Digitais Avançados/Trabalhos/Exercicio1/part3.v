module part3(SW,LEDG);
   input [9:0] SW;
	output [9:0] LEDG;
	 
	wire[1:0]  M;
	
	mutex3To1 M0(SW[0],SW[1],SW[2],SW[9:8],M);
	//mutex3To2 M1(SW[9:8], SW[7:6], SW[5:4], SW[3:2], M);
	assign LEDG[9:2] = SW[9:2];
	assign LEDG[1:0] = M[1:0];
	
endmodule	
	
	
module mutex3To1 (U,V,W,S,M);
	input  U, V, W;
	output[1:0]  M;
	input[1:0]  S;
	
	wire m0;
	
	assign m0 = (~S[0]&U) | (S[0]&V);
	
	assign M[0] = (~S[1]&m0) | (S[1]&W);
	
	
endmodule	


module mutex3To2(U,V,W,S,M);
	input [1:0] S, U, V, W;
	output [1:0] M;
	wire  m_0, m_1;	


	assign m_0 = (~S[0] & U[0]) | (S[0] & V[0]);	
	assign M[0] = (~S[1] & m_0) | (S[1] & W[0]); 

	
	assign m_1 = (~S[0] & U[1]) | (S[0] & V[1]);	
	assign M[1] = (~S[1] & m_1) | (S[1] & W[1]); 
endmodule	