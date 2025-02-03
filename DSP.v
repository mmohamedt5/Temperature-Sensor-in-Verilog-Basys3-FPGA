`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 07:40:39 PM
// Design Name: 
// Module Name: DSP
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


module DSP(
input clk, 
input [15:0] dout,
output G2,
output [15:0] o
    );
     
reg [15:0] Output; 
reg[18:0] m0, m1, m2, m3, m4, m5, m6, m7;
reg myG = 0;
initial 
Output = 0;


   always@(posedge clk) begin // ADC only changes once every micro second (1 MHz),
      m7 <= m6;                          // so we should use ADC complete rather than the
      m6 <= m5;
      m5 <= m4;
      m4 <= m3;
      m3 <= m2;
      m2 <= m1;
      m1 <= m0;
      
      m0[15:0] <= dout;
      m0[18:16] <=0;               //  system clock (clk @ 100MHz)
        Output <= ((m0+m1+m2+m3+m4+m5+m6+m7  >>3)/65); // Store in Output Register temp in c

       //Output <= (((m0+m1+m2+m3+m4+m5+m6+m7  >>3)/65 )  - 500  ) /10;
       
    end 
    
    
assign o = Output;
assign G2 = myG;
endmodule
