module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter left=1'b0,right=1'b1;
    reg state, next_state;

    always @(*) begin
        case(state)
            1'b0: next_state<=bump_left?right:left;
            1'b1: next_state<=bump_right?left:right;
            default next_state<=bump_left?right:left;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state<=left;
        else state<=next_state;
    end
    assign walk_left=(state==left)?1'b1:1'b0;
    assign walk_right=(state==right)?1'b1:1'b0;

endmodule
