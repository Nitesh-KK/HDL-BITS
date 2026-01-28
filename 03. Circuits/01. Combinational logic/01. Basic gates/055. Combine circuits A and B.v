module top_module (input x, input y, output z);
    wire w1,w2;
    assign w1=(x^y)&x;
    assign w2=~(x^y);
    assign z=((w1&w2)^(w1|w2));
endmodule
