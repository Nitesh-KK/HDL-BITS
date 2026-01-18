`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire a1,b1;
    assign a1=a&b,b1=c&d;
    assign out=a1|b1,out_n=~out;

endmodule
