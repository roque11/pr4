// 2's compliment converter 
// File: mag.v
// Roque Orozco-Macias
// Nov. 15, 2021

`timescale 100 ns / 1 ns 

module mag(num, light, bin);
	input [7:0] num;
	output reg light;
	output reg [6:0] bin;
	
	always @ (num)
		begin
			assign light = num[0];
			
			assign bin[0] = num[1];      
			assign bin[1] = num[2];
			assign bin[2] = num[3];
			assign bin[3] = num[4];
			assign bin[4] = num[5];
			assign bin[5] = num[6];
			assign bin[6] = num[7];
		end
endmodule