`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 09:25:56 AM
// Design Name: 
// Module Name: sipo
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


module sipo (
  input din,
  input clk,
  input rst,
  output reg [3:0] dout
);
  always @(posedge clk) begin
    if (rst)
      dout <= 4'b0;
    else begin
      dout[3] <= din;
      dout[2] <= dout[3];
      dout[1] <= dout[2];
      dout[0] <= dout[1];
    end
  end
endmodule

