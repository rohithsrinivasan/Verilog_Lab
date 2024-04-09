`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:56:31 AM
// Design Name: 
// Module Name: moore_tb
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


module MooreMachine_Testbench;

  reg clk;
  reg reset;
  reg input_symbol;
  wire output_symbol;

  // Instantiate the Moore machine module
  MooreMachine dut (
    .clk(clk),
    .reset(reset),
    .input_symbol(input_symbol),
    .output_symbol(output_symbol)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  initial begin
    // Initialize inputs
    reset = 1;
    input_symbol = 0;

    // Apply reset
    #10;
    reset = 0;

    // Test input sequence: 0, 1, 0, 1, 0
    #10;
    input_symbol = 0;
    #10;
    input_symbol = 1;
    #10;
    input_symbol = 0;
    #10;
    input_symbol = 1;
    #10;
    input_symbol = 0;

    // End simulation
    #10;
    $finish;
  end

  // Display output symbols
  always @(posedge clk) begin
    $display("Output Symbol: %b", output_symbol);
  end

endmodule

