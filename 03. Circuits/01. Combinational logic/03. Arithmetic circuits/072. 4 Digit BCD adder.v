module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]c1;
    bcd_fadd a0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c1[0]),.sum(sum[3:0]));
    genvar i;
    generate
        for(i=1;i<4;i++) begin: bcd_addr
            bcd_fadd a1(.a(a[4*i+3:4*i]),.b(b[4*i+3:4*i]),.cin(c1[i-1]),.cout(c1[i]),.sum(sum[4*i+3:4*i]));
        end
    endgenerate
    assign cout=c1[3];
endmodule
