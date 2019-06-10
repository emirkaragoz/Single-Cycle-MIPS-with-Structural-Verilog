module _32bit_subtractor (S,C,A,B,C0);
input [31:0] A,B;
input C0;
output C;
output [31:0] S;
wire [31:0] out1,out2;
wire C_ignore,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,
C18,C19,C20,C21,C22,C23,C24,C25,C26,C27,C28,C29,C30,C31; 

xor_operator xorSecondNumber(out1,32'b11111111111111111111111111111111,B);
_32bit_adder _32ba (out2,C_ignore,out1,32'b00000000000000000000000000000001,1'b0);


full_adder 	FA0(S[0], C1, A[0], out2[0], C0),
				FA1(S[1], C2, A[1], out2[1], C1),
				FA2(S[2], C3, A[2], out2[2], C2),
				FA3(S[3], C4, A[3], out2[3], C3),
				FA4(S[4], C5, A[4], out2[4], C4),
				FA5(S[5], C6, A[5], out2[5], C5),
				FA6(S[6], C7, A[6], out2[6], C6),
				FA7(S[7], C8, A[7], out2[7], C7),
				FA8(S[8], C9, A[8], out2[8], C8),
				FA9(S[9], C10, A[9], out2[9], C9),
				FA10(S[10], C11, A[10], out2[10], C10),
				FA11(S[11], C12, A[11], out2[11], C11),
				FA12(S[12], C13, A[12], out2[12], C12),
				FA13(S[13], C14, A[13], out2[13], C13),
				FA14(S[14], C15, A[14], out2[14], C14),
				FA15(S[15], C16, A[15], out2[15], C15),
				FA16(S[16], C17, A[16], out2[16], C16),
				FA17(S[17], C18, A[17], out2[17], C17),
				FA18(S[18], C19, A[18], out2[18], C18),
				FA19(S[19], C20, A[19], out2[19], C19),
				FA20(S[20], C21, A[20], out2[20], C20),
				FA21(S[21], C22, A[21], out2[21], C21),
				FA22(S[22], C23, A[22], out2[22], C22),
				FA23(S[23], C24, A[23], out2[23], C23),
				FA24(S[24], C25, A[24], out2[24], C24),
				FA25(S[25], C26, A[25], out2[25], C25),
				FA26(S[26], C27, A[26], out2[26], C26),
				FA27(S[27], C28, A[27], out2[27], C27),
				FA28(S[28], C29, A[28], out2[28], C28),
				FA29(S[29], C30, A[29], out2[29], C29),
				FA30(S[30], C31, A[30], out2[30], C30),
				FA31(S[31], C, A[31], out2[31], C31);
				
endmodule