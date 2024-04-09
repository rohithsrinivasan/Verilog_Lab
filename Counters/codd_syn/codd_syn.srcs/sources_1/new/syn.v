`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:14:49 AM
// Design Name: 
// Module Name: syn
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


module synchronous_counter (
  input wire clk,
  input wire reset,
  output reg [3:0] count
);
  always @(posedge clk) begin
    if (reset)
      count <= 4'b0;
    else
      count <= count + 1;
  end
endmodule

