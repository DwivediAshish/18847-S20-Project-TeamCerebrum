`timescale 1ns / 1ps

module ffsr_pulse_binary_opt (rst, inc, dec, clk, out); 

input wire rst;     //reset
input wire inc;     //increment the value
input wire dec;     //decrement the value
output wire [2:0] out;    //current output
input wire clk;

reg [2:0] storage;

wire [3:0] addition;

assign addition = storage + {dec,dec,1'b1};

wire carry_out = addition[3];

assign sel = (carry_out & dec) | (inc & ~carry_out);

always @(posedge clk or posedge rst)begin
  if(rst) begin
    storage <= 3'b0;
  end
  else begin
    if(sel) begin
      storage <= addition[2:0];
    end
  end
end

assign out = storage;
endmodule
