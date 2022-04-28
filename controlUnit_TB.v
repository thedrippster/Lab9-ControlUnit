module controlUnit_TB ();
	
	reg [31:0] inst;
	reg [3:0] status;
	
	wire [1:0] immSel;
	wire [2:0] ALUop;
	wire ALUsrc, MemRW, WB, PCsrc, RegRW;
	
	controlUnit dut (inst, status, immSel, ALUsrc, ALUop, MemRW, WB, PCsrc, RegRW);
	
	initial begin
		inst = 32'h00000000;
		status = 4'b0000;
	end
	
	always begin
		#20 inst = 32'h00a00293;
		#20 inst = 32'h00f00313;
		#20 inst = 32'h01400393;
		#20 inst = 32'h00628863;
		#20 inst = 32'h00736433;
		#20 inst = 32'h00129293;
		#20 inst = 32'h00602223;
		#20 inst = 32'h00402483;
		#20 inst = 32'h04728863;
			 status = 4'b0100;
		#20 inst = 32'h00648533;
			 status = 4'b0000;
		#20 inst = 32'hffb30493;
		#20 inst = 32'h00a02423;
	end

	initial #250 $stop;

endmodule
	