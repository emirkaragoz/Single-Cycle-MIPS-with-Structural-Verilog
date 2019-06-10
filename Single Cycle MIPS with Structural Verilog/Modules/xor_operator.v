module xor_operator(R,A,B);
input [31:0] A;
input [31:0] B;
output [31:0] R;

xor (R[0],A[0],B[0]);
xor (R[1],A[1],B[1]);
xor (R[2],A[2],B[2]);
xor (R[3],A[3],B[3]);
xor (R[4],A[4],B[4]);
xor (R[5],A[5],B[5]);
xor (R[6],A[6],B[6]);
xor (R[7],A[7],B[7]);
xor (R[8],A[8],B[8]);
xor (R[9],A[9],B[9]);
xor (R[10],A[10],B[10]);
xor (R[11],A[11],B[11]);
xor (R[12],A[12],B[12]);
xor (R[13],A[13],B[13]);
xor (R[14],A[14],B[14]);
xor (R[15],A[15],B[15]);
xor (R[16],A[16],B[16]);
xor (R[17],A[17],B[17]);
xor (R[18],A[18],B[18]);
xor (R[19],A[19],B[19]);
xor (R[20],A[20],B[20]);
xor (R[21],A[21],B[21]);
xor (R[22],A[22],B[22]);
xor (R[23],A[23],B[23]);
xor (R[24],A[24],B[24]);
xor (R[25],A[25],B[25]);
xor (R[26],A[26],B[26]);
xor (R[27],A[27],B[27]);
xor (R[28],A[28],B[28]);
xor (R[29],A[29],B[29]);
xor (R[30],A[30],B[30]);
xor (R[31],A[31],B[31]);

endmodule