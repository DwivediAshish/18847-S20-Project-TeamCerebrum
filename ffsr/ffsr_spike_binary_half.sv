/*
 * This is just the half implementation of FFSR spike binary encoding.
*/
`timescale 1ns / 1ps

module ffsr_spike_binary_half (rst, inc, dec, clk, out); 

input wire rst;     //reset
input wire inc;     //which value to select
input wire dec;     //decrement the value
output wire [2:0] out;    //current output
input wire clk;

  reg [2:0] storage;
  wire [3:0] addition;
  wire sel;

  assign addition = storage + {~dec, ~dec, 1'b1};
  assign sel = addition[3];

  /* Declare any intermediate wires you use */

  always @(posedge clk or posedge rst)begin
    if(rst) begin
      storage <= 3'b0;
    end
    else begin
      storage <= sel ? addition[2:0] : storage;
    end
  end

assign out = storage;
endmodule
