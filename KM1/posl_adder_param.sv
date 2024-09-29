module posl_adder_param #(parameter W = 128) (A, B, C_in, C_out, S);

input logic [W-1:0] A, B;
input logic C_in;
output logic [W-1:0] S;
output logic C_out;
logic [W:0] C;
genvar i;

generate
	for (i = 0; i < W; i++) begin :
		add_stage full_adder one_bit_adder(.A(A[i]), .B(B[i]), .C_in(C[i]), .C_out(C[i+1]), .S(S[i]));
	end
endgenerate

assign C[0] = C_in;
assign C_out = C[W];

endmodule