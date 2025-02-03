# Temperature Sensor using a Basys3 FPGA written in Verilog # 

## DSP.V ## 
This file includes a running average for the temperature readings coming in from the sensor

## top_XADCexa.v ##
This file is like the main file that brings all the different source files together such as the DSP and the XADC. 
* Tthe XADC is a wizard tool that comes with the Basys3 FPGA Board.

## Basys3_Master_XADCexa.xdc ##
This is the constraints file for the Basys3 FPGA Board that maps the input and outputs to the verilog source files as well as the adc.

