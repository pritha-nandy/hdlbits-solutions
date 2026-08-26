//mux2to1
module top_module( 
    input a, b, sel,
    output out );
    assign out=sel?b:a;

endmodule

//mux2to1v
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    assign out=sel?b:a;

endmodule

//mux9to1v
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    always @(*)
   			 case(sel)
        			4'b0000:out=a;
        			4'b0001:out=b;
        			4'b0010:out=c;
        			4'b0011:out=d;
        			4'b0100:out=e;
        			4'b0101:out=f;
        			4'b0110:out=g;
        			4'b0111:out=h;
        			4'b1000:out=i;
        			default:out=16'hffff;
        	     
              endcase
        

endmodule

//mux256to1*****
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    assign out=in[sel];

endmodule

//mux256to1v*****
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    assign out=in[sel*4+:4];

endmodule
