//simple fsm1(async)
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            A:next_state<=in?A:B;
            B:next_state<=in?B:A;
        endcase
            
            
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset) state<=B;
        else
            state<=next_state;
            
    end

    // Output logic
    // assign out = (state == ...);
            assign out = (state==B);

endmodule

//simple fsm1(sync)
module top_module(clk, reset, in, out);
    input clk;
    input reset;
    input in;
    output out;
    reg out;

    parameter A = 0, B = 1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin
            present_state <= B;
            out<=1'b1;
        end else begin

            case (present_state)
                A: next_state = in ? A : B;
                B: next_state = in ? B : A;
            endcase

            present_state <= next_state;

            case (next_state)
                A: out <= 1'b0;
                B: out <= 1'b1;
            endcase

        end
    end

endmodule

//simple fsm 2(async)
module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
           OFF:next_state<=j?ON:OFF;
           ON:next_state<=k?OFF:ON;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=OFF;
        else
            state<=next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out=(state==ON);

endmodule

//simple fsm2 sync
module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF:next_state<=j?ON:OFF;
            ON:next_state<=k?OFF:ON;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset) state<=OFF;
        else
            state<=next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out=(state==ON);

endmodule

//fsm3comb
module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;
    
    always@(*)
        begin
            case(state)
                2'b00:next_state<=in?B:A;
                2'b01:next_state<=in?B:C;
                2'b10:next_state<=in?D:A;
                2'b11:next_state<=in?B:C;
            endcase
        end
    
    assign out=(state==D);
  
//one hot encoding
  module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (~in)& state[A]|(~in)& state[C];
    assign next_state[B] = in& state[A]|in& state[B]|in& state[D];
    assign next_state[C] = (~in)& state[B]|(~in)& state[D];
    assign next_state[D] = in &state[C];

    // Output logic: 
    assign out = state[D];

endmodule

  //fsm3
  module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter A=0, B=1, C=2, D=3;
    reg [1:0]state,next_state;
    
    always@(*)
        begin
            case(state)
                2'b00:next_state<=in?B:A;
                2'b01:next_state<=in?B:C;
                2'b10:next_state<=in?D:A;
                2'b11:next_state<=in?B:C;
            endcase
        end
    always @(posedge clk, posedge areset)
        begin
            if(areset) begin
                state<=A; 
            end
            else begin
                state<=next_state;
            end
        end
    assign out=(state==D);
    
    

endmodule

//lemmings1
  module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    reg state, next_state;
    parameter LEFT=0,RIGHT=1;

    always @(*) begin
        // State transition logic
        case(state)
           LEFT:next_state<=bump_left?RIGHT:LEFT;
           RIGHT:next_state<=bump_right?LEFT:RIGHT;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) state<=LEFT;
        else
            state<=next_state;
    end

    // Output logic
    // assign walk_left = (state == ...);
    // assign walk_right = (state == ...);
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule

  

















