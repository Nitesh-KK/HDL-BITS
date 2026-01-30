module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [99:0]c1;
    bin_add a1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c1[0]));
    genvar i;
    generate
        for(i=1;i<100;i++) begin: full_add
            bin_add ai(.a(a[i]),.b(b[i]),.cin(c1[i-1]),.sum(sum[i]),.cout(c1[i]));
        end
    endgenerate
    assign cout=c1[99];
endmodule
module bin_add(
    input a,b,cin,
    output sum,cout);
    assign sum=a^b^cin;
    assign cout=(a&b)|(a&cin)|(b&cin);
endmodule
