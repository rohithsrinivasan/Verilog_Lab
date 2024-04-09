`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:34:53 AM
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

module MealyMachine (
  input wire clk,
  input wire reset,
  input wire input_symbol,
  output wire output_symbol
);

  reg [1:0] state;
  reg output_reg;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= 2'b00; // Initial state
      output_reg <= 1'b0;
    end else begin
      case (state)
        2'b00: begin
          if (input_symbol) begin
            state <= 2'b01; // Transition to state B
            output_reg <= 1'b1; // Output symbol 1
          end else begin
            state <= 2'b00; // Remain in state A
            output_reg <= 1'b0; // Output symbol 0
          end
        end
        2'b01: begin
          if (input_symbol) begin
            state <= 2'b01; // Remain in state B
            output_reg <= 1'b0; // Output symbol 0
          end else begin
            state <= 2'b00; // Transition to state A
            output_reg <= 1'b1; // Output symbol 1
          end
        end
        default: begin
          state <= 2'b00; // Default to state A
          output_reg <= 1'b0; // Output symbol 0
        end
      endcase
    end
  end

  assign output_symbol = output_reg;

endmodule

