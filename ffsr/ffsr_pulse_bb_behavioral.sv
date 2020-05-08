// Pulse encoding basic block
// Implements one block of the FFSR
// The complete FFSR module uses generate blocks to instantiate multiple copies
// of this basic block. This module has both direct and inverted inputs to
// reduce total number of inverters required in the system

`timescale 1ns / 1ps

module ffsr_pulse_bb_behavioral (rst, inc, dec, clk, init, out, prev, next); 

  input wire rst;     //reset
  input wire inc;     //increment the value
  input wire dec;     //decrement the value
  input wire init;    //initial value
  input wire clk;     //clock
  input wire prev;    //previous stage value (used in case of inc) Lower index
  input wire next;    //next stage value (used in case of dec) Higher index
  
  output wire out;    //current output

  // internal variables
  reg out_reg;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      out_reg <= init;
    end
    else begin
      if(inc) begin
        out_reg <= prev;
      end
      else if(dec) begin
        out_reg <= next;
      end
    end
  end

  assign out = out_reg;
  
endmodule
