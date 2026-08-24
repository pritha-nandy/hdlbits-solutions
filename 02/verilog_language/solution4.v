//conditional****
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]in1,in2;

    // assign intermediate_result1 = compare? true: false;
    assign in1=(a<b)?a:b;
    assign in2=(c<d)?c:d;
    assign min=(in1<in2)?in1:in2;

endmodule

//reduction
module top_module (
    input [7:0] in,
    output parity);
    assign parity=^in;

endmodule

//gates100
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    assign out_and=&in;
    assign out_or=|in;
    assign out_xor=^in;

endmodule

//vector100r
module top_module( 
    input [99:0] in,
    output [99:0] out
);
    always@(*)
        begin
            for(int i=0;i<100;i=i+1) begin
                out[99-i]<=in[i];
            end
        end

endmodule

//popcount255******
module top_module( 
    input [254:0] in,
    output [7:0] out
);

    reg [7:0] popcount;

    always @(*) begin
        popcount = 0;

        for (int i = 0; i < 255; i = i + 1) begin
            popcount = popcount + in[i];
        end
    end

    assign out = popcount;

endmodule

//adder100i*****
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    reg carry[100:0];
    assign carry[0]=cin;
    always @(*)
        begin
            for(int i=0;i<100;i=i+1) begin
                sum[i]=a[i]^b[i]^carry[i];
                carry[i+1]=a[i]&b[i]|b[i]&carry[i]|a[i]&carry[i];
                cout[i]=carry[i+1];
            end
        end
    
endmodule

//bcdadd100*****
module top_module(
    input [399:0] a,
    input [399:0] b,
    input cin,
    output [399:0] sum,
    output cout
);

    wire [100:0] carry;
    assign carry[0] = cin;

    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_digits
            bcd_fadd fadd (
                .a(a[i*4 +: 4]),
                .b(b[i*4 +: 4]),
                .cin(carry[i]),
                .cout(carry[i+1]),
                .sum(sum[i*4 +: 4])
            );
        end
    endgenerate

    assign cout = carry[100];

endmodule
