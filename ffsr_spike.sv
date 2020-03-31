// spike encoding
/*
 Verilog level implementation of spike encoding of FFSR does nothing but just
 converts the spike to pulse and feeds the pulse version of input to the "pulse"
 encoding version of the ffsr. There will be different MOS level implementation
*/

`timescale 1ns / 1ps

module ffsr_spike (rst, inc, dec, clk, init, out); 

  parameter INPUT_SIZE = 8;
  
  input wire rst;     //reset
  input wire inc;     //increment the value
  input wire dec;     //decrement the value
  input wire [INPUT_SIZE-1:0] init;    //initial value
  output wire [INPUT_SIZE-1:0] out;    //current output
  input wire clk;
  
  /* Declare any intermediate wires you use */
  wire inc_pulse;
  wire dec_pulse;
  reg inc_reg;
  reg dec_reg;

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      inc_reg <= 1'b1;
      dec_reg <= 1'b1;
    end
    else begin
      inc_reg <= inc;
      dec_reg <= dec;
    end
  end

  assign inc_pulse = inc_reg & (~inc);
  assign dec_pulse = dec_reg & (~dec);

  ffsr_pulse #(.INPUT_SIZE(INPUT_SIZE)) i_ffsr_pulse(
  .rst(rst),
  .inc(inc_pulse),
  .dec(dec_pulse),
  .clk(clk),
  .init(init),
  .out(out)
  );
  
endmodule
