// Pulse encoding testbench

`timescale 1ns / 1ps

module ffsr_pulse_test;

  localparam INPUT_SIZE = 16;
  
  logic rst;     //reset
  logic inc;     //increment the value
  logic dec;     //decrement the value
  logic [0:INPUT_SIZE-1] init;    //initial value
  logic [0:INPUT_SIZE-1] out;    //current output
  logic clk;
  
  ffsr_pulse #(.INPUT_SIZE(INPUT_SIZE)) DUT (.rst(rst), .inc(inc), .dec(dec),
                  .clk(clk), .init(init), .out(out));
  
  initial
  begin
      $dumpfile("ffsr_pulse.vcd"); // Change this name as required
      $dumpvars(0, ffsr_pulse_test);
      clk = 0;
      init = 'b0;
      rst = 1'b1;
      inc = 1'b0;
      dec = 1'b0;
      #200;
      $finish;
  end

  always @* begin
    clk = #10 ~clk;
  end
endmodule
