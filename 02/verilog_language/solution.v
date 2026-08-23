//simple wire
module top_module( input in, output out );
    assign out=in;

endmodule

//four wires
module top_module( 
    input a,b,c,
    output w,x,y,z );
    assign w=a;
    assign x=b;
    assign y=b;
    assign z=c;

endmodule

//inverter
module top_module( input in, output out );
    assign out=~in;

endmodule

//AND gate
module top_module( 
    input a, 
    input b, 
    output out );
    assign out=a&b;

endmodule

//NOR gate
module top_module( 
    input a, 
    input b, 
    output out );
    assign out=~(a|b);

endmodule

//XNOR gate
module top_module( 
    input a, 
    input b, 
    output out );
    assign out=~(a^b);

endmodule

//wire decl
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire x,y;
    assign x=a&b;
    assign y=c&d;
    assign out=x|y;
    assign out_n=~(x|y);

endmodule

//7458 chip
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire x,y,z,a;
    assign x=p2a&p2b;
    assign y=p2c&p2d;
    assign p2y=x|y;
    assign z=p1a&p1b&p1c;
    assign a=p1d&p1e&p1f;
    assign p1y=z|a;


endmodule
