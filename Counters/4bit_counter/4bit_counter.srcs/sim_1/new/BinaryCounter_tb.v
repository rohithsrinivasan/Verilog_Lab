`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 02:29:37 PM
// Design Name: 
// Module Name: BinaryCounter_tb
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


module BinaryCounter_tb;

   // Inputs
   reg clk;
   reg reset;

   // Outputs
   wire [3:0] count;

   // Instantiate the BinaryCounter module
   BinaryCounter uut (
       .clk(clk),
       .reset(reset),
       .count(count)
   );

   // Clock generation
   always begin
       #5 clk = ~clk; // Toggle the clock every 5 time units (adjust as needed)
   end

   // Initializations
   initial begin
       clk = 0;
       reset = 0;

       // Apply reset
       reset = 1;
       #10 reset = 0;

       // Monitor the counter behavior
       $display("Time\tCount");
       $monitor("%d\t%b", $time, count);

       // Run the simulation for a while
       #50 $finish; // Terminate simulation after 50 time units
   end

endmodule

