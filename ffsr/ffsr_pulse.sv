// Pulse encoding
/*
rst   inc   dec   Operation
 1     x     x    Latch onto the input reset value
 0     1     0    Increase value by 1 (equivalent to shifting left and adding 1)
 0     0     1    Decrease value by 1 (equivalent to shifting right)
 0     0     0    Maintain the previous value
*/

`timescale 1ns / 1ps

module ffsr_pulse (rst, inc, dec, clk, init, out); 

  parameter INPUT_SIZE = 8;
  
  input wire rst;     //reset
  input wire inc;     //increment the value
  input wire dec;     //decrement the value
  input wire [INPUT_SIZE-1:0] init;    //initial value
  output wire [INPUT_SIZE-1:0] out;    //current output
  input wire clk;
  
  /* Declare any intermediate wires you use */
  wire [INPUT_SIZE-1:0] temp_out;
  wire [INPUT_SIZE-1:0] temp_prev;
  wire [INPUT_SIZE-1:0] temp_next;
  
  // This assumes that INPUT_SIZE>1
  assign temp_prev = {temp_out[INPUT_SIZE-2:0],1'b1};
  assign temp_next = {1'b0,temp_out[INPUT_SIZE-1:1]};

  `ifndef BEHAVIORAL
    //for structural, we need inverted inc and dec
    wire incn, decn;  //inverted inc and dec
    flip_bus flip_inc(.in(inc), .out(incn));
    flip_bus flip_dec(.in(dec), .out(decn));
  `endif
  
  genvar i;
  generate
    for(i=0; i<INPUT_SIZE; i=i+1)
    begin : Loop1
      `ifdef BEHAVIORAL
        ffsr_pulse_bb_behavioral ffsr_pulse_bb(
      `else //behavioral ends, structural begins
        ffsr_pulse_bb_structural ffsr_pulse_bb(
          .decn(decn),
          .incn(incn),
      `endif    //rest all signals are same
          .rst(rst),
          .inc(inc),
          .dec(dec),
          .clk(clk),
          .init(init[i]),
          .out(temp_out[i]),
          .prev(temp_prev[i]),
          .next(temp_next[i])
        );
        //  .rst(rst),
        //  .inc(inc),
        //  .dec(dec),
        //  .clk(clk),
        //  .init(init[i]),
        //  .out(temp_out[i]),
        //  .prev(temp_prev[i]),
        //  .next(temp_next[i])
        //);
    end
  endgenerate

  assign out = temp_out;
endmodule
