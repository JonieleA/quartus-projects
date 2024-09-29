module par_posl_top #(parameter W = 128) (A, B, C_in, C_out, S, CLK_50, reset, enable);

input logic [W-1:0] A, B;
input logic C_in;
output logic [W-1:0] S;
output logic C_out;
logic [W-1:0] Q_A, Q_B, Q_S;
input logic CLK_50, reset, enable;
logic Q_C_in, Q_C_out;

par_posl_adder_param #(.W(W)) DUT (.A(Q_A), .B(Q_B), .C_in(Q_C_in), .C_out(Q_C_out), .S(Q_S));

register #(.W(W)) A_i (.clock(CLK_50), .reset(reset), .enable(enable), .data_in(A), .data_out(Q_A));
register #(.W(W)) B_i (.clock(CLK_50), .reset(reset), .enable(enable), .data_in(B), .data_out(Q_B));
register #(.W(1)) C_i (.clock(CLK_50), .reset(reset), .enable(enable), .data_in(C_in), .data_out(Q_C_in));

unit_latch #(.W(W)) S_o (.clock(CLK_50), .data_in(Q_S), .data_out(S));
unit_latch #(.W(1)) C_o (.clock(CLK_50), .data_in(Q_C_out), .data_out(C_out));

endmodule