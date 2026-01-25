module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c1;
    wire [15:0]s1,s2;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],c1);
    add16 b1(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(s1),.cout());
    add16 b2(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(s2),.cout());
    assign sum[31:16]=c1?s2:s1;
endmodule
