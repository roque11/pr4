
// Project 4 Top 
// File: pr4_main.v
// Roque Orozco-Macias
// Nov. 29, 2021

`timescale 1 ns / 1 ns

module pr4_main(clk, ar, a, b, select, vga, ansSign_out, aSign_out, bSign_out, tens_out, ones_out, a_out, b_out);
	
	input clk, ar, vga;
	input [1:0] select;
	input [3:0] a, b;
	
	output reg ansSign_out;
	output aSign_out;
	output bSign_out;
	output [6:0] tens_out, ones_out, a_out, b_out;
	
	

	wire [6:0] tens, ones, a1, b1;
	wire mode;
	wire [6:0] alu, intA, intB;
	
	alu calc(.clk(clk), .ar(ar), .a(a), .b(b), .mode(select), .sign(ansSign), .signA(aSign_out), .signB(bSign_out), .f_out(alu), .a_out(intA), .b_out(intB));
	
	bin2bcd dec(.binary(alu), .hundreds(), .tens(tens), .ones(ones));
	bin2bcd dec1(.binary(intA), .hundreds(), .tens(), .ones(a1));
	bin2bcd dec2(.binary(intB), .hundreds(), .tens(), .ones(b1));

	
	sev_seg_decoder ten(.x_in(tens), .segs(tens_out));
	sev_seg_decoder one(.x_in(ones), .segs(ones_out));
	
	sev_seg_decoder Tens(.x_in(a1), .segs(a_out));
	sev_seg_decoder Ones(.x_in(b1), .segs(b_out));
	
	
	
endmodule