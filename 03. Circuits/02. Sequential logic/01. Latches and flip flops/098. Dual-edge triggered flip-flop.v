module top_module (
    input clk,
    input d,
    output q
);
    reg r1,r2;
    always @(posedge clk)
        r1<=d;
    always @(negedge clk)
        r2<=d;
    assign q=clk?r1:r2;
endmodule
