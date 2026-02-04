module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] r;
    always @(posedge clk) begin
        r<=in;
        anyedge<=r^in;
    end
endmodule
