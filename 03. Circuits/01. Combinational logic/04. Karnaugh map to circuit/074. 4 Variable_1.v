module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out=((~b&~c)|(b&c&d)|(a&c&d)|(~a&~d));
endmodule
