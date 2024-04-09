`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 05:25:20 PM
// Design Name: 
// Module Name: jk_tb
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
  
    reset = 1'b0; // Initialize reset to 0
    j = 1'b0;     // Initialize J input to 0
    k = 1'b0;     // Initialize K input to 0
    clk = 1'b0;   // Initialize clock to 0
  
    #5;          // Wait for some time
  
    // Test case 1: Set J=0, K=0
    j = 1'b0; k = 1'b0;
    #10;
  
    // Test case 2: Set J=0, K=1
    j = 1'b0; k = 1'b1;
    #10;
  
    // Test case 3: Set J=1, K=0
    j = 1'b1; k = 1'b0;
    #10;
  
    // Test case 4: Set J=1, K=1
    j = 1'b1; k = 1'b1;
    #10;
  
    // Test case 5: Reset active (reset = 1)
    reset = 1'b1;
    #10;
    reset = 1'b0; // Deactivate reset
    #10;
  
    $finish;
  end
  
  always #5 clk = ~clk;   // Toggle clock every 5 time units
  
endmodule


