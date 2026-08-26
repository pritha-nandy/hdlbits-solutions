//hadd
module top_module( 
    input a, b,
    output cout, sum );
    assign sum=a^b;
    assign cout=a&b;

endmodule

//fadd
module top_module( 
    input a, b, cin,
    output cout, sum );
    assign sum=a^b^cin;
    assign cout=a&b|a&cin|b&cin;

endmodule

//adder3
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    fadd f1(a[0],b[0],cin,cout[0],sum[0]);
    fadd f2(a[1],b[1],cout[0],cout[1],sum[1]);
    fadd f3(a[2],b[2],cout[1],cout[2],sum[2]);

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum=a^b^cin;
    assign cout=a&b|a&cin|b&cin;

endmodule

//adder
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire a,b,c;
    fadd f1(x[0],y[0],1'bz,a,sum[0]);
    fadd f2(x[1],y[1],a,b,sum[1]);
    fadd f3(x[2],y[2],b,c,sum[2]);
    fadd f4(x[3],y[3],c,sum[4],sum[3]);
    

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum=a^b^cin;
    assign cout=a&b|a&cin|b&cin;

endmodule

//signed addition overflow
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    assign s=a+b;
    assign overflow=s[7]&(~a[7])&(~b[7])|~s[7]&a[7]&b[7];

endmodule

//adder100
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    genvar i;
    wire [100:0] carry;
    assign carry[0]=cin;
    generate for(i=0;i<100;i=i+1) begin:adder
        assign sum[i]=a[i]^b[i]^carry[i];
        assign carry[i+1]=a[i]&b[i]|b[i]&carry[i]|carry[i]&a[i];
    end
        assign cout=carry[100];
    endgenerate
    

endmodule

//bcdadd4
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire x,y,z;
    bcd_fadd f1(a[3:0],b[3:0],cin,x,sum[3:0]);
    bcd_fadd f2(a[7:4],b[7:4],x,y,sum[7:4]);
    bcd_fadd f3(a[11:8],b[11:8],y,z,sum[11:8]);
    bcd_fadd f4(a[15:12],b[15:12],z,cout,sum[15:12]);

endmodule

