module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop=((d&c)|(~a&~b&c));
    assign out_pos=(c&(~b|d|~c)&(~a|d|~c));
endmodule
