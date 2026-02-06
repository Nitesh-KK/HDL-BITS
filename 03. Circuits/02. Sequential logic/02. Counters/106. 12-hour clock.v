module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    reg [3:0] ss_ones,ss_tens;
    reg [3:0] mm_ones,mm_tens;
    reg [3:0] hh_ones,hh_tens;
    
    always @(posedge clk) begin
        if(reset) begin
            ss_ones<=0;
            ss_tens<=0;
        end
        else if(ena) begin
            if(ss_ones==9) begin
                ss_ones<=0;
                if(ss_tens==5) ss_tens<=0;
                else ss_tens<=ss_tens+1;
            end
            else ss_ones<=ss_ones+1;
        end
    end
    always @(posedge clk) begin
        if(reset) begin
            mm_ones<=0;
            mm_tens<=0;
        end
        else if(ena && ss_ones==9 && ss_tens==5 ) begin
            if(mm_ones==9) begin
                mm_ones<=0;
                if(mm_tens==5) mm_tens<=0;
                else mm_tens<=mm_tens+1;
            end
            else mm_ones<=mm_ones+1;
        end
    end
    always @(posedge clk) begin
        if(reset) begin
            hh_ones<=2;
            hh_tens<=1;
            pm<=0;
        end
        else if(ena && mm_tens==5 && mm_ones==9 && ss_tens==5 && ss_ones==9) begin
            if(hh_tens==1 && hh_ones==1) begin
                hh_ones<=hh_ones+1;
                pm<=~pm;
            end
            else if(hh_tens==1 && hh_ones==2) begin
                hh_tens<=0;
                hh_ones<=1;
            end
            else if(hh_ones==9) begin
                hh_ones<=0;
                hh_tens<=1;
            end
            else hh_ones<=hh_ones+1;
        end
    end
    always @(*) begin
        hh={hh_tens,hh_ones};
        mm={mm_tens,mm_ones};
        ss={ss_tens,ss_ones};
    end
endmodule
