
// Project 4 Top 
// File: pr4_main.v
// Roque Orozco-Macias
// Nov. 29, 2021

`timescale 1 ns / 1 ns

module pr4_main(clk, ar, aSign, a0, a1, a2, bSign, b0, b1, b2, switchAdd, switchSub, vga, ansSign_out, aSign_out, bSign_out, tens_out, ones_out, a_out, b_out);
	
	input clk, ar, aSign, a0, a1, a2, bSign, b0, b1, b2, switchAdd, switchSub, newLine, vga;
	
	output ansSign_out, 
	output reg aSign_out, 
	output reg bSign_out;
	output [6:0] tens_out, ones_out, a_out, b_out;
	
	wire mode;
	wire [3:0] a_in, b_in;
	
	reg signed [7:0] a_ext, b_ext;
	
	wire ansSign;
	wire tens;
	wire ones;
	wire a_int;
	wire b_int;
	
	
	
	always @ (posedge clk)
		if(switchAdd)
			mode = 2'b00;
		else if(switchSub)
			mode = 2'b01;
		else
			mode = 2'b11;
	end
	
	always @ (posedge clk)
		if(a0)
			a_in[1] = 1;
		else
			a_in[1] = 0;
		if(a1)
			a_in[2] = 1;
		else
			a_in[2] = 0;
		if(a2)
			a_in[3] = 1;
		else
			a_in[3] = 0;
		
		if(b0)
			b_in[1] = 1;
		else
			b_in[1] = 0;
		if(b1)
			b_in[2] = 1;
		else
			b_in[2] = 0;
		if(b2)
			b_in[3] = 1;
		else
			b_in[3] = 0;
		if(aSign)
			begin
			a_in[0] = 1;
			a_ext = ~a_in + 1'b1;
			aSign_out = 1;
			end
		else
			begin
			a_in[0] = 0;
			aSign_out = 0
			end
		if(bSign)
			b_in[0] = 1;
			b_ext = ~b_in + 1'b1;
			bSign_out = 1;
		else
			b_in[0] = 0;
			bSign_out = 0;
	end
	
	
	alu calc(.clk(clk), .ar(ar), .a(a_in), .b(b_in), .mode(mode), .sign(ansSign), .disp_int_tens(tens), .disp_int_ones(ones))
	
	sev_seg_decoder ten(.x_in(tens), .segs(tens_out));
	sev_seg_decoder one(.x_in(ones), .segs(ones_out));
	
	bin2bcd aDec(.binary(a_ext), .tens(), .ones(a_int));
	bin2bcd bDec(.binary(b_ext), .tens(), .ones(b_int));
	
	sev_seg_decoder ten(.x_in(tens), .segs(a_out));
	sev_seg_decoder one(.x_in(ones), .segs(b_out));	
	
	
	
endmodule