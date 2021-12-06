`timescale 100 ns / 1 ns

module alu(clk, ar, a, b, mode, sign, disp_int_tens, disp_int_ones);

	input clk, ar;
	input signed [3:0] a;
	input signed [3:0] b;
	input [1:0] mode;
	output sign;
	output [6:0] disp_int_ones, disp_int_tens;
	
	reg signed [7:0] a_ext, b_ext;
	reg signed [7:0] alu_out_int;
	wire signed [7:0] sum, diff, product;
	
	assign sum = a_ext + b_ext;
	assign difff = a_ext + b_ext;
	assign product = a_ext * b_ext;
	
	always @(negedge ar or posedge clk)
		if(~ar)
			begin 
			a_ext = 8'b0;
			b_ext = 8'bo;
			alu_out_int = 16'b0;
			end
		else
			begin
			a_ext = a;
			b_ext = b;
			
			case (mode)
				2'b00: alu_out_int = sum;
				2'b01: alu_out_int = diff;
				default: alu_out_int = product;
			endcase
	end
	
	
	wire signed [7:0] alu_out_2comp;
	
	wire [7:0] alu_out_mag;
	
	assign sign = alu_out_int[7];
	assign alu_out_2comp = ~alu_out_int + 1'b1;
	
	assign alu_out_mag = sign ? alu_out_2comp : alu_out_int;
	
	
	integer i;
	
	wire [6:0] tens, ones;
	
	assign disp_int_tens = tens;
	assign disp_int_ones = ones;
	
	always@(alu_out_mag)
		begin 
			tens = 4'd0;
			ones = 4'd0;
		
		for (i=6; i >= 0; i = i - 1)
		
		begin
				
				if(tens >= 5)
					tens = tens + 3;
				if(ones >= 5)
					ones = ones + 3;
				
				tens = tens << 1;
				tens[0] = ones[3];
				ones = ones << 1;
				ones[0] = binary[i];
			end
		end
endmodule