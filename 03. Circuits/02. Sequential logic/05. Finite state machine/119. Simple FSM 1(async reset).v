module top_module(
    input clk,
    input areset,
    input in,
    output out);
    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(*) begin 
        case(state)
            B:next_state=in?B:A;
            A:next_state=in?A:B;
        endcase
    end
    always @(posedge clk, posedge areset) begin 
        if(areset) state<=B;
        else state<=next_state;
    end
    assign out=(state==B)?1'b1:1'b0;
endmodule
