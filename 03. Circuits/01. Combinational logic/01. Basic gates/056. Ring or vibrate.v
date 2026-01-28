module top_module (
    input ring,
    input vibrate_mode,
    output ringer,      
    output motor        
);
    always @(*) begin
        if(ring & vibrate_mode==1)begin
            motor=1;
            ringer=0;
        end
        else begin
            ringer=ring;
            motor=0;
        end
    end
endmodule
