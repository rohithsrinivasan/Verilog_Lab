`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 05:11:24 PM
// Design Name: 
// Module Name: dff_tb
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


module JKFlipFlop_tb;
  
  reg clk, reset, j, k;
  wire q;
  
  JKFlipFlop dut (
    .clk(clk),
    .reset(reset),
    .j(j),
    .k(k),
    .q(q)
  );
  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, JKFlipFlop_tb);
  
    clk = 0;
    forever #5 clk = ~clk;   // Clock toggles every 5 time units
  
    // Test case 1: Set J=0, K=0
    reset = 0; j = 0; k = 0;
    #10;
  
    // Test case 2: Set J=0, K=1
    reset = 0; j = 0; k = 1;
    #10;
  
    // Test case 3: Set J=1, K=0
    reset = 0; j = 1; k = 0;
    #10;
  
    // Test case 4: Set J=1, K=1
    reset = 0; j = 1; k = 1;
    #10;
  
    // Test case 5: Reset active (reset = 1)
    reset = 1; j = 0; k = 0;
    #10;
    reset = 0;
    #10;
  
    $finish;
  end
  
endmodule


