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
module PipeEtoM(input logic clk, reset, RegWriteE, MemtoRegE, MemWriteE, 
                input logic [31:0] ALUOutE, WriteDataE, 
                input logic [4:0] WriteRegE,
  	            output logic RegWriteM, MemtoRegM, MemWriteM, 
  	            output logic [31:0] ALUOutM, WriteDataM, 
  	            output logic [4:0] WriteRegM);
  	            
                  always_ff@(posedge clk, posedge reset) begin
                        
                        if(reset) begin
                            RegWriteM <= 0;
                            MemtoRegM <= 0;
                            MemWriteM <= 0;
                            ALUOutM <= 0;
                            WriteDataM <= 0;
                            WriteRegM <= 0;
                        end
                        else begin
                            RegWriteM <= RegWriteE;
                            MemtoRegM <= MemtoRegE;
                            MemWriteM <= MemWriteE;
                            ALUOutM <= ALUOutE;
                            WriteDataM <= WriteDataE;
                            WriteRegM <= WriteRegE;
                                      
                        end
                  end
endmodule