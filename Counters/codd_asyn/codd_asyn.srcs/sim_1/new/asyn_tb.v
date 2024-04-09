
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2023 09:03:54 PM
// Design Name: 
// Module Name: asyn_tb
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

module tb_ripple;

  reg clk;
  reg rstn;

  wire [3:0] out;

  ripple counter (
    .clk(clk),
    .rstn(rstn),
    .out(out)
  );

  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_ripple);

    rstn = 0;
    clk = 0;
    #20 rstn = 1;
  end

  always #5 clk = ~clk;
  
endmodule



