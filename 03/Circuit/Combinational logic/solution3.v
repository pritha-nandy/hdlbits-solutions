//kmap1
module top_module(
    input a,
    input b,
    input c,
    output out  );
    assign out=a|b|c;

endmodule

//kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~a & ~d) | (~b & ~c) | (a & c & d) | (b & c & d);

endmodule

//kmap3
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out=a&(~c)|(~b)&c|a&c;

endmodule

//kmap4
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    assign out=~(a^b^~(c^d)|~(a^b)^c^d);

endmodule

//min sop and pos*****
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
);

    assign out_sop = (~a & ~b & c) | (c & d);
    assign out_pos = c & (~a | d) & (~b | d);

endmodule

//kmap
module top_module (
    input [4:1] x, 
    output f );
    assign f=x[3]&~x[1]|x[3]&~x[2]|x[4]&x[2]|~x[4]&~x[2]|~x[3]&x[1]&x[2];

endmodule

//kmap
module top_module (
    input [4:1] x,
    output f
); 
    assign f=x[3]&~x[1]|~x[4]&~x[2]|x[3]&x[4]&x[2];

endmodule

//kmap with mux
module top_module (
    input c,
    input d,
    output [3:0] mux_in
);
    assign mux_in[0] = c | d;
    assign mux_in[1] = 1'b0;
    assign mux_in[2] = ~d;
    assign mux_in[3] = c & d;


endmodule
