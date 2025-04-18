`timescale 1ns/1ps
`default_nettype none

module register (
    input wire[3:0] d,
    input wire clk, load,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (load) begin
        q <= d;
    end
end

endmodule   