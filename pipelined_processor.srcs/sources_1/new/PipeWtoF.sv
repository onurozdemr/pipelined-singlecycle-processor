`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 10:18:16
// Design Name: 
// Module Name: 
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


// The pipe between Writeback (W) and Fetch (F) is given as follows.

module PipeWtoF(input logic[31:0] PC,
                input logic EN, clk, reset,		// ~StallF will be connected as this EN
                output logic[31:0] PCF);

                always_ff @(posedge clk, posedge reset) 
                    if(reset)
                        PCF <= 0;
                    else if(EN)
                        PCF <= PC;
                


endmodule
