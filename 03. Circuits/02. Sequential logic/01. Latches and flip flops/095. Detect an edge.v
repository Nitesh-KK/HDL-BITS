module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] r;
    always @(posedge clk) begin
        r<=in;
        pedge<=in&(~r);
    end
endmodule
