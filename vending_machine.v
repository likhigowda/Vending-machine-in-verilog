// verilog code
module vending_machine(clk,rst,in,out,change);
input clk;
input rst;
input [1:0]in;          // 00=0rs 01=5rs, 10=10rs
output reg out;
output reg[1:0] change;

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;

reg [1:0]c_state;
reg [1:0]n_state;

always @(posedge clk)
begin
    if(rst == 1)
    begin
        c_state = 2'b00;
        n_state = 2'b00;
        change = 2'b00;
    end
    
    else
    c_state = n_state;
    
    case(c_state)
        s0: // in this state machine has 0 rs
            if(in == 2'b00)
            begin
                n_state = s0;
                out = 0;
                change = 2'b00;
            end
            
            else if(in == 2'b01)
            begin
                n_state = s1;
                out = 0;
                change = 2'b00;
            end
            
            else if(in == 2'b10)
            begin
                n_state = s2;
                out = 0;
                change = 2'b00;
            end
            
        s1: // in this state machine has 5 rs (01)
            if(in == 2'b00)
            begin
                n_state = s0;
                out = 0;
                change = 2'b01; // change returned 5 rs
            end
            
            else if(in == 2'b01)
            begin
                n_state = s2;
                out = 0;
                change = 2'b00;
            end
            
            else if(in == 2'b10)
            begin
                n_state = s0;
                out = 1;  // return 1 bottle
                change = 2'b00;
            end
            
        s2: // in this state machine has 10 rs (10)
            if(in == 2'b00)
            begin
                n_state = s0;
                out = 0;
                change = 2'b10; // change returned 10 rs
            end
            
            else if(in == 2'b01)
            begin
                n_state = s0;
                out = 1;
                change = 2'b00;
            end
            
            else if(in == 2'b10)
            begin
                n_state = s0;
                out = 1;
                change = 2'b01; // change returned 5 rs and 1 bottle
            end
    endcase
end
endmodule