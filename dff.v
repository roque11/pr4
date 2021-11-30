// DFF
// File: dff_in
// Roque Orozco-Macias
// Nov. 15, 2021

module dff_in(clk, ar, dInd, d0, d1, d2, q);
	input clk, ar, dInd, d0, d1, d2;
	output reg [3:0] q;
		
	always @(posedge clk or negedge ar)
		begin	
			if(~ar)
				begin	
					q = 0;
				end
			else
				begin 
					q[0] = dInd;
					q[1] = d0;
					q[2] = d1;
					q[3] = d2;
				end
		end
endmodule
			