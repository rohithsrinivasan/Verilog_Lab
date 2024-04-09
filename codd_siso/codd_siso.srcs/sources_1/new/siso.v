`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 02:27:38 PM
// Design Name: 
// Module Name: siso
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


module siso (
  input din,
  input clk,
  input rst,
  output dout
);
  reg [3:0] s;

  always @(posedge clk) begin
    if (rst) begin
      s <= 4'b0;
    end else begin
      s[3] <= din;
      s[2] <= s[3];
      s[1] <= s[2];
      s[0] <= s[1];
    end
  end

  assign dout = s[0];
endmodule

