// LFSR generate 1 of a given probability every clk cycle.
// Base is 8 bit shift register
// 
// Input : Probability parameter,seed value
// 
// output : bit 1 with probablity equal to parameter

module lfsr_behavioral
	#(parameter n = 7, // n in 2^n should be less than 16
	parameter n2 = 2**n)
 (
	input logic clk,    // Clock
	input logic rst_b,  // Asynchronous reset active low
	input logic [15:0] seed,
	input logic [7:0] probability,
	output logic prob_bit
);

reg [15:0] shift_value;

// LSFR with primitive polynomial as x^16+x^14+x^13+x^12+1
lfsr lfsr_inst(.clk(clk),.rst_b(rst_b),.seed(seed),.shift_value(shift_value));

// give output as 1 with probability = (probability)/128
prob_gen #(.n(7)) prob_gen_inst(.random_value(shift_value[n-1:0]),.probability(probability),.prob_bit(prob_bit));
endmodule