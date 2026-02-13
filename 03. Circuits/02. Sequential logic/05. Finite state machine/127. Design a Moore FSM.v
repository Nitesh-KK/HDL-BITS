module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] state,next_state;
    parameter a=2'd0,b=2'd1,c=2'd2,d=2'd3;
    always @(posedge clk) begin
        if(reset) begin
            fr3=1'b1;fr2=1'b1;fr1=1'b1;state=a;dfr=1'b1;
        end
        else begin
            next_state=state;
            case(s)
                3'b000: begin
                    fr1=1'b1;fr2=1'b1;fr3=1'b1;state=a;dfr=(next_state>state)?1'b1:((next_state==state)?dfr:1'b0);
                end
                3'b001: begin
                    fr1=1'b1;fr2=1'b1;fr3=1'b0;state=b;dfr=(next_state>state)?1'b1:((next_state==state)?dfr:1'b0);
                end
                3'b011: begin
                    fr1=1'b1;fr2=1'b0;fr3=1'b0;state=c;dfr=(next_state>state)?1'b1:((next_state==state)?dfr:1'b0);
                end
                3'b111: begin
                    fr1=1'b0;fr2=1'b0;fr3=1'b0;state=d;dfr=(next_state>state)?1'b1:((next_state==state)?dfr:1'b0);
                end
                default: begin
                    fr3=1'b1;fr2=1'b1;fr1=1'b1;state=a;dfr=1'b1;
                end
            endcase
        end
    end
endmodule
