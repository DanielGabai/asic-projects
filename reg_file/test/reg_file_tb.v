`timescale 1ns/1ps  
`default_nettype none

module reg_file_tb;

reg clk, we;
reg [4:0] waddr, raddr1, raddr2;
reg [31:0] wdata;
wire [31:0] rdata1, rdata2;

reg_file r (
    .clk(clk),
    .we(we),
    .waddr(waddr),
    .raddr1(raddr1),
    .raddr2(raddr2),
    .wdata(wdata),
    .rdata1(rdata1),
    .rdata2(rdata2)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("reg_file_tb.vcd");
    $dumpvars(0, reg_file_tb);
end

initial begin
    clk = 0;
    we = 0;
    waddr = 0;
    raddr1 = 0;
    raddr2 = 0;
    wdata = 0;

    #(CLK_PERIOD);

    we = 1;
    waddr = 32'd10;
    wdata = 32'd10;

    #(CLK_PERIOD);
    
    waddr = 32'd20;
    wdata = 32'd20;

    #(CLK_PERIOD);

    $display("Out 1: %d Out 2: %d", rdata1, rdata2);
    raddr1 = 32'd10;
    raddr2 = 32'd20;
    $display("Out 1: %d Out 2: %d", rdata1, rdata2);

    $finish;
end

endmodule