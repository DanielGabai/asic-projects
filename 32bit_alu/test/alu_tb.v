`timescale 1ns/1ps  
`default_nettype none

module alu_tb;

reg [31:0] a, b;
reg [3:0] sel;
wire [31:0] out;
wire zero;

alu dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .zero(zero)
    );

    initial begin
        $display("Starting ALU Testbench...\n");

        // AND: 12 & 10 = 8
        a = 32'd12; b = 32'd10; sel = 4'b0000;
        #1;
        $display("AND:  %0d & %0d = %0d (Expected: 8)", a, b, out);

        // OR: 12 | 10 = 14
        a = 32'd12; b = 32'd10; sel = 4'b0001;
        #1;
        $display("OR:   %0d | %0d = %0d (Expected: 14)", a, b, out);

        // ADD: 7 + 5 = 12
        a = 32'd7; b = 32'd5; sel = 4'b0010;
        #1;
        $display("ADD:  %0d + %0d = %0d (Expected: 12)", a, b, out);

        // SUB: 15 - 9 = 6
        a = 32'd15; b = 32'd9; sel = 4'b0011;
        #1;
        $display("SUB:  %0d - %0d = %0d (Expected: 6)", a, b, out);

        // XOR: 10 ^ 3 = 9
        a = 32'd10; b = 32'd3; sel = 4'b0100;
        #1;
        $display("XOR:  %0d ^ %0d = %0d (Expected: 9)", a, b, out);

        // SLT: -4 < 2 → 1
        a = -32'sd4; b = 32'd2; sel = 4'b0101;
        #1;
        $display("SLT:  %0d < %0d = %0d (Expected: 1)", $signed(a), $signed(b), $signed(out));

        // SLL: 1 << 4 = 16
        a = 32'd1; b = 32'd4; sel = 4'b0111;
        #1;
        $display("SLL:  %0d << %0d = %0d (Expected: 16)", a, b[4:0], out);

        // SRL: 32 >> 3 = 4
        a = 32'd32; b = 32'd3; sel = 4'b1000;
        #1;
        $display("SRL:  %0d >> %0d = %0d (Expected: 4)", a, b[4:0], out);

        // SRA: -8 >>> 2 = -2
        a = -32'sd8; b = 32'd2; sel = 4'b1001;
        #1;
        $display("SRA:  %0d >>> %0d = %0d (Expected: -2)", $signed(a), $signed(b[4:0]), $signed(out));


        $display("\nALU Testbench Completed.");
        $finish;
    end

endmodule