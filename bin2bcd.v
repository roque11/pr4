// Binary to BCD format converter
// File: bin2bcd.v
// Don M. Gruenbacher (Altered and used by Roque Orozco-Macias)
// Date Created Unknown (Used Nov. 15, 2021)

module bin2bcd(binary, tens, ones);
	input [6:0]		binary;
	output reg [3:0] hundreds;
	output reg [3:0] tens;
	output reg [3:0] ones;
	
	
	integer i; /// used for 'for loop'
	
	always@(binary)
		begin
			hundreds = 4'd0;
			tens = 4'd0;
			ones = 4'd0;
		
		for (i=7; i >= 0; i = i - 1)
		
		begin
			if(hundreds >= 5)
			if(tens >= 5)
				tens = tens + 3;
			if(ones >= 5)
				ones = ones + 3;
			
			//shift left ones
			tens = tens << 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones[0] = binary[i];
			end
		end
endmodule


// 	Adapted from https://my.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html