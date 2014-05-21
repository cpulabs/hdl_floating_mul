//System Verilog

`default_nettype none

module mul_float_exception #(
		parameter P_ZERO = {8'h00, 23'h000000},
		parameter P_INF = {8'hff, 23'h000000},
		parameter P_NAN = {8'hff, 23'h400000}
	)(
		input wire iCLOCK,
		input wire inRESET,
		input wire iRESET_SYNC,
		//Input
		input wire iDATA_VALID,
		output wire oDATA_BUSY,
		input wire iDATA_SIGN,
		input wire [9:0] iDATA_EXP,
		input wire [23:0] iDATA_FRACT,
		input wire iDATA_EXCEPT_EXP_A0,
		input wire iDATA_EXCEPT_EXP_B0,
		input wire iDATA_EXCEPT_EXP_A1,
		input wire iDATA_EXCEPT_EXP_B1,
		input wire iDATA_EXCEPT_FRACT_A0,
		input wire iDATA_EXCEPT_FRACT_B0,
		//Output
		output wire oDATA_VALID,
		input wire iDATA_BUSY,
		output wire [31:0] oDATA
	);


	/***************************************
	Exception Check
	***************************************/
	function [31:0] func_make_out;
		input func_except_exp_a0;
		input func_except_exp_b0;
		input func_except_exp_a1;
		input func_except_exp_b1;
		input func_except_flatc_a0;
		input func_except_flatc_a1;
		input func_sign;
		input [7:0] func_exp;
		input [22:0] func_fract;
		begin
			casex({func_except_exp_a0, func_except_exp_a1, func_except_flatc_a0, func_except_exp_b0, func_except_exp_b1, func_except_flatc_b0})
				6'b10x_10x : func_make_out = P_ZERO;
				6'b10x_011 : func_make_out = P_NAN;
				6'b10x_010 : func_make_out = P_NAN;
				6'b10x_00x : func_make_out = P_ZERO;
				6'b011_10x : func_make_out = P_NAN;
				6'b011_011 : func_make_out = P_INF;
				6'b011_010 : func_make_out = P_NAN;
				6'b011_00x : func_make_out = P_INF;
				6'b010_xxx : func_make_out = P_NAN;
				6'b00x_10x : func_make_out = P_ZERO;
				6'b00x_011 : func_make_out = P_INF;
				6'b00x_010 : func_make_out = P_NAN;
				6'b00x_00x : func_make_out = {func_sign, func_exp, func_fract};
				default : func_make_out = P_NAN;
			endcase
		end
	endfunction

	reg [7:0] exp;
	reg [22:0] fract;
	always_comb begin
		if(iDATA_EXP[[9])begin
			exp = 8'h0;
			fract = 23'h0;
		end
		else if(iDATA_EXP[8])begin
			exp = 8'hff;
			fract = 23'h0;
		end
		else begin
			exp = iDATA_EXP[7:0];
			fract = iDATA_FRACT[22:0];
		end
	end

	wire [31:0] result_data = func_make_out(
		iDATA_EXCEPT_EXP_A0,
		iDATA_EXCEPT_EXP_B0,
		iDATA_EXCEPT_EXP_A1,
		iDATA_EXCEPT_EXP_B1,
		iDATA_EXCEPT_FRACT_A0,
		iDATA_EXCEPT_FRACT_B0,
		iDATA_SIGN,
		exp,
		fract
	);


	/***************************************
	Output Assignment
	***************************************/
	reg b_valid;
	reg [31:0] b_data;

	always_ff@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_valid <= 1'b0;
			b_data <= 32'h0;
		end
		else if(iRESET_SYNC)begin
			b_valid <= 1'b0;
			b_data <= 32'h0;
		end
		else begin
			if(!iDATA_BUSY)begin
				b_valid <= iDATA_VALID;
				b_data <= iDATA_DATA;
			end
		end
	end

	assign oDATA_BUSY = iDATA_BUSY;
	assign oDATA_VALID = b_valid;
	assign oDATA_DATA = b_data;

endmodule


`default_nettype wire

