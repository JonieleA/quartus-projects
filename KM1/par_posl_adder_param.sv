module par_posl_adder_param #(parameter W = 128) (A, B, C_in, C_out, S);

input logic [W-1:0] A, B;
input logic C_in;
output logic [W-1:0] S;
output logic C_out;
logic [W/8:0] C,G,P;
genvar i;

generate
	for (i = 0; i < W/8; i++) begin:
		add_stage bit_8_adder  eight_bit (.A(A[(i+1)*8-1:i*8]), .B(B[(i+1)*8-1:i*8]), .C_in(C[i]), .C_out(), .S(S[(i+1)*8-1:i*8]));
		if (i > 0) assign C[i] = G[i-1] + P[i-1]*C[i-1];
		assign P[i] = A[(i+1)*8-1] ^ B[(i+1)*8-1];
		assign G[i] = A[(i+1)*8-1] * B[(i+1)*8-1];
	end
endgenerate

assign C[W/8] = G[W/8-1] + P[W/8-1]*C[W/8-1];
assign C[0] = C_in;
assign C_out = C[W/8];

endmodule