//module
module top_module ( input a, input b, output out );
    mod_a instance1(a,b,out);

endmodule

//module pos
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1(out1,out2,a,b,c,d);

endmodule

//module name ****
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1(.in1(a),.in2(b),.in3(c),.in4(d),.out1(out1),.out2(out2));
   

endmodule

//module shift
module top_module ( input clk, input d, output q );
    wire x,y;
    my_dff d1(clk,d,x);
    my_dff d2(clk,x,y);
    my_dff d3(clk,y,q);
    

endmodule

//module shift8
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0]x,y,z;
    my_dff8 d1(clk,d,x);
    my_dff8 d2(clk,x,y);
    my_dff8 d3(clk,y,z);
    always @(*)
        begin
            case(sel)
                2'b00:q=d;
                2'b01:q=x;
                2'b10:q=y;
                2'b11:q=z;
            endcase
        end
endmodule

//module add
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],cout);
    add16 a2(a[31:16],b[31:16],cout,sum[31:16],);

endmodule

//module fadd
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],cout);
    add16 a2(a[31:16],b[31:16],cout,sum[31:16],);
    

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum=a^b^cin;
    assign cout=a&b|b&cin|a&cin;
 
endmodule

//module cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [31:16]sum0,sum1;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],cout);
    add16 a2(a[31:16],b[31:16],1'b0,sum0[31:16],);
    add16 a3(a[31:16],b[31:16],1'b1,sum1[31:16],);
    always @(*)
        begin
            case(cout)
                1'b0:sum[31:16]=sum0[31:16];
                1'b1:sum[31:16]=sum1[31:16];
            endcase
        end
   

endmodule

//module addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]z;
    wire cout;
    assign z=b^{32{sub}};
    add16 a1(a[15:0],z[15:0],sub,sum[15:0],cout);
    add16 a2(a[31:16],z[31:16],cout,sum[31:16],);
