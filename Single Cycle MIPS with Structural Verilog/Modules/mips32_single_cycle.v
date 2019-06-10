module mips32_single_cycle(pc,clk1,clk2);
																
wire signed[31:0] rs_content ,rt_content, ignore_rs,ignore_rt;																								
wire[4:0] rs , rt ,rd ,shamt,write_reg; 														
wire[5:0] op;
wire[5:0] funct; 
wire shiftEnable;
wire[2:0] aluSelect;
wire [31:0] zeroExtendShamt, real_rs_content,temp_result;			
wire [31:0] sltuPoz,sltuNeg,sltuVal;
wire sltuSignal;
wire zero;							
output [31:0] pc;
wire [31:0] real_rt_content;
wire [31:0] result;
wire RegDst,Branch,MemRead,MemWrite,MemtoReg,Jump,RegWrite;
wire [2:0] ALUop;
wire [1:0] ALUSrc;
wire [31:0]instruction;
input clk1,clk2;
wire [15:0] immed;
wire [31:0] regWriteData,temp3,signExtenImmed,zeroExtendImmed,ignore,MemReadData;
wire temp1,temp2,temp4,real_branch;

nextPC npp(pc,instruction,Jump,real_branch,clk2); //compute pc
instructionBlock ib(pc,instruction,clk2);		//read instruction

			// RS
buf (rs[4],instruction[25]);
buf (rs[3],instruction[24]); 
buf (rs[2],instruction[23]); 
buf (rs[1],instruction[22]); 
buf (rs[0],instruction[21]);
			//RT
buf (rt[4],instruction[20]);     
buf (rt[3],instruction[19]);
buf (rt[2],instruction[18]);
buf (rt[1],instruction[17]);
buf (rt[0],instruction[16]); 
         //RD							
buf (rd[4],instruction[15]); 
buf (rd[3],instruction[14]);  
buf (rd[2],instruction[13]);  
buf (rd[1],instruction[12]);  
buf (rd[0],instruction[11]);           							
			//Function Code
buf (funct[0],instruction[0]); 
buf (funct[1],instruction[1]);
buf (funct[2],instruction[2]);
buf (funct[3],instruction[3]);
buf (funct[4],instruction[4]);
buf (funct[5],instruction[5]); 
			//Op Code
buf (op[0],instruction[26]); 
buf (op[1],instruction[27]); 
buf (op[2],instruction[28]); 
buf (op[3],instruction[29]); 
buf (op[4],instruction[30]); 
buf (op[5],instruction[31]);   
			//Shift Amount
buf (shamt[4],instruction[10]);
buf (shamt[3],instruction[9]);
buf (shamt[2],instruction[8]);
buf (shamt[1],instruction[7]);
buf (shamt[0],instruction[6]);	
		//zero extended shamt
buf (zeroExtendShamt[0],shamt[0]);
buf (zeroExtendShamt[1],shamt[1]);
buf (zeroExtendShamt[2],shamt[2]);
buf (zeroExtendShamt[3],shamt[3]);
buf (zeroExtendShamt[4],shamt[4]);
buf (zeroExtendShamt[5],1'b0);
buf (zeroExtendShamt[6],1'b0);
buf (zeroExtendShamt[7],1'b0);
buf (zeroExtendShamt[8],1'b0);
buf (zeroExtendShamt[9],1'b0);
buf (zeroExtendShamt[10],1'b0);
buf (zeroExtendShamt[11],1'b0);
buf (zeroExtendShamt[12],1'b0);
buf (zeroExtendShamt[13],1'b0);
buf (zeroExtendShamt[14],1'b0);
buf (zeroExtendShamt[15],1'b0);
buf (zeroExtendShamt[16],1'b0);
buf (zeroExtendShamt[17],1'b0);
buf (zeroExtendShamt[18],1'b0);
buf (zeroExtendShamt[19],1'b0);
buf (zeroExtendShamt[20],1'b0);
buf (zeroExtendShamt[21],1'b0);
buf (zeroExtendShamt[22],1'b0);
buf (zeroExtendShamt[23],1'b0);
buf (zeroExtendShamt[24],1'b0);
buf (zeroExtendShamt[25],1'b0);
buf (zeroExtendShamt[26],1'b0);
buf (zeroExtendShamt[27],1'b0);
buf (zeroExtendShamt[28],1'b0);
buf (zeroExtendShamt[29],1'b0);
buf (zeroExtendShamt[30],1'b0);
buf (zeroExtendShamt[31],1'b0);
			//immediate
buf (immed[0],instruction[0]);
buf (immed[1],instruction[1]);
buf (immed[2],instruction[2]);
buf (immed[3],instruction[3]);
buf (immed[4],instruction[4]);
buf (immed[5],instruction[5]);
buf (immed[6],instruction[6]);
buf (immed[7],instruction[7]);
buf (immed[8],instruction[8]);
buf (immed[9],instruction[9]);
buf (immed[10],instruction[10]);
buf (immed[11],instruction[11]);
buf (immed[12],instruction[12]);
buf (immed[13],instruction[13]);
buf (immed[14],instruction[14]);
buf (immed[15],instruction[15]);

signExtend se(immed,signExtenImmed);
zeroExtend ze(immed,zeroExtendImmed);

control c(op,RegDst,ALUSrc,Branch,MemRead,MemWrite,MemtoReg,ALUop,Jump,RegWrite); //create control signals

_2_1_5bit_mux mux5_1 (write_reg,rt,rd,RegDst); //write reg seçilir (rt - rd)
registerBlock read_contents(rs_content,rt_content,regWriteData, rs, rt, write_reg, RegWrite,clk1);//read-write register

//shift enable
not(temp1,funct[5]);
not(temp2,ALUop[0]);
and(shiftEnable,temp1,temp2,ALUop[1]);

_2_1_32bit_mux select_rs(real_rs_content,rs_content,rt_content,shiftEnable);//rs-rt (sll srl)

_4_1_32bit_mux selectrt(temp3,rt_content,signExtenImmed,zeroExtendImmed,ignore,ALUSrc[0],ALUSrc[1]);//rt-signex-zeroex

_2_1_32bit_mux select_rt(real_rt_content,temp3,zeroExtendShamt,shiftEnable); //real rt-shamt (srl sll)

alu_control aluctrl (aluSelect, funct, ALUop);	//create alu control signals
alu32 alu_process(temp_result,real_rs_content,real_rt_content,aluSelect,zero);

and(real_branch,Branch,zero);

//sltu
and_operator ao(sltuNeg,32'b0,32'b0);
or_operator oo(sltuPoz,32'b0,32'b00000000000000000000000000000001);
_2_1_32bit_mux select_sltuVal(sltuVal,sltuNeg,sltuPoz,temp_result[31]);
and(sltuSignal,temp2,ALUop[1],funct[3]);
_2_1_32bit_mux select_result(result,temp_result,sltuVal,sltuSignal);

memoryBlock mb(MemReadData, rt_content, result, MemWrite, MemRead, clk1);	//read-write memory

_2_1_32bit_mux memorreg(regWriteData,result,MemReadData,MemtoReg);
	
endmodule
