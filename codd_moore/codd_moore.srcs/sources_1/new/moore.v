`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:53:48 AM
// Design Name: 
// Module Name: moore
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


module MooreMachine (
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
    end else begin
      case (state)
        2'b00: begin
          if (input_symbol) begin
            state <= 2'b01; // Transition to state B
          end else begin
            state <= 2'b00; // Remain in state A
          end
        end
        2'b01: begin
          if (input_symbol) begin
            state <= 2'b01; // Remain in state B
          end else begin
            state <= 2'b10; // Transition to state C
          end
        end
        2'b10: begin
          if (input_symbol) begin
            state <= 2'b01; // Transition to state B
          end else begin
            state <= 2'b00; // Transition to state A
          end
        end
        default: begin
          state <= 2'b00; // Default to state A
        end
      endcase
    end
  end

  always @(state) begin
    case (state)
      2'b00: begin
        output_reg = 1'b0; // Output symbol for state A
      end
      2'b01: begin
        output_reg = 1'b1; // Output symbol for state B
      end
      2'b10: begin
        output_reg = 1'b0; // Output symbol for state C
      end
      default: begin
        output_reg = 1'b0; // Default output symbol
      end
    endcase
  end

  assign output_symbol = output_reg;

endmodule
