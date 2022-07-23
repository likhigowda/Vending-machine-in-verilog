// Testbench
module vending_machine_test;
reg clk;
reg rst;
reg [1:0]in;

wire out;
wire [1:0]change;

vending_machine uut (clk,rst,in,out,change);

initial
begin
  	$dumpfile("dump.vcd"); $dumpvars;
    rst = 1;
    clk = 0;
    
    #6 rst = 0 ; in = 2'b10;
    #19 in = 2'b00;
    #25 $finish;
end
always #5 clk = ~clk;
endmodule