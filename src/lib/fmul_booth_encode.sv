`default_nettype none

module fmul_booth_encode#(
		parameter PL_N = 32'h0
	)(
		input wire [PL_N-1:0] iCAL_DATA0,
		input wire [2:0] iCAL_DATA1,
		output reg oCAL_SIGN,
		output reg [PL_N-1:0] oCAL_DATA
	);


	always_comb @* begin
		unique case(iCAL_DATA1)
			3'h0, 3'h7 : 
				begin
					oCAL_SIGN = 1'b0;
					oCAL_DATA = 32'h0;
				end
			3'h1, 3'h2 : 
				begin
					oCAL_SIGN = 1'b0;
					oCAL_DATA = iCAL_DATA0;
				end
			3'h3 : 
				begin
					oCAL_SIGN = 1'b0;
					oCAL_DATA = iCAL_DATA0<<1;
				end
			3'h4 : 
				begin
					oCAL_SIGN = 1'b1;
					oCAL_DATA = -(iCAL_DATA0<<1);
				end
			3'h5, 3'h6 : 
				begin
					oCAL_SIGN = 1'b1;
					oCAL_DATA = -iCAL_DATA0;
				end
		endcase
	end

endmodule

`default_nettype wire 

