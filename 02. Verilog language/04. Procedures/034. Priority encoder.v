module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
        casex(in)
            4'bxxx1: pos=2'h0;
            4'bxx10: pos=2'h1;
            4'bx100: pos=2'h2;
            4'b1000: pos=2'h3;
            default : pos=2'h0;
        endcase
    end
endmodule
