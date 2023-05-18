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

// paramaterized 4-to-1 MUX
module mux4 #(parameter WIDTH = 32)
             (input  logic[WIDTH-1:0] d0, d1, d2, d3,
              input  logic[1:0] s, 
              output logic[WIDTH-1:0] y);
  
   assign y = s[1] ? ( s[0] ? d3 : d2 ) : (s[0] ? d1 : d0); 
endmodule