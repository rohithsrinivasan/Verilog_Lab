`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 09:26:49 AM
// Design Name: 
// Module Name: sipo_tb
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


module sipo_tb;
  reg din;
  reg clk;
  reg rst;
  wire [3:0] dout;

  // Instantiate the SIPO module
  sipo dut (
    .din(din),
    .clk(clk),
    .rst(rst),
    .dout(dout)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Reset initialization
  initial begin
    clk = 0;
    rst = 1; // Assert reset
    din = 1; // Set input to 1

    #10 rst = 0; // Deassert reset
    #20 $finish; // Finish simulation after 20 time units
  end

  // Stimulus
  initial begin
    // Shift-in sequence
    #15 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;

    // After shifting in, observe the output
    #10 $display("Output: %b", dout);
    #10 $finish;
  end
endmodule

