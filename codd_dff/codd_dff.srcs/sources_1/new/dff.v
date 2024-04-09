`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 05:10:44 PM
// Design Name: 
// Module Name: dff
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


module JKFlipFlop (
  input wire clk,     // Clock input
  input wire reset,   // Reset input
  input wire j,       // J input
  input wire k,       // K input
  output reg q        // Output
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 1'b0;
    else if (j && ~k)
      q <= 1'b1;
    else if (~j && k)
      q <= 1'b0;
  end

endmodule

