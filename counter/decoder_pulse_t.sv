// Pulse Input Decoder


`timescale 1ns / 1ps

module decoder_pulse_t
#
(
    parameter MAX_VALUE = 8
)
(
    input  logic                           clock,
    input  logic                           reset,

    input  logic                           incoming_line,
    output logic                           outgoing_line_valid,
    output logic [7:0] outgoing_line
);

    always_ff @(posedge clock, posedge reset) begin
        if (reset) begin
            outgoing_line <= 8'b1111_1111;
            outgoing_line_valid <= 1'b0;
        end
        else begin
            if (incoming_line) begin
                outgoing_line_valid <= 1'b1;
                outgoing_line       <= outgoing_line;
            end
            else begin
                outgoing_line_valid <= 1'b0;
                outgoing_line       <= outgoing_line >> 1'b1;
            end
        end
    end

endmodule : decoder_pulse_t
