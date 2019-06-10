module mips32_single_cycle_testbench();

	reg  clk1 ,clk2;
	reg  [7:0]  counter;
	wire [31:0] pc;
	
	always 
	begin
			#5 clk1 = ~clk1;
	end
	
	always begin
			#15 clk2 = ~clk2;
	end
	
	initial begin
		clk1 = 0;
		clk2= 0;
		counter= 0;
	end
	
	mips32_single_cycle msc(pc,clk1 , clk2);
	
	always @(negedge clk2) 
	begin
		
		counter <= counter + 1;
		$display("PC = %8h",pc);
		
		if(counter == 8'd17)
		begin
			$finish;
		end
		
	end
		
		
endmodule