`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 09:33:28 AM
// Design Name: 
// Module Name: piso
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

module piso (
  input [3:0] din,
  input clk,
  input rst,
  input load,
  output reg dout,
  reg [3:0] temp
);

  always @(posedge clk) begin
    if (rst)
      temp <= 1'b0;
    else if (load)
      temp <= din;
    else begin
      dout <= temp[3];
      temp <= {temp[2:0], 1'b0};
    end
  end
endmodule


