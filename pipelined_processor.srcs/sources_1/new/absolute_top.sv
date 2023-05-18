`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 19:33:11
// Design Name: 
// Module Name: absolute_top
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


module absolute_top(input logic clk, push_clock, push_reset, switch_clear,
                    output logic RegWriteD, MemWriteD, RegWriteE, 
                    output logic [6:0]seg, logic dp,
                             output logic [3:0] an);
                    
     logic deb_clock, deb_reset;
     logic[31:0]  instrF;
     logic[31:0] PC;
     logic PcSrcD;
     logic MemToRegD, ALUSrcD, BranchD, RegDstD;
     logic [2:0]  alucontrol;
     logic [31:0] instrD;
     logic [31:0] ALUOutE, WriteDataE;
     logic [1:0] ForwardAE, ForwardBE;
     logic ForwardAD, ForwardBD, StallD, StallF;
     logic [4:0] WriteRegW, rsE, rtE, WriteRegE, WriteRegM;
     logic jr, MemtoRegM;
     logic [31:0] PCF, ALUOutM;
                 
     top_mips tm(deb_clock, deb_reset, instrF, PC, PCF,PcSrcD, MemWriteD, MemToRegD, ALUSrcD, BranchD, RegDstD, RegWriteD,
                    alucontrol, instrD, ALUOutE, WriteDataE,ForwardAE, ForwardBE, ForwardAD, ForwardBD, StallD, StallF,
                    WriteRegW, rsE, rtE, WriteRegE, WriteRegM, jr, MemtoRegM, RegWriteE);
                 
    pulse_controller pulse_one(clk, push_clock, switch_clear, deb_clock);               
                    
    pulse_controller pulse_two(clk, push_reset, switch_clear, deb_reset);   
    
    display_controller dc(clk, ALUOutE[7:4], ALUOutE[3:0], PCF[7:4], PCF[3:0], seg, dp, an);
                   
endmodule
