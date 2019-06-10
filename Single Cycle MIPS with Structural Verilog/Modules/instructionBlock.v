module instructionBlock( read_adress,instruction,clk);

	output reg [31:0]instruction;
	input [31:0] read_adress;
	input clk;
	
	reg [31:0] inst [31:0]; // total 10 instruction

	initial begin
		$readmemh("instruction.mem" , inst);
	end
	
	always @(negedge clk)		
	begin
		instruction <= inst[read_adress];	
	end
endmodule

