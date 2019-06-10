module control(opcode,RegDst,ALUSrc,Branch,MemRead,MemWrite,MemtoReg,ALUop,Jump,RegWrite);

input [5:0] opcode;
output RegDst,Branch,MemRead,MemWrite,MemtoReg,Jump,RegWrite;
output [2:0] ALUop;
output [1:0] ALUSrc;

wire R_Type,lw,sw,andi,ori,addiu,beq,j;
wire [5:0] negativeOpcode;

not (negativeOpcode[5],opcode[5]);
not (negativeOpcode[4],opcode[4]);
not (negativeOpcode[3],opcode[3]);
not (negativeOpcode[2],opcode[2]);
not (negativeOpcode[1],opcode[1]);
not (negativeOpcode[0],opcode[0]);

and(R_Type,negativeOpcode[5],negativeOpcode[4],negativeOpcode[3],negativeOpcode[2],negativeOpcode[1],negativeOpcode[0]);
and(lw,opcode[5],negativeOpcode[4],negativeOpcode[3],negativeOpcode[2],opcode[1],opcode[0]);
and(sw,opcode[5],negativeOpcode[4],opcode[3],negativeOpcode[2],opcode[1],opcode[0]);
and(andi,negativeOpcode[5],negativeOpcode[4],opcode[3],opcode[2],negativeOpcode[1],negativeOpcode[0]);
and(ori,negativeOpcode[5],negativeOpcode[4],opcode[3],opcode[2],negativeOpcode[1],opcode[0]);
and(addiu,negativeOpcode[5],negativeOpcode[4],opcode[3],negativeOpcode[2],negativeOpcode[1],opcode[0]);
and(beq,negativeOpcode[5],negativeOpcode[4],negativeOpcode[3],opcode[2],negativeOpcode[1],negativeOpcode[0]);
and(j,negativeOpcode[5],negativeOpcode[4],negativeOpcode[3],negativeOpcode[2],opcode[1],negativeOpcode[0]);

buf(RegDst,R_Type);
buf(MemtoReg,lw);
or(RegWrite,R_Type,andi,ori,addiu,lw);
buf(MemRead,lw);
buf(MemWrite,sw);
buf(Branch,beq);
buf(Jump,j);
or(ALUSrc[0],addiu,lw,sw);
or(ALUSrc[1],andi,ori);
or(ALUop[0],andi,beq);
or(ALUop[1],R_Type,andi);
buf(ALUop[2],ori);

endmodule
