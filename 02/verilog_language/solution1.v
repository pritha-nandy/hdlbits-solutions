//vector0
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  );
    // Module body starts after module declaration
    assign outv=vec;
    assign o2=vec[2];
    assign o1=vec[1];
    assign o0=vec[0];

endmodule

//vector1
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_lo=in[7:0];
    assign out_hi=in[15:8];

endmodule

//vector2
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
    assign out={in[7:0],in[15:8],in[23:16],in[31:24]};
    

endmodule

//vectorgates
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise=a|b;
    assign out_or_logical=a||b;
    assign out_not={~b[2],~b[1],~b[0],~a[2],~a[1],~a[0]};

endmodule

//gates4
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and=&in;
    assign out_or=|in;
    assign out_xor=^in;

endmodule

//vector3
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    assign w={a,b[4:2]};
    assign x={b[1:0],c,d[4]};
    assign y={d[3:0],e[4:1]};
    assign z={e[0],f,1'b1,1'b1};

endmodule

//vector reversal
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out={in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

endmodule

//vector4
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out={{24{in[7]}},in[7:0]};

endmodule

//vector5
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    assign out=~{{5{a,b,c,d,e}}}^{{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}};

endmodule
