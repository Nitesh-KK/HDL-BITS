module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire w1,w2,w3,w4;
    assign w1=(a<b & a<c & a<d)?1'b1:1'b0;
    assign w2=(b<c & b<d & b<a)?1'b1:1'b0;
    assign w3=(c<d & c<a & c<b)?1'b1:1'b0;
    assign w4=(d<c & d<b & d<a)?1'b1:1'b0;
    assign min=w1?a:(w2?b:(w3?c:d));
endmodule
