//Tb/clock
module top_module ( );
    reg clk;
    dut d1(clk);
    initial
        begin
           clk=1'b0;
           forever #5 clk=~clk;
        end
    
                
        

endmodule

//TB/tb1*****
module top_module (output reg A, output reg B);

    initial begin
        A = 0;
        B = 0;

        #10 A = 1;
        #5  B = 1;
        #5  A = 0;
        #20 B = 0;
    end

endmodule

//Tb/and
module top_module();
    reg [1:0]in;
    reg out;
    andgate a1(in,out);
    initial begin
        in[0]=0;in[1]=0;
        #10 in[0]=1'b1;in[1]=1'b0;
        #10 in[1]=1'b1;in[0]=1'b0;
        #10 in[0]=1'b1;in[1]=1'b1;
        #10 in[0]=1'b1;in[1]=1'b1;
    end

endmodule

//Tb/tb2
module top_module();
    reg clk;
    reg in;
    reg [2:0]s;
    reg out;
    q7 a1(clk,in,s,out);
    initial begin
        clk=1'b0;in=1'b0;s=3'd2;
        forever #5 clk=~clk;
    end
    initial begin
        in=1'b0;s=3'd2;
        #10 s=3'd6;
        #10 in=1'b1;s=3'd2;
        #10 in=1'b0;s=3'd7;
        #10 in=1'b1;s=3'd0;
        #30 in=1'b0;s=3'd0;
    end

endmodule

//Tb/tff
module top_module ();
    reg clk,reset,t,q;
    tff t1(clk,reset,t,q);
    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end
    initial begin
        t=1'b0;reset=1'b1;
        #10 reset=1'b0;
        #10 t=1'b1;
    end
        
        

endmodule
