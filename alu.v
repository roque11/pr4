`timescale 100 ns / 1 ns

module alu(clk, ar, a, b, mode, sign, signA, signB, f_out, a_out, b_out);

	input clk, ar;
	input signed [3:0] a, b;
	input [1:0] mode;
	
	output wire sign, signA, signB;
	output [7:0] f_out, a_out, b_out;
	
	reg signed [7:0] a_ext, b_ext, f;

	
	always @(negedge ar or posedge clk)
		if(~ar)
			begin 
			a_ext = 8'b0;
			b_ext = 8'b0;
			f = 16'b0;
			end
		else
			begin
			a_ext = a;
			b_ext = b;
			
			case (mode)
				2'b00: f = a_ext + b_ext;
				2'b01: f = a_ext - b_ext;
				default: f = a_ext * b_ext;
			endcase
	end
	
	wire signed [7:0] f_2comp, a_2comp, b_2comp;
	
	wire [7:0] f_out, a_out, b_out;
	
	assign sign = f[7];
	assign signA = a_ext[7];
	assign signB = b_ext[7];
	
	assign f_2comp = ~f + 1'b1;
	assign a_2comp = ~a_ext + 1'b1;
	assign b_2comp = ~b_ext + 1'b1;
	
	assign f_out = sign ? f_2comp : f;
	assign a_out = signA ? a_2comp : a_ext;
	assign b_out = signB ? b_2comp : b_ext;
		
endmodule