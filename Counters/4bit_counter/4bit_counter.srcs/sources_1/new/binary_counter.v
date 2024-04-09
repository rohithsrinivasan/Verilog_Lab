`timescale 1ns / 1ps

module BinaryCounter(
    input wire clk,
    input wire reset,
    output wire [3:0] count
);
    reg [3:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1;
    end

endmodule

