`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 09:51:46 AM
// Design Name: 
// Module Name: pipo
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


module pipo (
  input [3:0] din,
  input clk,
  input rst,
  input load,
  output [3:0] dout
);
  reg [3:0] temp;
  
  always @(posedge clk) begin
    if (rst)
      temp <= 4'b0;
    else if (load)
      temp <= din;
  end

  assign dout = temp;
endmodule

