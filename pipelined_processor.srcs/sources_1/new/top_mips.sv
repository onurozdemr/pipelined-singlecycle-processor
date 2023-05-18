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
// You can add some more logic variables for testing purposes
// but you cannot remove existing variables as we need you to output 
// these values on the waveform for grading
module top_mips (input  logic clk, reset,
             output  logic[31:0]  instrF,
             output logic[31:0] PC, PCF,
             output logic PcSrcD,
             output logic MemWriteD, MemToRegD, ALUSrcD, BranchD, RegDstD, RegWriteD,
             output logic [2:0]  alucontrol,
             output logic [31:0] instrD, 
             output logic [31:0] ALUOutE, WriteDataE,
             output logic [1:0] ForwardAE, ForwardBE,
                 output logic ForwardAD, ForwardBD, StallD, StallF,
                 output logic [4:0] WriteRegW, rsE, rtE, WriteRegE, WriteRegM,
                 output logic jr, MemtoRegM, RegWriteE);


    controller CU(reset, instrD[31:26], instrD[5:0], MemToRegD, MemWriteD, ALUSrcD, RegDstD, RegWriteD, alucontrol, BranchD, jr);
    
    datapath DP(clk, reset, alucontrol, RegWriteD, MemToRegD, MemWriteD, ALUSrcD, RegDstD, BranchD, jr,
        instrF, instrD, 
        PC, PCF, PcSrcD,
        ALUOutE, WriteDataE, 
        ForwardAE, ForwardBE, ForwardAD, ForwardBD, StallD, StallF, WriteRegW, rsE, rtE, WriteRegE, WriteRegM, MemtoRegM, RegWriteE); // Add or remove input-outputs as necessary
  
  
  
endmodule