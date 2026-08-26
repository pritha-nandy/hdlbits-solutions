//wire
module top_module (
    input in,
    output out);
    assign out=in;

endmodule

//gnd
module top_module (
    output out);
    assign out=1'b0;

endmodule

//nor
module top_module (
    input in1,
    input in2,
    output out);
    assign out=~(in1|in2);

endmodule

//another gate
module top_module (
    input in1,
    input in2,
    output out);
    assign out=in1&(~in2);

endmodule

//two gates
module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire x;
    assign x=~(in1^in2);
    assign out=x^in3;

endmodule

//gates
module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    assign out_and=a&b;
    assign out_or=a|b;
    assign out_xor=a^b;
    assign out_nand=~(a&b);
    assign out_nor=~(a|b);
    assign out_xnor=~(a^b);
    assign out_anotb=a&(~b);

endmodule

//7420
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    assign p1y=~(p1a&p1b&p1c&p1d);
    assign p2y=~(p2a&p2b&p2c&p2d);


endmodule

//truthtable 1
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    assign f=(~x3)&x2&(~x1)|(~x3)&x2&x1|x3&(~x2)&x1|x3&x2&x1;

endmodule

//two bit equality
module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z=(A==B)?1'b1:1'b0;

endmodule

//simple circuitA
module top_module (input x, input y, output z);
    assign z=(x^y)&x;

endmodule

//simple circuit B
module top_module ( input x, input y, output z );
    assign z=~(x^y);

endmodule

//combine circuit A and B
module top_module (input x, input y, output z);
    wire z1,z2,z3,z4;
    circuit_A c1(x,y,z1);
    circuit_A c2(x,y,z2);
    circuit_B c3(x,y,z3);
    circuit_B c4(x,y,z4);
    wire a,b;
    assign a=z1|z3;
    assign b=z2&z4;
    assign z=a^b;
    
    

endmodule
//simple circuit A
module circuit_A (input x, input y, output z);
    assign z=(x^y)&x;

endmodule

//simple circuit B
module circuit_B ( input x, input y, output z );
    assign z=~(x^y);

endmodule

// ringer
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign ringer= ring&~vibrate_mode;
    assign motor= ring&vibrate_mode;

endmodule

//thermostat*****
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
   assign heater = too_cold & mode;
assign aircon = too_hot & ~mode;
assign fan = heater | aircon | fan_on;

endmodule

//3bit population count*****
module top_module( 
    input [2:0] in,
    output [1:0] out );
    assign out=in[0]+in[1]+in[2];

endmodule

//gatesv
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    assign out_both={1'bz,in[3]&in[2],in[2]&in[1],in[1]&in[0]};
    assign out_any={in[3]|in[2],in[2]|in[1],in[1]|in[0]};
    assign out_different={in[3]^in[0],in[2]^in[3],in[1]^in[2],in[1]^in[0]};

endmodule

//gatesv100
module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    assign out_both={in[99:1]&in[98:0]};
    assign out_any={in[99:1]|in[98:0]};
    assign out_different={in[99]^in[0],in[99:1]^in[98:0]};

endmodule
