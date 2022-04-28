module controlUnit (inst, status, immSel, ALUsrc, ALUop, MemRW, WB, PCsrc, RegRW);
	
	input [31:0] inst;
	input [3:0] status;
	
	output reg [1:0] immSel;
	output reg [2:0] ALUop;
	output reg ALUsrc, MemRW, WB, PCsrc, RegRW;

	wire [3:0] opcode;
	assign opcode = {{inst[13:12]}, {inst[5:4]}};
	
	always @ (*) begin
		case(opcode)
			4'b0011: begin //ADD
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b000;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
			
			4'b1011: begin //OR
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b001;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
				
			4'b0111: begin //SLL
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b010;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
			
			4'b0001: begin //ADDI
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b000;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
			
			4'b1001: begin //ORI
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b001;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
				
			4'b0101: begin //SLLI
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b010;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
				
			4'b1000: begin //LW
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b000;
				MemRW = 1'b0;
				WB = 1'b0;
				PCsrc = 1'b0;
				RegRW = 1'b1;
			end
			
			4'b1010: begin //SW
				immSel = 2'b10;
				ALUsrc = 1'b1;
				ALUop = 3'b000;
				MemRW = 1'b1;
				WB = 1'b0;
				PCsrc = 1'b0;
				RegRW = 1'b0;
			end
				
			4'b0010: begin //BEQ
				immSel = 2'b11;
				ALUsrc = 1'b0;
				ALUop = 3'b011;
				MemRW = 1'b0;
				WB = 1'b1;
				PCsrc = status[2];
				RegRW = 1'b0;
			end
			
			default: begin
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b000;
				MemRW = 1'b0;
				WB = 1'b0;
				PCsrc = 1'b0;
				RegRW = 1'b0;
			end
				
		endcase
	end

endmodule
