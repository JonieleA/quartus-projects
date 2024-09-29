module bit_8_adder (A, B, C_in, C_out, S);

input logic [7:0] A, B;
input logic C_in;
output logic [7:0] S;
output logic C_out;
logic [8:0] C;
genvar i;

generate
	for (i = 0; i < 8; i++) begin :
		add_stage full_adder one_bit_adder(.A(A[i]), .B(B[i]), .C_in(C[i]), .C_out(C[i+1]), .S(S[i]));
	end
endgenerate

assign C[0] = C_in;
assign C_out = C[8];

endmodule