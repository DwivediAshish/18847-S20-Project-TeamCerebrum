// Spike encoding testbench

`timescale 1ns / 1ps

module ffsr_spike_test;

  localparam INPUT_SIZE = 16;
  
  logic rst;     //reset
  logic inc;     //increment the value
  logic dec;     //decrement the value
  logic [0:INPUT_SIZE-1] init;    //initial value
  logic [0:INPUT_SIZE-1] out;    //current output
  logic clk;
  
  ffsr_spike #(.INPUT_SIZE(INPUT_SIZE)) DUT (.rst(rst), .inc(inc), .dec(dec),
                  .clk(clk), .init(init), .out(out));
  
  initial
  begin
      clk = 0;
      $dumpfile("ffsr_spike.vcd"); // Change this name as required
      $dumpvars(0, ffsr_spike_test);
      init = 16'b0001111;
      rst = 1'b0;
      inc = 1'b1;
      dec = 1'b1;
      #5ns;
      rst = 1'b1;
      #40ns;
      @(posedge clk);
      #0;
      rst = 1'b0;
      inc = 1'b1;
      dec = 1'b1;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #0;
      inc = 1'b1;
      dec = 1'b0;
      @(posedge clk);
      #0;
      inc = 1'b1;
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
      #0;
      inc = 1'b0;
      dec = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #0;
      // reset
      inc = 1'b1;
      dec = 1'b1;
      @(posedge clk);
      #0;
      inc = 1'b1;
      dec = 1'b1;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #0;
      inc = 1'b0;
      dec = 1'b1;
      @(posedge clk);
      @(posedge clk);
      inc = 1'b0;
      dec = 1'b1;
      $finish;
  end

  always begin
    #10ns clk = ~clk;
  end
endmodule
