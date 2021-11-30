// Project 4 Top 
// File: pr4_main.v
// Roque Orozco-Macias
// Nov. 29, 2021

`timescale 1 ns / 1 ns

module pr4_main(clk, ar, aInd_in, a0, a1, a2, bInd_in, b0, b1, b2, switchAdd, switchSub, vga, resInd, aInd_out, bInd_out, tens_out, ones_out, a_out, b_out);
	input clk, ar, aInd_in, a0, a1, a2, bInd_in, b0, b1, b2, switchAdd, switchSub, vga;
	
	output resInd, aInd_out, bInd_out;
	output [6:0] tens_out, ones_out, a_out, b_out;
	
	wire a_bin;
	wire b_bin;
	wire select;
	wire [7:0] result;
	wire [6:0] binary;
	wire [6:0] binA;
	wire [6:0] binB;
	wire [6:0] aDec;
	wire [6:0] bDec;
	wire [6:0] tens;
	wire [6:0] ones;
	
	reg select;
	
	
	
	dff a_in(.clk(clk), .ar(ar), .d(a), .q(a_bin));
	dff b_in(.clk(clk), .ar(ar), .d(b), .q(b_bin));
	
	mux res(.select(select), .a(a), .b(b), .c(0), .add(switchAdd), .sub(switchSub), .f(result);
	
	mag resNum(.num(result), .light(reInd), .bin(binary));
	mag aNum(.num(a_bin), .light(aInd_out), .bin(binA));
	mag bNum(.num(b_bin), .light(bInd_out), .bin(binB));
	
	bin2bcd resBcd(.binary(binary), .tens(tens), .ones(ones));
	bin2bcd aBcd(.binary(binary), .tens(), .ones(aDec));
	bin2bcd bBcd(.binary(binary), .tens(), .ones(bDec));
	
	sev_seg_decoder onesOut(.x_in(ones), .segs(ones_out));
	sev_seg_decoder tensOut(.x_in(tens), .segs(tens_out));
	
	sev_seg_decoder aOut(.x_in(aDec), .segs(a_out));
	sev_seg_decoder bOut(.x_in(bDec), .segs(b_out));
	
	
endmodule