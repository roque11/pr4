// 7 Segment D Flip Flop 
// File: diff_7.v
// Roque Orozco-Macias
// Nov. 29, 2021

module dff_7(clk, ar, d, q);
	input clk, ar;
	input [7:0] d;
	output reg [7:0] q;
		
	always @(posedge clk or negedge ar)
		begin	
			if(~ar)
				begin	
					q = 0;
				end
			else
				begin 
					q = d;
				end
		end
endmodule