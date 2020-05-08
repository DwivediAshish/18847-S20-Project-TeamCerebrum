`timescale 1ns / 1ps

module ffsr_pulse_binary (rst, inc, dec, clk, out); 

input wire rst;     //reset
input wire inc;     //increment the value
input wire dec;     //decrement the value
output wire [2:0] out;    //current output
input wire clk;

reg [2:0] storage;

always @(posedge clk or posedge rst)begin
  if(rst) begin
    storage <= 3'b0;
  end
  else begin
    if(inc & (storage != 3'b111)) begin
      storage <= storage + 3'b1;
    end
    else if(dec & (storage != 3'b000)) begin
      storage <= storage - 3'b1;
    end
    else begin
      storage <= storage;
    end
  end
end

assign out = storage;
endmodule
