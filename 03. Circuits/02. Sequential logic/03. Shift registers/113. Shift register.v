module top_module (
    input clk,
    input resetn,   
    input in,
    output reg out);
    reg [2:0]q;
    always @(posedge clk) begin
        if(!resetn) begin
            q<=0;
            out<=0;
        end
        else begin
            q[2]<=in;
            q[1]<=q[2];
            q[0]<=q[1];
            out<=q[0];
        end
    end
endmodule
