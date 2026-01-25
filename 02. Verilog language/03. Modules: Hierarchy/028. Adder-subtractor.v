module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire c1;
    wire [31:0] c2;
    assign c2= b^{32{sub}};
    add16(a[15:0],c2[15:0],sub,sum[15:0],c1);
    add16(.a(a[31:16]),.b(c2[31:16]),.cin(c1),.sum(sum[31:16]),.cout());
endmodule
