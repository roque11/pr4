// 4:1 mux 
// File: mux.v
// Don M. Gruenbacher (Used by Roque Orozco-Macias)
// Feb. 5, 2000 (Used Nov. 15, 2021)

`timescale 100 ns / 1 ns 

module mux(a, b, c, add, sub, f);
	input a, b, c, add, sub; 
	output reg [7:0] f; 
	
	integer plus = a + b;
	integer minus = a - b;
	integer mult = a * b;
	integer select;

always@(add or sub) 
	begin 
	
		if(~add && sub)
			assign select = 1;
		else if(add && ~sub)
			assign select = 2;
		else if(~add && ~sub)
			assign select = 3;
		else
			assign select = 0;
	
		case(select) 
			1: f = plus; 
			2: f = minus; 
			3: f = mult; 
			default : f = c;
		endcase 
	end 
endmodule 