`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:16:58 AM
// Design Name: 
// Module Name: syn_tb
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

module synchronous_counter_tb;
  reg clk;
  reg reset;
  wire [3:0] count;

  synchronous_counter dut (
    .clk(clk),
    .reset(reset),
    .count(count)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    reset = 1;

    #20 reset = 0;
    #100 $finish;
  end

  initial begin
    #5 $display("Count: %b", count);

    #20;

    #10 reset = 1;

    #5 $display("Count: %b", count);

    #10 reset = 0;

    #5 $display("Count: %b", count);

    #50;

    #5 $display("Count: %b", count);

    #10 $finish;
  end
endmodule

