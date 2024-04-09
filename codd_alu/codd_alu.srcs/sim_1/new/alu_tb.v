`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 11:17:57 AM
// Design Name: 
// Module Name: alu_tb
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

module SimpleALU_Testbench;

  reg [7:0] operandA;
  reg [7:0] operandB;
  reg [2:0] opcode;
  wire [7:0] outdata;
  integer i;
  
  SimpleALU dut (operandA, operandB, opcode, outdata);
  
  initial begin
    operandA = 4'b0101;
    operandB = 4'b1001;
    for (i = 0; i < 8; i = i + 1) begin
      #5; // Add the delay here to delay each iteration
      opcode = i;
    end
    $finish;
  end
  
endmodule




