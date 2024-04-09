`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:26:31 AM
// Design Name: 
// Module Name: mealy
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



module mealy_machine (
  input wire x,
  input wire y,
  output wire z,
  output wire w
);
  // Define the states
  localparam S0 = 2'b00;
  localparam S1 = 2'b01;
  localparam S2 = 2'b10;
  localparam S3 = 2'b11;

  // Define the outputs
  reg z;
  reg w;

  // Define the current state
  reg [1:0] state;

  // Next-state and output logic
  always @(x, y, state) begin
    case (state)
      S0: begin
        if (x)
          state <= S1;
        else if (y)
          state <= S2;
        else
          state <= S0;

        z <= 0;
        w <= 0;
      end

      S1: begin
        if (x)
          state <= S2;
        else if (y)
          state <= S3;
        else
          state <= S1;

        z <= 0;
        w <= 1;
      end

      S2: begin
        if (x)
          state <= S3;
        else if (y)
          state <= S0;
        else
          state <= S2;

        z <= 1;
        w <= 0;
      end

      S3: begin
        if (x)
          state <= S0;
        else if (y)
          state <= S1;
        else
          state <= S3;

        z <= 1;
        w <= 1;
      end
    endcase
  end
endmodule
