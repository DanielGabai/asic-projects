`timescale 1ns/1ps
`default_nettype none

module program_counter(
    input wire clk, rstn,
    output reg [2:0] out
);
always @(posedge clk) begin
    if (!rstn)
        out <= 0;
    else
        out <= out + 1;
end

endmodule