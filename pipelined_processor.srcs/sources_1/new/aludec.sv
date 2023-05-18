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

module aludec (input logic reset,
               input    logic[5:0] funct,
               input    logic[1:0] aluop,
               output   logic[2:0] alucontrol, output logic jr);
               
             
  always_comb begin
    
    if(reset) begin
        jr = 0;
    end
    
    case(aluop)
      2'b00: begin alucontrol  = 3'b010; jr = 0; end  // add  (for lw/sw/addi)
      2'b01: begin alucontrol  = 3'b110;  jr = 0; end// sub   (for beq)
      default: case(funct)          // R-TYPE instructions
          6'b100000: begin 
          alucontrol  = 3'b010;
          jr = 0; 
          end // ADD
          6'b100010: begin 
          alucontrol  = 3'b110; // SUB
          jr = 0;
          end
          6'b100100: begin 
          alucontrol  = 3'b000; // AND
          jr = 0;
          end
          6'b100101: begin 
          alucontrol  = 3'b001; // OR
          jr = 0;
          end
          6'b101010: begin 
          alucontrol  = 3'b111; // SLT
          jr = 0;
          end
          6'b001000:  begin  // JR
          alucontrol = 3'bxxx;
          jr = 1;
          end
          default:   begin alucontrol  = 3'bxxx; jr = 0; end // ???
        endcase
    endcase
    end
    
    
endmodule