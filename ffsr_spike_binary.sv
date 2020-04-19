`timescale 1ns / 1ps

module ffsr_spike_binary (rst, inc, dec, clk, out); 

input wire rst;     //reset
input wire inc;     //increment the value
input wire dec;     //decrement the value
output wire [2:0] out;    //current output
input wire clk;

  reg [2:0] storage;

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

  always @(posedge clk or posedge rst)begin
    if(rst) begin
      storage <= 3'b0;
    end
    else begin
      if(inc_pulse & ~dec_pulse) begin
        storage <= storage + 3'b1;
      end
      else if(~inc_pulse & dec_pulse) begin
        storage <= storage - 3'b1;
      end
      else begin
        storage <= storage;
      end
    end
  end

assign out = storage;
endmodule
