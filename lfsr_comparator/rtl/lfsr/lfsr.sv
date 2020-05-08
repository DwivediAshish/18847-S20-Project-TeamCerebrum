module lfsr 
	(
	input logic clk,    // Clock
	input logic rst_b,  // Asynchronous reset active low
	input logic [15:0] seed,
	output logic [15:0] shift_value
	
);

reg feedback;

// LSFR with primitive polynomial as x^16+x^14+x^13+x^12+1
always @(posedge clk or negedge rst_b)
  begin
    if (~rst_b)
      shift_value <= seed;
    else
      shift_value <= {shift_value[14:0],feedback};
end
assign feedback = shift_value[15] ^ shift_value[13] ^ shift_value[12] ^ shift_value[11];


endmodule