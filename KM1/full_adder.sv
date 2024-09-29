module full_adder (A, B, C_in, C_out, S);
input logic A, B, C_in;
output logic S, C_out;
assign S = A ^ B ^ C_in;
assign C_out = (A & B) | (C_in & (A ^ B));
endmodule