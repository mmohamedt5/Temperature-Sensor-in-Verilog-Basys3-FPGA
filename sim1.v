`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 07:21:59 PM
// Design Name: 
// Module Name: sim1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim1();
    reg clk =0;
    reg [15:0] dout;
    wire G2;
    wire [15:0] o;
    
DSP Instance_1(
.clk(clk),
.dout(dout),
.o(o),
.G2(G2)
);


always #5 clk = ~clk ;
initial 
begin
dout = 0;
#50 
dout = 16'h0011;
#50 
dout = 16'h0021;
#50 
dout = 16'h90;
end
endmodule
