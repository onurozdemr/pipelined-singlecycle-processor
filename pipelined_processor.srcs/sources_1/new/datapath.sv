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

// *******************************************************************************
// End of the individual pipe definitions.
// ******************************************************************************

// *******************************************************************************
// Below is the definition of the datapath.
// The signature of the module is given. The datapath will include (not limited to) the following items:
//  (1) Adder that adds 4 to PC
//  (2) Shifter that shifts SignImmD to left by 2
//  (3) Sign extender and Register file
//  (4) PipeFtoD
//  (5) PipeDtoE and ALU
//  (5) Adder for PcBranchD
//  (6) PipeEtoM and Data Memory
//  (7) PipeMtoW
//  (8) Many muxes
//  (9) Hazard unit
//  ...?
// *******************************************************************************

module datapath (input  logic clk, reset,
                input  logic[2:0]  ALUControlD,
                input logic RegWriteD, MemToRegD, MemWriteD, ALUSrcD, RegDstD, BranchD, jr,
                 output logic [31:0] instrF,		
                 output logic [31:0] instrD, PC, PCF,
                output logic PcSrcD,                 
                output logic [31:0] ALUOutE, WriteDataE,
                output logic [1:0] ForwardAE, ForwardBE,
                 output logic ForwardAD, ForwardBD, 
                 output logic StallD, StallF,
                 output logic [4:0] WriteRegW, RsE, RtE, WriteRegE, WriteRegM,
                 output logic MemtoRegM, RegWriteE); 
                                // STALL SIGNALS AS OUTPUT TO OBSERVE

  
  	//* We have defined a few wires for you
    logic [31:0] PcSrcA, PcSrcB, PcBranchD, PcPlus4F;	
  	logic [31:0] SignImmD, ShiftedImmD;
  	logic [31:0] ResultW;
  	//logic [4:0] WriteRegW;
  	logic [31:0] RD1, RD2;
  	logic [31:0] SrcBE;
  	logic [31:0] ReadDataM;
  
	//* You should define others down below (you might want to rename some of the wires above while implementing the pipeline)
  
  	//* We have provided you with a single-cycle datapath
  	//* You should convert it to a pipelined datapath, changing the connections between modules as necessary
    
    
    logic FlushE; // STALLING SIGNALS NEW ADDED
    
  	// Replace with PipeWtoF
    PipeWtoF WtoF(PC, ~StallF, clk, reset, PCF);  // ~StallF will be connected as this EN

    logic [31:0] PCA;
    logic [31:0] jrAddress;
  	// Do some operations
    assign PcPlus4F = PCF + 4;
    assign PcSrcB = PcBranchD;
	assign PcSrcA = PcPlus4F;
  	mux2 #(32) pc_mux(PcSrcA, PcSrcB, PcSrcD, PCA);
  	mux2 #(32) jr_mux(PCA, jrAddress, jr, PC);

    imem im1(PCF[7:2], instrF);
    
    logic[31:0] PcPlus4D;
  	// Replace the code below with PipeFtoD
  	logic FlushD;
  	PipeFtoD FtoD(instrF, PcPlus4F, ~StallD, FlushD, clk, reset, instrD, PcPlus4D);
  
  	// Decode stage
  	logic RegWriteW;
  	regfile rf(clk, reset, RegWriteW, instrD[25:21], instrD[20:16], WriteRegW, ResultW, RD1, RD2);
  	signext se(instrD[15:0], SignImmD);
  	
  	sl2 shiftimm(SignImmD, ShiftedImmD);
  	adder branchadd(PcPlus4D, ShiftedImmD, PcBranchD);
  	
  	logic [31:0] eqInputA, eqInputB;
  	
    logic [31:0] ALUOutM;
  	mux2 #(32) eqA(RD1, ALUOutM, ForwardAD, eqInputA);
  	mux2 #(32) eqB(RD2, ALUOutM, ForwardBD, eqInputB);
  	logic ForwardJr;
  	mux2 #(32) jrValue(RD1, ALUOutM, ForwardJr, jrAddress);
  	
  	assign PcSrcD = BranchD & (eqInputA == eqInputB); 
    assign FlushD = PcSrcD || jr;
    // D TO E PIPE HERE
    logic [31:0]  RsData, RtData, SignImmE;
    //logic[4:0] RsE, RtE, RdE;
    logic[4:0] RdE;
    //logic RegWriteE; 
    logic MemtoRegE, ALUSrcE, RegDstE;
    logic[2:0] ALUControlE;
    
    
    logic MemWriteE;
  	PipeDtoE DtoE(RD1, RD2, SignImmD,
                      instrD[25:21], instrD[20:16], instrD[15:11],
                      RegWriteD, MemToRegD, MemWriteD, ALUSrcD, RegDstD,
                      ALUControlD,
                      FlushE, clk, reset,
                      RsData, RtData, SignImmE,
                      RsE, RtE, RdE, 
                      RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE,
                      ALUControlE);
  
  	// Execute stage
  	logic [31:0] empty, SrcAE;
  	mux4 #(32) srcA(RsData, ResultW, ALUOutM, empty, ForwardAE, SrcAE);
  	mux4 #(32) srcB(RtData, ResultW, ALUOutM, empty, ForwardBE, WriteDataE);
  	
  	
  	mux2 #(32) srcBMux(WriteDataE, SignImmE, ALUSrcE, SrcBE);
  	alu alu(SrcAE, SrcBE, ALUControlE, ALUOutE);
  	
  	//logic [4:0] WriteRegE;
  	mux2 #(5) wrMux(RtE, RdE, RegDstE, WriteRegE);
    
    
    
  	// Replace the code below with PipeEtoM
  	logic RegWriteM, MemWriteM;
  	logic [31:0] WriteDataM; 
  	//logic [4:0] WriteRegM;
  	PipeEtoM EtoM(clk, reset, RegWriteE, MemtoRegE, MemWriteE, ALUOutE, WriteDataE, WriteRegE,
  	              RegWriteM, MemtoRegM, MemWriteM, ALUOutM, WriteDataM, WriteRegM);
  
  	// Memory stage
  	dmem DM(clk, MemWriteM, ALUOutM, WriteDataM, ReadDataM);

  	// Instantiate PipeMtoW
  	logic MemtoRegW;
  	logic [31:0] ReadDataW, ALUOutW;
  	PipeMtoW MtoW(clk, reset, RegWriteM, MemtoRegM, ReadDataM, ALUOutM, WriteRegM,
  	               RegWriteW, MemtoRegW, ReadDataW, ALUOutW, WriteRegW);
    
  	// Writeback stage
  	mux2 #(32) wbmux(ALUOutW, ReadDataW, MemtoRegW, ResultW);
  	
  	// Replace the code below with HazardUnit
  	HazardUnit hu(BranchD, jr, instrD[25:21], instrD[20:16], RsE, RtE, WriteRegE, MemtoRegE, RegWriteE, WriteRegM,
  	              MemtoRegM, RegWriteM, WriteRegW, RegWriteW,
  	              StallF, StallD, ForwardAD, ForwardBD, FlushE, ForwardAE, ForwardBE, ForwardJr);

endmodule