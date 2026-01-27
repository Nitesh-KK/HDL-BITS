module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum 
);
    wire [99:0] carry;
    fa fa0 (
        .x(a[0]), .y(b[0]), .c(cin),
        .sumx(sum[0]), .c1(carry[0])
    );
    genvar i;
    generate
        for(i=1; i<100; i=i+1) begin : gen_fa
            fa fa_i (
                .x(a[i]), .y(b[i]), .c(carry[i-1]),
                .sumx(sum[i]), .c1(carry[i])
            );
        end
    endgenerate
    assign cout = carry;
endmodule

module fa(
    input x, y, c,
    output sumx, c1
);
    assign sumx = x ^ y ^ c;
    assign c1   = (x & y) | (x & c) | (y & c);
endmodule
