module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [1:0] state,next_state;
    parameter a=2'b00,b=2'b01,c=2'b10,d=2'b11;
    always @(*) begin
        case (state)
            a:next_state=in?b:a;
            b:next_state=in?b:c;
            c:next_state=in?d:a;
            d:next_state=in?b:c;
        endcase
    end
    always @(posedge clk or posedge areset) begin
        if(areset) state<=a;
        else state<=next_state;
    end
    assign out=(state==d)?1'b1:1'b0;

endmodule
