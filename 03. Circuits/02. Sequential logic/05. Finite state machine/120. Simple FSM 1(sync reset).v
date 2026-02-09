module top_module(clk, reset, in, out);
    input clk;
    input reset; 
    input in;
    output out;  
    reg out;
    parameter A=1'b0,B=1'b1;
    reg state, next_state;
    always @(posedge clk) begin
        if (reset) state<=B;
        else state<=next_state;
    end
    always @(*) begin
        case(state)
            A:begin next_state=in?A:B;out=1'b0;end
            B:begin next_state=in?B:A;out=1'b1; end
        endcase
    end

endmodule
