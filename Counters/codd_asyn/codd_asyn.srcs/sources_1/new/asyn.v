`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 09:03:00 PM
// Design Name: 
// Module Name: asyn
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


module dff (
  input wire clk,
  input wire d,
  input wire rstn,
  output reg q,
  output reg qn
);

  always @(posedge clk or negedge rstn) begin
    if (~rstn)
      q <= 0;
    else
      q <= d;
    qn <= ~q;
  end

endmodule


module ripple (
  input wire clk,
  input wire rstn,
  output wire [3:0] out
);

  wire q0, q1, q2, q3;
  wire qn0, qn1, qn2, qn3;

  dff dff0 (.clk(clk), .d(qn0), .rstn(rstn), .q(q0), .qn(qn0));
  dff dff1 (.clk(clk), .d(qn1), .rstn(rstn), .q(q1), .qn(qn1));
  dff dff2 (.clk(clk), .d(qn2), .rstn(rstn), .q(q2), .qn(qn2));
  dff dff3 (.clk(clk), .d(qn3), .rstn(rstn), .q(q3), .qn(qn3));

  assign out = {q3, q2, q1, q0};

endmodule




