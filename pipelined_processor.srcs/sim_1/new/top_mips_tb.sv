`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 12:55:57
// Design Name: 
// Module Name: top_mips_tb
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


module top_mips_tb();

logic clk, reset;
logic[31:0]  instrF;
logic[31:0] PC, PCF;
logic PcSrcD;
logic MemWriteD, MemToRegD, ALUSrcD, BranchD, RegDstD, RegWriteD;
logic [2:0]  alucontrol;
logic [31:0] instrD;
logic [31:0] ALUOutE, WriteDataE;
logic [1:0] ForwardAE, ForwardBE;
logic ForwardAD, ForwardBD, StallD, StallF;
logic [4:0] WriteRegW, rsE, rtE, WriteRegE, WriteRegM;
logic jr, MemtoRegM, RegWriteE;
top_mips dut(clk, reset,instrF, PC, PCF, PcSrcD,MemWriteD, MemToRegD, ALUSrcD, BranchD, RegDstD, RegWriteD,
                alucontrol, instrD, ALUOutE, WriteDataE, ForwardAE, ForwardBE, ForwardAD, ForwardBD, StallD, StallF,
                WriteRegW, rsE, rtE, WriteRegE, WriteRegM, jr, MemtoRegM, RegWriteE);



always begin
#10 clk = ~clk;
end

initial begin
clk = 1; reset = 1; #20;
reset = 0;

end

endmodule
