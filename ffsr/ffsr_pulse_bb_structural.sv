// Pulse encoding basic block
// Implements one block of the FFSR
// The complete FFSR module uses generate blocks to instantiate multiple copies
// of this basic block. This module has both direct and inverted inputs to
// reduce total number of inverters required in the system

`timescale 1ns / 1ps

module ffsr_pulse_bb_structural (rst, inc, incn, dec, decn, clk, init,
                                 out, prev, next); 

  input wire rst;     //reset
  input wire inc;     //increment the value
  input wire incn;    //increment the value-negated
  input wire dec;     //decrement the value
  input wire decn;    //decrement the value-negated
  input wire init;    //initial value
  input wire clk;     //clock
  input wire prev;    //previous stage value (used in case of inc) Lower index
  input wire next;    //next stage value (used in case of dec) Higher index
  
  output wire out;    //current output

  // internal variables
  wire inc_out;       //output as it should be in case inc = 1
  wire dec_out;       //output as it should be in case dec = 1
  wire same_out;      //output as it should be in case dec = inc = 0
  reg out_reg;

  assign inc_out = inc & prev;
  // we can remove one gate if we rely on the fact that dec and inc are both not
  // set in the same cycle.
  assign dec_out = dec & next;
  assign same_out = decn & incn & out;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      out_reg <= init;
    end
    else begin
      out_reg <= inc_out | dec_out | same_out;
    end
  end

  assign out = out_reg;
  
endmodule
