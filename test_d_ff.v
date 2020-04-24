//////////////////////////////////////////////////////////////////////////////////
// Design: Test bench for D Flip Flop
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_d_ff( );

// inputs to the DUT
    reg d   = 1'b0;
    reg clk = 1'b1;
    reg rst = 1'b1;
// outputs from the DUT
    wire q;


d_ff DUT (.d(d), .clk(clk), .q(q));

initial
    begin
        $display($time, " << Simulation Results >>");
        $monitor($time, "d = %b, clk = %b, q = %b", d, clk, q);
    end

initial
    begin
        forever #10 clk = ~clk;
    end

initial
    begin
        for(integer i=0; i <= 16; i=i+1) begin
            #25;
            d   = ~d;
            rst = 1'b0;
        end
        $finish;
    end
endmodule
