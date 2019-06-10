module memoryBlock( read_data, write_data, address, write_signal, read_signal, clk);

	output reg [31:0] read_data;
	input [31:0] write_data , address;
	input write_signal,read_signal,clk;
	
	reg [31:0] mem [255:0];
	
	always @(negedge clk)
	begin
		$readmemh("memory.mem" , mem);
			
		if(read_signal == 1'b1)
		begin		
			read_data=mem[address];	
		end
		
		if(write_signal == 1'b1)
		begin		
			mem[address] = write_data;	
			$writememh("memory.mem" , mem);	
		end
	end
endmodule

