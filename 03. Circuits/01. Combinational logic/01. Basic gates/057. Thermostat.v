module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always @(*) begin
        if(mode & too_cold) begin
            heater=1;
            aircon=0;
        end
        else if(mode ==0 & too_hot ==1) begin
            aircon=1;
            heater=0;
        end
        else begin
            aircon=0;
            heater=0;
        end
        if(heater | aircon | fan_on)
            fan=1;
        else 
            fan=0;
    end
endmodule
