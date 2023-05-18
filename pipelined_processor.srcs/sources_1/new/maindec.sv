`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 10:16:03
// Design Name: 
// Module Name: maindec
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


module maindec (input logic[5:0] op, 
	              output logic memtoreg, memwrite, branch,
	              output logic alusrc, regdst, regwrite,
	              output logic[1:0] aluop );
  logic [7:0] controls;

   assign {regwrite, regdst, alusrc, branch, memwrite,
                memtoreg,  aluop} = controls;

  always_comb
    case(op)
      6'b000000: controls <= 8'b11000010; // R-type
      6'b100011: controls <= 8'b10100100; // LW
      6'b101011: controls <= 8'b00101000; // SW
      6'b000100: controls <= 8'b00010001; // BEQ
      6'b001000: controls <= 8'b10100000; // ADDI
      default:   controls <= 8'bxxxxxxxx; // illegal op
    endcase
endmodule
