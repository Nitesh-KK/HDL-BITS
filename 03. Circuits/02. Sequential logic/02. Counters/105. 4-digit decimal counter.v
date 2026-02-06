module top_module (
    input clk,
    input reset, 
    output [3:1] ena,
    output [15:0] q);
    bcd_counter m1(.reset(reset),.clk(clk),.ena(1'd1),.q(q[3:0]));
    genvar i;
    generate
        for(i=1;i<=3;i++) begin: bcd_add
            bcd_counter m2(.reset(reset),.clk(clk),.ena(ena[i]),.q(q[4*i+3:4*i]));
        end
    endgenerate
    assign ena[1]=(q[3:0]==9);
    assign ena[2]=(q[7:4]==9)&(q[3:0]==9);
    assign ena[3]=(q[11:8]==9)&(q[7:4]==9)&(q[3:0]==9);
endmodule
module bcd_counter(
    input reset,clk,ena,
    output [3:0]q
);
    always@(posedge clk) begin
        if(reset)
            q<=0;
        else
            begin
                if(ena)
                    if(q==4'd9)
                        q<=0;
                else
                    q<=q+4'd1;
            end
        end
endmodule
