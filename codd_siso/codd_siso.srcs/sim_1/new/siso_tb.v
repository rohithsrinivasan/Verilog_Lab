`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 09:07:35 AM
// Design Name: 
// Module Name: siso_tb
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


module siso_tb;
  reg din;
  reg clk;
  reg rst;
  wire dout;

  siso dut (
    .din(din),
    .clk(clk),
    .rst(rst),
    .dout(dout)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    rst = 1;
    din = 1;

    #10 rst = 0;
    #20 $finish;
  end

  initial begin
    #15 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;

    #10 $display("Output: %b", dout);
    #10 $finish;
  end
endmodule

