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



// BranchD, instrD[25:21], instrD[20:16], RsE, RtE, WriteRegE, MemtoRegE, RegWriteE, WriteRegM,
  	              //MemtoRegM, RegWriteM, WriteRegW, RegWriteW,
  	              //StallF, StallD, ForwardAD, ForwardBD, FlushE, ForwardAE, ForwardBE



// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module HazardUnit( input logic BranchD, jr,
                   input logic [4:0] rsD, rtD, rsE, rtE, WriteRegE,
                   input logic MemtoRegE, RegWriteE,
                   input logic [4:0] WriteRegM,
                   input logic MemtoRegM, RegWriteM, 
                   input logic [4:0] WriteRegW,
                   input logic RegWriteW,
                   output logic StallF, StallD, ForwardAD, ForwardBD, FlushE,
                   output logic [1:0] ForwardAE, ForwardBE,
                   output logic ForwardJr
                 ); 
       
       logic lwstall, branchstall, jrstall;
            always_comb begin
              
                    if((rsE != 5'b00000) && (rsE == WriteRegM) && RegWriteM) begin
                        ForwardAE = 2'b10;
                    end
                    else if((rsE != 5'b00000) && (rsE == WriteRegW) && RegWriteW) begin
                        ForwardAE = 2'b01;
                    end
                    else begin
                        ForwardAE = 2'b00;
                    end
                    
                    
                    if((rtE != 5'b00000) && (rtE == WriteRegM) && RegWriteM) begin
                        ForwardBE = 2'b10;
                    end
                    else if((rtE != 5'b00000) && (rtE == WriteRegW) && RegWriteW) begin
                        ForwardBE = 2'b01;
                    end
                    else begin
                        ForwardBE = 2'b00;
                    end
                    
                    lwstall = ((rsD == rtE) || (rtD == rtE)) && MemtoRegE;
                    
                    ForwardAD = (rsD != 0) && (rsD == WriteRegM) && RegWriteM;
                    ForwardBD = (rtD != 0) && (rtD == WriteRegM) && RegWriteM;
                    
                    ForwardJr = (rsD != 0) && (rsD == WriteRegM) && RegWriteM;
                    
                    branchstall = (BranchD && RegWriteE && (WriteRegE == rsD || WriteRegE == rtD)) 
                                    || 
                                   (BranchD && MemtoRegM && (WriteRegM == rsD || WriteRegM == rtD));
                    
                    jrstall = (jr && RegWriteE && (WriteRegE == rsD)) || 
                              (jr && MemtoRegM && (WriteRegM == rsD));
                    
                    
                    
                    StallF = lwstall || branchstall || jrstall; 
                    StallD = lwstall || branchstall || jrstall; 
                    FlushE = lwstall || branchstall || jrstall; 
                    
            end
  
endmodule