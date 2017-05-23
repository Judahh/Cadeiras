module mulMachine(clock, SIGNAL);
reg [32:0] T;
input clock;
output SIGNAL;

   //reseta o sinais para a borda de descida
	always @(negedge clock)
	begin
		ENPCA = 0;
		MR = 1;
		LMAH = 0;
		LMAL = 0;
		INCPC = 0;
		ENMAA = 0;
		LMD = 0;
		DECSP = 0;
		ENDES = 0;
		LAC = 0;
		LMD = 0;
		LAAC = 0;
		LINT = 0;
		LINTE = 0;
		LRESET = 0;
		SD0 = 0;
		OP1 = 0;
		OP2 = 0;
		ENSPA = 0;
	end

//Os sinais do processador são setados na borda de subida	
always @(posedge clock) 
case (T)
	/

				4: begin 
					ENPCA = 1;
					T = 5;
					end
				5: begin	
					ENPCA = 1;
					MR = 0;
					T = 6;
					end
				6: begin
					ENPCA = 1;
					MR = 0;
					LMAH = 1;
					T = 7;
					end
				7: begin
					INCPC = 1;
					T = 8;
					end
				8: begin		
					ENPCA = 1;
					T = 9;
					end
				9: begin		
					ENPCA = 1;
					MR = 0;
					T = 10;
					end
				10: begin	
					ENPCA = 1;
					MR = 0;
					LMAL = 1;
					T = 11;
					end
				11: begin	
					INCPC = 1;
					ENMAA = 1;
					T = 12;
					end
				12: begin
					ENMAA = 1;
					MR = 0;
					T = 13;
					end
				13: begin
					ENMAA = 1;
					MR = 0;
					LMD = 1;
					T = 14;
					end
				14: begin	
					ENDES = 1;
					LAC = 1;
					T = 15;
					end
				15: begin
					ENSPA = 1;
					ENFLD = 1;
					T = 16;
					end
				16: begin
					ENSPA = 1;
					ENFLD = 1;
					MW = 0;
					T = 17;
					end
				17: begin
					DECSP = 1;
					T = 18;
					end
				18: begin
					ENSPA = 1;
					ENDES = 1;
					T = 19;
					end
				19: begin
					ENSPA = 1;
					ENDES = 1;
					MW = 0;
					T = 20;
					end
				20: begin		
					DECSP = 1;
					LRESET = 1;
					LINT = 1;
					T = 21;
					end
				21: begin
					ENDES = 1;
					LMD = 1;
					T = 22;
					end
				22: begin
					ENDES = 1;
					OP2 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 23;
					end
				23: begin
					ENDES = 1;
					LMD = 1;
					T = 24;
					end
				24: begin
					ENDES = 1;
					OP2 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 25;
					end
				25: begin
					ENDES = 1;
					LMD = 1;
					T = 26;
					end
				26: begin
					ENDES = 1;
					OP2 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 27;
					end
				27: begin
					ENDES = 1;
					LMD = 1;
					T = 28;
					end
				28: begin
					ENDES = 1;
					OP2 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 29;
					end
				29: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 30;
					end
				30: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 31;
					end
				31: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 32;
					end
				32: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 33;
					end
				33: begin
					ENDES = 1;
					LMD = 1;
					T = 34;
					end
				34: begin
					INCSP = 1;
					T = 35;
					end
				35: begin
					ENSPA = 1;
					T = 36;
					end
				36: begin
					ENSPA = 1;
					MR = 0;
					T = 37;
					end
				37: begin
					ENSPA = 1;
					MR = 0;
					LAC = 1;
					T = 38;
					end
				38: begin
					INCSP = 1;
					T = 39;
					end
				39: begin
					ENSPA = 1;
					T = 40;
					end
				40: begin
					ENSPA = 1;
					MR = 0;
					T = 41;
					end
				41: begin
					ENSPA = 1;
					MR = 0;
					LINTE = 1;
					LCARRY = 1;
					LZERO = 1;
					LRESET = 1;
					LINT = 1;
					T = 42;
					end
				42: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 43;
					end
				43: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 44;
					end
				44: begin
					ENDES = 1;
					SD0 = 1;
					LAC = 1;
					LRESET = 1;
					LINT = 1;
					T = 45;
					end
		45:begin
				ENDES = 1;
				SD0 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
						if((AC<1) || (MD < 1))
						begin
						A = 1;
						T = 0;
						end
						else
						begin
						T = 46;
					end
				end
				
				
		46:begin
				ENDES = 1;
				LACC = 1;
				
						if(AC<MD)
								T = 47;
						else
								T = 48;
				end
		47:begin
				ENDES = 1;
				LMD = 1;
				T = 48;
			end
			
		48:begin
						if(MD<2)
						begin
						A = 1;
						T = 0;
					end
						else
						begin
						ENSPA = 1;
						ENFLD = 1;
						end
					
						T = 49;
				end
		49:begin
				ENSPA = 1;
				ENFLD = 1;
				MW = 0;
				T = 50;
				end
		50:begin
				DECSP = 1;
				T = 51;
				end
		51:begin
				ENSPA = 1;
				ENDES = 1;
				T = 52;
				end
		52:begin
				ENSPA = 1;
				ENDES = 1;
				MW = 0;
				T = 53;
				end
		53:	begin
				DECSP = 1;
				LRESET = 1;
				LINT = 1;
				T = 54;
				end
		54:begin
				ENDES = 1;
				LAC = 1;
				T = 55;
				end
		55:begin
				ENDES = 1;
				LMD = 1;
				T = 56;
				end
		56:begin
				ENDES = 1;
				LAAC = 1;
				T = 57;
				end
		57:begin
				INCPC = 1;
				T = 58;
				end
		58:begin
				ENSPA = 1;
				T = 59;
				end
		59:begin
				ENSPA = 1;
				MR = 0;
				T = 60;
				end
		60:begin
				ENSPA = 1;
				MR = 0;
				LAC = 1;
				T = 61;
				end
		61:begin
				INCSP = 1;
				T = 62;
				end
		62:begin
				ENSPA = 1;
				T = 63;
				end
		63:begin
				ENSPA = 1;
				MR = 0;
				end
		64:begin
				ENDES = 1;
				OP2 = 1;
				LAC = 1;
				LRESET = 1;
				LINT = 1;
				end		65:begin
				ENSPA = 1;
				ENFLD = 1;
				T = 65;
				end
		66:begin
				ENSPA = 1;
				ENFLD = 1;
				MW = 0;
				T = 67;
				end
		67:begin
				DECSP = 1;
				T = 68;
				end
				
		68:begin
				ENSPA = 1;
				ENDES = 1;
				T = 69;
				end
				
		69:begin
				ENSPA = 1;
				ENDES = 1;
				MW = 0;
				end
				
		70:begin
				ENSPA = 1;
				ENDES = 1;
				T = 71;
				end
		71:begin
				ENSPA = 1;
				ENDES = 1;
				MW = 0;
				T = 72;
				end
		72:begin
				DECSP = 1;
				LRESET = 1;
				LINT = 1;
				T = 73;
				end
		73:begin
				ENDES = 1;
				LAC = 1;
				T = 74;
				end
				
		74:begin	
			ENDES = 1;
			LAAC = 1;
			T = 75;
			end
		75:begin
			ENCA = 1;
			CON = 1;
			LMD = 1;
			T = 76;
			end
		76:begin
			ENDES = 1;
			OP2 = 1;
			OP1 = 1;
			LAC = 1;
			T = 77;
			end
		77:begin
			ENDES = 1;
			LMD = 1;
			T = 78;
			end
		78:begin
			INCSP = 1;
			T = 79
			end
		79:begin	
			ENSPA = 1;
			T = 80;
			end
		80:begin
			ENSPA = 1;
			MR = 0;
			T = 81;
			end
		81:begin
			ENSPA = 1;
			MR = 0;
			LAC = 0;
			T = 82;
			end
		82:begin
			INCSP = 1;
			T = 83;
			end
		83:begin
			ENSPA = 1;
			T = 84;
			end
		84:begin
			ENSPA = 1;
			MR = 0;
			T = 85;
			end
		85:begin
			ENDES = 1;
			OP2 = 1;
			LAC = 1;
			LRESET = 1;
			LINT = 1;
		   T = 47;
		   end	
				
	default:
				T = 0;
	
		
	endcase
endmodule

