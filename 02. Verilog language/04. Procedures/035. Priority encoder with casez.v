module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    always @(*) begin
        casez(in)
            8'b zzzzzzz1 : pos=3'h0;
            8'b zzzzzz1z : pos=3'h1;
            8'b zzzzz1zz : pos=3'h2;
            8'b zzzz1zzz : pos=3'h3;
            8'b zzz1zzzz : pos=3'h4;
            8'b zz1zzzzz : pos=3'h5;
            8'b z1zzzzzz : pos=3'h6;
            8'b 1zzzzzzz : pos=3'h7;
            default : pos=3'h0;
        endcase
    end
endmodule
