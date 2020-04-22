// Pulse encoding testbench

`timescale 1ns / 1ps

module ffsr_pulse_binary_test;

  logic rst;     //reset
  logic inc;     //increment the value
  logic dec;     //decrement the value
  logic [2:0] out;    //current output
  logic clk;
  
  ffsr_pulse_binary DUT (.rst(rst), .inc(inc), .dec(dec),
                  .clk(clk), .out(out));
  
  initial
  begin
      clk = 0;
      $dumpfile("ffsr_pulse_binary_opt.vcd"); // Change this name as required
      $dumpvars(0, ffsr_pulse_binary_test);
      rst = 1'b0;
      inc = 1'b0;
      dec = 1'b0;
      #5ns;
      rst = 1'b1;
      #40ns;
      @(posedge clk);
      #0;
      rst = 1'b0;
      inc = 1'b0;
      dec = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #0;
      inc = 1'b1;
      dec = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #0;
      inc = 1'b0;
      dec = 1'b1;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      $finish;
  end

  always begin
    #10ns clk = ~clk;
  end
endmodule
