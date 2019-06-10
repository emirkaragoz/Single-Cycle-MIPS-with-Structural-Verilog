module nextPC( nextpc, instruction, jumpSignal,branchSignal,clk);
	output reg [31:0] nextpc;
	input [31:0] instruction;
	input jumpSignal,branchSignal,clk;
	
	reg [31:0] immed;
	
	initial begin
		nextpc = 32'b0;
	end
	
	always @(posedge clk)	
	begin
		if(jumpSignal == 1'b1)
			begin		
				nextpc[27:26] = 2'b0;
				nextpc[25:0] = instruction[25:0];
			end
		
		else if(branchSignal == 1'b1)
			begin
				immed[15:0] = instruction[15:0];
				if(instruction[15]==1'b1)
					begin
						immed[31:15] = 16'b1;
					end
				else
					begin
						immed[31:15] = 16'b0;
					end
				
				nextpc = immed + nextpc + 1;
			end
					
		else
			begin
				nextpc = nextpc +1;
			end
	end
endmodule

