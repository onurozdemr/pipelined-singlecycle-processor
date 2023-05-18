`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 10:11:56
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

module PipeMtoW(input logic clk, reset, RegWriteM, MemtoRegM, 
                input logic [31:0] ReadDataM, ALUOutM, 
                input logic [4:0] WriteRegM,
                output logic RegWriteW, MemtoRegW, 
                output logic [31:0] ReadDataW, ALUOutW, 
                output logic [4:0] WriteRegW);
                
                  
           always_ff@(posedge clk, posedge reset) begin
           
                  if(reset) begin
                  
                       RegWriteW <= 0;
                       MemtoRegW <= 0;
                       ReadDataW <= 0;
                       ALUOutW <= 0;               
                       WriteRegW <= 0;
                  
                  end
                  else begin
                  
                      RegWriteW <= RegWriteM;
                      MemtoRegW <= MemtoRegM;
                      ReadDataW <= ReadDataM;
                      ALUOutW <= ALUOutM;               
                      WriteRegW <= WriteRegM;

                  end
        end       
              
endmodule