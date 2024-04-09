`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:28:10 AM
// Design Name: 
// Module Name: mealy_machine_tb
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


module mealy_machine_tb;
  reg x;
  reg y;
  wire z;
  wire w;

  mealy_machine dut (
    .x(x),
    .y(y),
    .z(z),
    .w(w)
  );

  always begin
    #5 x = ~x;
    #10 y = ~y;
  end

  initial begin
    x = 0;
    y = 0;

    #5 $display("Output z: %b, w: %b", z, w);

    #10 x = 1; y = 0;
    #10 $display("Output z: %b, w: %b", z, w);
    #10 x = 0; y = 1;
    #10 $display("Output z: %b, w: %b", z, w);
    #10 x = 1; y = 1;
    #10 $display("Output z: %b, w: %b", z, w);

    #10 x = 0; y = 0;
    #10 $display("Output z: %b, w: %b", z, w);
    #10 x = 1; y = 0;
    #10 $display("Output z: %b, w: %b", z, w);
    #10 x = 0; y = 1;
    #10 $display("Output z: %b, w: %b", z, w);
    #10 x = 1; y = 1;
    #10 $display("Output z: %b, w: %b", z, w);

    #10 $finish;
  end
endmodule

