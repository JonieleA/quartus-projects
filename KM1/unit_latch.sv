module unit_latch #(parameter W = 1)
(input logic clock,
input logic [W-1:0] data_in,
output logic [W-1:0] data_out);
always_ff @(posedge clock)
data_out <= data_in;
endmodule