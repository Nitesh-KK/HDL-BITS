module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk) begin
        case(L)
            1'b0: Q<=E?w:Q;
            1'b1: Q<=R;
        endcase
    end
endmodule
