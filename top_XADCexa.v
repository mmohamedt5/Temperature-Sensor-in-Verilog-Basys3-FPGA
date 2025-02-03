`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2020 10:26:56 AM
// Design Name: 
// Module Name: top
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

module top(
    input clk,
    input [7:0] JXADC,
    output [15:0] led,
    input [15:0] sw
);

    wire eoc; // xadc end of conversion flag
    wire [15:0] dout; // xadc data out bus
    wire drdy;
    wire [4 : 0] channel_out;
    
    reg [15:0] Output;

    xadc_wiz_0 myxadc (         
        .daddr_in       (channel_out), // channel address, provided by the module, I don't know why it wraps back externally.
        .dclk_in        (clk),
        .den_in         (eoc), // drp enable, start a new conversion whenever the last one has ended
        .di_in          (0),
        .dwe_in         (1'b0),    // input wire dwe_in
        .reset_in       (sw[15]),  // Connect Reset to Switch 15, this is optional but help you stop adc to see actual values
        .vauxp6         (JXADC[0]),
        .vauxn6         (JXADC[4]),
        .busy_out       (),
        .channel_out    (channel_out),
        .do_out         (dout), // data out
        .drdy_out       (drdy), // data ready
        .eoc_out        (eoc), // end of conversion
        .eos_out        (),
        .alarm_out      (),
        .vp_in          (0),
        .vn_in          (0)
    );

    always@(posedge drdy) begin // ADC only changes once every micro second (1 MHz),
                                // so we should use ADC complete rather than the
                                //  system clock (clk @ 100MHz)
        Output[15:0] <= dout; // Store in Output Register
    end
    
    assign led[15:0] = Output; // Attach Output to the BASYS3 LED array

endmodule
