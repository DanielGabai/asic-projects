module alu (
    input [31:0] a, b,
    input [3:0] sel,
    output reg [31:0] out,
    output wire zero
);
assign zero = (out == 32'd0);
always @(*) begin
    case (sel)
        4'b0000: out = a & b; // AND
        4'b0001: out = a | b; // OR
        4'b0010: out = a + b; // ADD
        4'b0011: out = a - b; // SUB
        4'b0100: out = a ^ b; // XOR
        4'b0101: out = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;  // SLT
        4'b0111: out = a << b[4:0];            // SLL
        4'b1000: out = a >> b[4:0];            // SRL
        4'b1001: out = $signed(a) >>> b[4:0];  // SRA
        default: out = 32'd0;
    endcase
end

endmodule
