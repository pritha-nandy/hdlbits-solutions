//alwaysblock1
// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    always @(*)
        begin
            out_alwaysblock=a&b;
        end
    assign out_assign=a&b;

endmodule

//alwaysblock2
// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    always @(*)
        begin
            out_always_comb=a^b;
        end
    always @(posedge clk)
        begin
            out_always_ff<=a^b;
        end
    assign out_assign=a^b;

endmodule

//always if
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   );
    assign out_assign=(sel_b1&sel_b2)?b:a;
    always @(*)
        begin
            case({sel_b1,sel_b2})
                2'b00: out_always<=a;
                2'b01:out_always<=a;
                2'b10:out_always<=a;
                2'b11:out_always<=b;
            endcase
        end

endmodule

//always if2
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
            shut_off_computer=0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving=0;
    end

endmodule

//always case
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            3'b000:out=data0;
            3'b001:out=data1;
            3'b010:out=data2;
            3'b011:out=data3;
            3'b100:out=data4;
            3'b101:out=data5;
            default:out=4'b0000;
        endcase
    end

endmodule

//always case2
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*)
        begin
            case(in)
                4'b0000:pos=2'd0;
                4'b0001:pos=2'd0;
                4'b0010:pos=2'd1;
                4'b0011:pos=2'd0;
                4'b0100:pos=2'd2;
                4'b0101:pos=2'd0;
                4'b0110:pos=2'd1;
                4'b0111:pos=2'd0;
                4'b1000:pos=2'd3;
                4'b1001:pos=2'd0;
                4'b1010:pos=2'd1;
                4'b1011:pos=2'd0;
                4'b1100:pos=2'd2;
                4'b1101:pos=2'd0;
                4'b1110:pos=2'd1;
                4'b1111:pos=2'd0;
                default:pos=2'b00;
            endcase
        end

endmodule

//always casez
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    always@(*)
        begin
            casez(in)
                8'b0000_0000:pos=3'd0;
                8'bzzzz_zzz1:pos=3'd0;
                8'bzzzz_zz1z:pos=3'd1;
                8'bzzzz_z1zz:pos=3'd2;
                8'bzzzz_1zzz:pos=3'd3;
                8'bzzz1_zzzz:pos=3'd4;
                8'bzz1z_zzzz:pos=3'd5;
                8'bz1zz_zzzz:pos=3'd6;
                8'b1zzz_zzzz:pos=3'd7;
                default:pos=3'd0;
            endcase
        end


endmodule

//always nolatches
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    always @(*)
        begin
            up=1'b0;down=1'b0;left=1'b0;right=1'b0;
            case(scancode)
                16'he06b:left=1'b1;
                16'he072:down=1'b1;
                16'he074:right=1'b1;
                16'he075:up=1'b1;
            endcase
        end

endmodule


