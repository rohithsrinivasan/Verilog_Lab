`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 09:47:09 AM
// Design Name: 
// Module Name: piso_tb
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

module piso_tb;
  reg [3:0] din;
  reg clk;
  reg rst;
  reg load;
  wire dout;

  // Instantiate the PISO module
  piso dut (
    .din(din),
    .clk(clk),
    .rst(rst),
    .load(load),
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
    load = 0; // Set load to 0
    din = 4'b1111; // Set input to 1111

    #10 rst = 0; // Deassert reset
    #20 $finish; // Finish simulation after 20 time units
  end

  // Stimulus
  initial begin
    // Observe the initial output
    #5 $display("Output: %b", dout);

    // Parallel input sequence with load
    #15 load = 1;
    #10 din = 4'b1010;
    #10 load = 0;

    // After parallel input, observe the output
    #10 $display("Output: %b", dout);

    // More shifting
    #10 din = 4'b0110;
    #10 din = 4'b1100;

    // After shifting, observe the output
    #10 $display("Output: %b", dout);
    #10 $finish;
  end
endmodule

