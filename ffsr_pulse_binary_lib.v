`timescale 1ns / 1ps

module ffsr_pulse_binary_lib(rst, inc, dec, clk, out); 

input wire rst;     //reset
input wire inc;     //increment the value
input wire dec;     //decrement the value
output wire [2:0] out;    //current output
input wire clk;

// Library level implementation of ffsr, binary and pulse encoding

endmodule
