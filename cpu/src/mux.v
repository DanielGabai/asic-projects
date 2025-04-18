`timescale 1ns/1ps
`default_nettype none

module mux (
    input wire [3:0] a, b,
    input wire sel,
    output reg [3:0] out
);

assign out = (sel) ? b : a;

endmodule