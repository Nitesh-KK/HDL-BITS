module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]r;
    always @(posedge clk) begin
        r<=in;
        if(reset)
            out<=32'b0;
        else begin
            for(integer i=0;i<32;i++) begin
                if(r[i]&(~in[i]))
                    out[i]<=1'b1;
            end
        end
    end
endmodule
