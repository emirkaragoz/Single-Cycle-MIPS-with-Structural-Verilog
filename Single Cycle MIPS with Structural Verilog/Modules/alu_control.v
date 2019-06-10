module alu_control(select_bits_ALU, function_code, ALUop);

input [5:0] function_code;
input [2:0] ALUop;
output [2:0] select_bits_ALU;

wire negFuc5,negFuc2,negFuc1,negALU0,negALU1;
wire temp,temp1,temp2,temp3,temp5,temp6,temp7,temp8,temp9;	

not(negFuc5,function_code[5]);
not(negFuc2,function_code[2]);
not(negFuc1,function_code[1]);
not(negALU0,ALUop[0]);
not(negALU1,ALUop[1]);

xor(temp,ALUop[0],ALUop[1]);
or(temp1,negFuc5,function_code[1],ALUop[0]);
and(select_bits_ALU[2],temp,temp1);

xnor(temp2,ALUop[0],ALUop[2]);
xnor(temp3,function_code[2],function_code[1]);
or(temp8,temp3,negALU1);
and(select_bits_ALU[1],temp2,temp8);

xor(temp5,ALUop[2],ALUop[1]);
and(temp6,negFuc5,function_code[1]);
and(temp7,function_code[2],function_code[0]);
or(temp9,temp7,temp6,ALUop[2]);
and(select_bits_ALU[0],temp5,temp9,negALU0);

endmodule
