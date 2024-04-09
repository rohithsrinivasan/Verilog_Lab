`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 11:04:50 AM
// Design Name: 
// Module Name: alu
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
module SimpleALU(
  input [7:0] operandA,
  input [7:0] operandB,
  input [2:0] opcode,
  output [7:0] outdata
);

  reg [7:0] result;
  assign outdata = result;
  
  always @(*) begin
    case (opcode)
      3'b000: result = operandA + operandB; // Addition
      3'b001: result = operandA - operandB; // Subtraction
      3'b010: result = operandA & operandB; // Bitwise AND
      3'b011: result = operandA | operandB; // Bitwise OR
      3'b100: result = operandA ^ operandB; // Bitwise XOR
      3'b101: result = operandA << operandB; // Left shift
      3'b110: result = operandA >> operandB; // Right shift
      3'b111: result = operandA; // Pass operandA
      default: result = 4'bx;
    endcase
  end
endmodule


