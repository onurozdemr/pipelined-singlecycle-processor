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


module PipeFtoD(input logic[31:0] instr, PcPlus4F,
                input logic EN, clear, clk, reset,
                output logic[31:0] instrD, PcPlus4D);

       
       always_ff@(posedge clk, posedge reset) begin
       
              if(reset) begin
                    instrD <= 0;
                    PcPlus4D <= 0;
              end
              else if (EN == 0)begin
                instrD <= instrD;
                PcPlus4D <= PcPlus4D;
              
              end
              else begin // priority on stall
                   
                   if(clear) begin
                       instrD <= 0;
                       PcPlus4D <= 0;
                   end
                   else begin
                       instrD <= instr;
                       PcPlus4D <= PcPlus4F;  
                   end  
              end
       end
           
endmodule
