module _2_1mux(R,A,B,S);
input A,B,S;
output R;
wire r1,r2,r3;

not (r1,S);
and (r2,A,r1);
and (r3,B,S);
or (R,r2,r3);

endmodule

module _2_1_5bit_mux(R,A,B,S);
input [4:0] A,B;
input S;
output [4:0] R;
wire [4:0] s1,r1,r2,r3;

or (s1[0], 1'b0, S);
or (s1[1], 1'b0, S);
or (s1[2], 1'b0, S);
or (s1[3], 1'b0, S);
or (s1[4], 1'b0, S);

xor(r1[4],1'b1,s1[4]);
xor(r1[3],1'b1,s1[3]);
xor(r1[2],1'b1,s1[2]);
xor(r1[1],1'b1,s1[1]);
xor(r1[0],1'b1,s1[0]);

and(r2[4],A[4],r1[4]);
and(r2[3],A[3],r1[3]);
and(r2[2],A[2],r1[2]);
and(r2[1],A[1],r1[1]);
and(r2[0],A[0],r1[0]);

and(r3[4],B[4],s1[4]);
and(r3[3],B[3],s1[3]);
and(r3[2],B[2],s1[2]);
and(r3[1],B[1],s1[1]);
and(r3[0],B[0],s1[0]);

or(R[4],r2[4],r3[4]);
or(R[3],r2[3],r3[3]);
or(R[2],r2[2],r3[2]);
or(R[1],r2[1],r3[1]);
or(R[0],r2[0],r3[0]);

endmodule

module _2_1_32bit_mux(R,A,B,S);
input [31:0] A,B;
input S;
output [31:0] R;
wire [31:0] s1,r1,r2,r3;

or (s1[0], 1'b0, S);
or (s1[1], 1'b0, S);
or (s1[2], 1'b0, S);
or (s1[3], 1'b0, S);
or (s1[4], 1'b0, S);
or (s1[5], 1'b0, S);
or (s1[6], 1'b0, S);
or (s1[7], 1'b0, S);
or (s1[8], 1'b0, S);
or (s1[9], 1'b0, S);
or (s1[10], 1'b0, S);
or (s1[11], 1'b0, S);
or (s1[12], 1'b0, S);
or (s1[13], 1'b0, S);
or (s1[14], 1'b0, S);
or (s1[15], 1'b0, S);
or (s1[16], 1'b0, S);
or (s1[17], 1'b0, S);
or (s1[18], 1'b0, S);
or (s1[19], 1'b0, S);
or (s1[20], 1'b0, S);
or (s1[21], 1'b0, S);
or (s1[22], 1'b0, S);
or (s1[23], 1'b0, S);
or (s1[24], 1'b0, S);
or (s1[25], 1'b0, S);
or (s1[26], 1'b0, S);
or (s1[27], 1'b0, S);
or (s1[28], 1'b0, S);
or (s1[29], 1'b0, S);
or (s1[30], 1'b0, S);
or (s1[31], 1'b0, S);

xor_operator xor1 (r1,32'b11111111111111111111111111111111,s1);
and_operator and1 (r2,A,r1);
and_operator and2 (r3,B,s1);
or_operator or1 (R,r2,r3);

endmodule

module _4_1_32bit_mux(R,A1,A2,A3,A4,S1,S2);
input [31:0] A1,A2,A3,A4;
input S1,S2;
output [31:0] R;
wire [31:0] r1,r2;

_2_1_32bit_mux m1 (r1,A1,A2,S1);
_2_1_32bit_mux m2 (r2,A3,A4,S1);
_2_1_32bit_mux m3 (R,r1,r2,S2);

endmodule

module _8_1_32bit_mux(R,A1,A2,A3,A4,A5,A6,A7,A8,S1,S2,S3);
input [31:0] A1,A2,A3,A4,A5,A6,A7,A8;
input S1,S2,S3;
output [31:0] R;
wire [31:0] r1,r2;

_4_1_32bit_mux m1 (r1,A1,A2,A3,A4,S1,S2);
_4_1_32bit_mux m2 (r2,A5,A6,A7,A8,S1,S2);
_2_1_32bit_mux m3 (R,r1,r2,S3);

endmodule
