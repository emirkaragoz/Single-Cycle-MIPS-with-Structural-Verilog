module registerBlock( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, reg_write_signal,clk);

	output reg [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [4:0] read_reg_1, read_reg_2, write_reg;
	input reg_write_signal,clk;
	
	reg [31:0] registers [31:0];
	
	always @(*)
	begin
		$readmemh("registers.mem" , registers);
		
		read_data_1=registers[read_reg_1];		//read rs content
		read_data_2=registers[read_reg_2];		//read rt content
	end
	
	always @(posedge clk)
	begin
		if(reg_write_signal == 1'b1 && write_reg != 5'b00000 && write_reg != 5'b11010 && write_reg != 5'b11011
			&& write_reg != 5'b11100 && write_reg != 5'b11101 && write_reg != 5'b11110 && write_reg != 5'b11111)
			begin		
				registers[write_reg] = write_data;	
				$writememh("registers.mem" , registers);	
			end
	end
endmodule

