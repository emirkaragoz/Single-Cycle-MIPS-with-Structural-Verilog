module alu32(R,A,B,S,Z);
input [31:0] A,B;
input [2:0] S;
output [31:0] R;
output Z;

wire [31:0] r1,r2,r3,r4,r5,r6,r7,r8,tz;
wire sumCarryOut,subtractorBorrow;
wire msb,zerobit,selectbit;

//srl sra selection
buf (msb,A[31]);
buf (zerobit, 1'b0);
_2_1mux select(selectbit,zerobit,msb,1'b0);

and_operator and_(r1,A,B);
or_operator or_(r2,A,B);
_32bit_adder adder (r3,sumCarryOut,A,B,1'b0);
xor_operator xor_(r4,A,B);
_32bit_subtractor _32bs (r5,subtractorBorrow,A,B,1'b0);
shift_right sr (r6,A,B,selectbit);
shift_left sltb (r7,A,B);
nor_operator norTB(r8,A,B);

_8_1_32bit_mux result (R,r1,r2,r3,r4,r5,r6,r7,r8,S[0],S[1],S[2]);
xor_operator xop (tz,32'b11111111111111111111111111111111,R);
and (Z,tz[0],tz[1],tz[2],tz[3],tz[4],tz[5],tz[6],tz[7],tz[8],tz[9],tz[10],tz[11],tz[12],tz[13],tz[14],tz[15],
tz[16],tz[17],tz[18],tz[19],tz[20],tz[21],tz[22],tz[23],tz[24],tz[25],tz[26],tz[27],tz[28],tz[29],tz[30],tz[31]);

endmodule
