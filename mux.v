// 4:1 mux 
// File: mux.v
// Don M. Gruenbacher (Used by Roque Orozco-Macias)
// Feb. 5, 2000 (Used Nov. 15, 2021)

`timescale 100 ns / 1 ns 

module mux(select, a, b, c, add, sub, f);
	input [2:0] select;
	input a, b, c; 
	output reg [7:0] f; 
	[6:0]

always@(a or b or select) 
	begin 
	
		if(~add && sub)
			assign select = 1;
		else if(add && ~sub)
			assign select = 2;
		else if(~add && ~sub)
			assign select = 3;
		else
			assign select = 0;
	
		
		reg plus = a + b;
		reg minus = a - b;
		reg mult = a * b;
	
		case(select) 
			1: f = plus; 
			2: f = minus; 
			3: f = mult; 
			default : f = d;
		endcase 
	end 
endmodule 