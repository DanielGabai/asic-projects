`timescale 1ns/1ps  
`default_nettype none

module tb_uart_tx;

reg clk, rst, tx_start;
reg [7:0] tx_data;
wire tx, tx_busy;

uart_tx uut
(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_uart_tx.vcd");
    $dumpvars(0, tb_uart_tx);
end

initial begin
    
    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 8'd0;
    #(CLK_PERIOD * 100); // Reset

    rst=0;
    tx_data = 8'b01111000;
    tx_start = 1;
    #(CLK_PERIOD);
    tx_start = 0;
    #(CLK_PERIOD * 6000);
    $finish;
end

endmodule