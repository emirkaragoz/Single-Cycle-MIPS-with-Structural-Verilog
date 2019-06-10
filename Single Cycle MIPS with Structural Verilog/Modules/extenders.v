module signExtend(in,out);

input [15:0] in;
output [31:0] out;

buf (out[0],in[0]);
buf (out[1],in[1]);
buf (out[2],in[2]);
buf (out[3],in[3]);
buf (out[4],in[4]);
buf (out[5],in[5]);
buf (out[6],in[6]);
buf (out[7],in[7]);
buf (out[8],in[8]);
buf (out[9],in[9]);
buf (out[10],in[10]);
buf (out[11],in[11]);
buf (out[12],in[12]);
buf (out[13],in[13]);
buf (out[14],in[14]);
buf (out[15],in[15]);
buf (out[16],in[15]);
buf (out[17],in[15]);
buf (out[18],in[15]);
buf (out[19],in[15]);
buf (out[20],in[15]);
buf (out[21],in[15]);
buf (out[22],in[15]);
buf (out[23],in[15]);
buf (out[24],in[15]);
buf (out[25],in[15]);
buf (out[26],in[15]);
buf (out[27],in[15]);
buf (out[28],in[15]);
buf (out[29],in[15]);
buf (out[30],in[15]);
buf (out[31],in[15]);

endmodule

module zeroExtend(in,out);

input [15:0] in;
output [31:0] out;

buf (out[0],in[0]);
buf (out[1],in[1]);
buf (out[2],in[2]);
buf (out[3],in[3]);
buf (out[4],in[4]);
buf (out[5],in[5]);
buf (out[6],in[6]);
buf (out[7],in[7]);
buf (out[8],in[8]);
buf (out[9],in[9]);
buf (out[10],in[10]);
buf (out[11],in[11]);
buf (out[12],in[12]);
buf (out[13],in[13]);
buf (out[14],in[14]);
buf (out[15],in[15]);
buf (out[16],1'b0);
buf (out[17],1'b0);
buf (out[18],1'b0);
buf (out[19],1'b0);
buf (out[20],1'b0);
buf (out[21],1'b0);
buf (out[22],1'b0);
buf (out[23],1'b0);
buf (out[24],1'b0);
buf (out[25],1'b0);
buf (out[26],1'b0);
buf (out[27],1'b0);
buf (out[28],1'b0);
buf (out[29],1'b0);
buf (out[30],1'b0);
buf (out[31],1'b0);

endmodule




