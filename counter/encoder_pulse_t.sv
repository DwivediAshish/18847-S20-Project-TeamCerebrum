// Pulse Output Encoder 


`timescale 1ns / 1ps

module encoder_pulse_t
#
(
    parameter MAX_VALUE = 8
)
(
    input  logic                           clock,
    input  logic                           reset,

    input  logic                           [7:0] incoming_line,
    input  logic                           incoming_line_valid,
    output logic                           outgoing_line
);

    logic [7:0]                     internal_number, counter;
    logic                           countdown_flag;

    assign outgoing_line = (countdown_flag && counter == internal_number) ? 0 : 1;

    always_ff @(posedge clock, posedge reset) begin
        if (reset) begin
            internal_number <= 1'b0;
            counter <= 8'b1111_1111;
            countdown_flag <= 1'b0;
        end
        else begin
            if (incoming_line_valid) begin
                internal_number <= incoming_line;
                countdown_flag <= 1'b1;
                counter <= 8'b1111_1111;
            end
            if (countdown_flag && !incoming_line_valid && !outgoing_line) begin
                counter <= counter >> 1'b1;
            end
            if (!outgoing_line && !incoming_line_valid) begin
                countdown_flag <= 1'b0;
            end
        end
    end

endmodule : encoder_pulse_t
