`timescale 1ns/1ps
`default_nettype none

module uart_tx #(
    parameter CLK_DIV = 434
)(
    input wire clk,
    input wire rst,
    input wire tx_start,
    input wire [7:0] tx_data,
    output reg tx,
    output reg tx_busy
);

reg [8:0] clk_div_count;
reg baud_tick;
reg [3:0] tx_state;
reg [7:0] tx_shift_reg;

always @(posedge clk) begin // Generate Baud Tick   
    if (rst) begin
        clk_div_count <= 0;
        baud_tick <= 0;
    end else if (clk_div_count == CLK_DIV) begin
        clk_div_count <= 0;
        baud_tick <= 1;
    end else begin
        clk_div_count <= clk_div_count + 1;
        baud_tick <= 0;
    end
end


always @(posedge clk) begin
    if (rst) begin 
        tx <= 1;
        tx_state <= 0;
        tx_busy <= 0;
        tx_shift_reg <= 0;
    end else if (baud_tick) begin
        if (tx_busy) begin
            if (tx_state == 0) begin
                tx <= 0;  // Start bit
            end else if (tx_state < 9) begin
                tx <= tx_shift_reg[tx_state - 1];  // Data bits
            end else if (tx_state == 9) begin
                tx <= 1;  // Stop bit
            end else begin // Reset
                tx_busy <= 0;
                tx_state <= 0;
                tx <= 1;
            end
            if (tx_state < 10)
                tx_state <= tx_state + 1;
        end
    end
    if (tx_start) begin
            tx_shift_reg <= tx_data;
            tx_busy <= 1;
            tx_state <= 0;
        end
end

endmodule