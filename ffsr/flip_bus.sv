// flip_bus.sv
// Flip the input.
// In case you need special inverters of deliberately need to insert buffers

`timescale 1ns / 1ps

module flip_bus(in, out);

  parameter INPUT_SIZE = 1;

  input wire [INPUT_SIZE-1:0] in;
  output wire [INPUT_SIZE-1:0] out;

  assign out = ~in;

endmodule
