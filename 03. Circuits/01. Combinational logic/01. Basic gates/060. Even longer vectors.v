module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    always @(*) begin
        for(integer i=0;i<99;i++) 
            out_both[i]=(in[i]&in[i+1]);
        for(integer j=1;j<100;j++)
            out_any[j]=(in[j]|in[j-1]);
        for(integer k=0;k<99;k++)
            out_different[k]=(in[k]^in[k+1]);
        out_different[99]=in[99]^in[0];
    end
endmodule
