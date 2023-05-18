`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2023 10:11:56
// Design Name: 
// Module Name: imem
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

// External instruction memory used by MIPS
// processor. It models instruction memory as a stored-program 
// ROM, with address as input, and instruction as output
// Modify it to test your own programs.

module imem ( input logic [5:0] addr, output logic [31:0] instr);

// imem is modeled as a lookup table, a stored-program byte-addressable ROM
	always_comb
	   case ({addr,2'b00})		   	// word-aligned fetch
//
// 	***************************************************************************
//	Here, you can paste your own test cases that you prepared for the part 1-e.
//  An example test program is given below.        
//	***************************************************************************
//
//		address		instruction
//		-------		-----------
        8'h00: instr = 32'h20080004; // addi $t0, $zero, 0x4 / $t0 = 4
        8'h04: instr = 32'h20090004; // addi $t1, $zero, 0x4 / $t1 = 4
        8'h08: instr = 32'h11090002; // beq $t0, $t1, 0x2
        8'h0c: instr = 32'h00005820; // add $t3, $zero, $zero                                            
        8'h10: instr = 32'h00005820; // add $t3, $zero, $zero 
        8'h14: instr = 32'h212B0000; // addi $t3, $t1, 0x0
        8'h18: instr = 32'hAD680004; // sw $t0 0x4($t3)            
        8'h1c: instr = 32'h8D0A0004; // lw $t2 0x4($t0)
        8'h20: instr = 32'h01400008; // jr $t2 (0x4)
/*        8'h18: instr = 32'h014b5022;
        8'h1c: instr = 32'hac0a0070;
        8'h20: instr = 32'h8c080070;
        8'h24: instr = 32'h8d09006c;
        8'h28: instr = 32'h20080024; // addi $t0, $zero, 0x24
        8'h2c: instr = 32'hAC080014; // sw $t0, 0x14($zero)
        8'h30: instr = 32'h8C090014; // lw $t1 0x14($zero)
        8'h34: instr = 32'h01200008; // jr $t1, jumping to PC value 0x24
        8'h38: instr = 32'h20080000;
        8'h3c: instr = 32'h20080000; 
*/

       default:  instr = {32{1'bx}};	// unknown address
	   endcase
endmodule