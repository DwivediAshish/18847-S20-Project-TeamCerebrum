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
    input wire [0:INPUT_SIZE-1] init;    //initial value
    output wire [0:INPUT_SIZE-1] out;    //current output
    input wire clk;

    /* Declare any intermediate wires you use */

endmodule
