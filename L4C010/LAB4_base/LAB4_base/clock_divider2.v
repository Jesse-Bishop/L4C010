module clock_divider2 (clk2, rst_n2, clk_o2);

parameter DIV_CONST2      = 2000000;

reg tempClk2;

input clk2;
input rst_n2;

output reg clk_o2;

reg [31:0] div2;

reg en2;

always @ (posedge clk2 or negedge rst_n2)
begin
	
	if (!rst_n2)
	begin
		div2 <= 0;
		en2 <= 0;
	end	
	else
	begin
		if (div2 == DIV_CONST2)
		begin
			div2 <= 0;
			en2 <= 1;
		end
		else
		begin
			div2 <= div2 + 1;
			en2 <= 0;
		end
	end
end 
 

always @ (posedge clk2 or negedge rst_n2)
begin
if (!rst_n2)
begin
	clk_o2 <= 1'b0;
end
else if (en2)
	clk_o2 <= ~clk_o2;
end


endmodule
