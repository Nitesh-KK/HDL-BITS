module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0] cout;
    fa a1(.a(x[0]),.b(y[0]),.cin(),.cout(cout[0]),.sum(sum[0]));
    fa a2(.a(x[1]),.b(y[1]),.cin(cout[0]),.cout(cout[1]),.sum(sum[1]));
    fa a3(.a(x[2]),.b(y[2]),.cin(cout[1]),.cout(cout[2]),.sum(sum[2]));
    fa a4(.a(x[3]),.b(y[3]),.cin(cout[2]),.cout(sum[4]),.sum(sum[3]));
endmodule
module fa(
    input a,b,cin,
    output cout,sum
);
    assign sum=a^b^cin;
    assign cout=(a&b)|(a&cin)|(b&cin);
endmodule
