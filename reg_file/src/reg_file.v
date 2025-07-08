`timescale 1ns/1ps
`default_nettype none

module reg_file (
    input wire clk,
    input wire we,
    input wire [4:0] waddr,
    input wire [31:0] wdata,
    input wire [4:0] raddr1,
    input wire [4:0] raddr2,
    output wire [31:0] rdata1,
    output wire [31:0] rdata2
);

reg [31:0] register [31:0];

assign rdata1 = register[raddr1];
assign rdata2 = register[raddr2];

always @(posedge clk) begin
    register[0] <= 32'd0;
    if (we == 1'b1 && waddr != 5'd0) begin
        register[waddr] <= wdata;
    end
end

endmodule