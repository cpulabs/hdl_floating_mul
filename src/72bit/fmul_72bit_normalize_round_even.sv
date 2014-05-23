//System Verilog
//1-Latency

`default_nettype none

module fmul_72bit_normalize_round_even(
		input wire iCLOCK,
		input wire inRESET,
		input wire iRESET_SYNC,
		//Input
		input wire iDATA_VALID,
		output wire oDATA_BUSY,
		input wire iDATA_SIGN,
		input wire [12:0] iDATA_EXP,
		input wire [121:0] iDATA_FRACT,
		input wire iDATA_EXCEPT_EXP_A0,
		input wire iDATA_EXCEPT_EXP_B0,
		input wire iDATA_EXCEPT_EXP_A1,
		input wire iDATA_EXCEPT_EXP_B1,
		input wire iDATA_EXCEPT_FRACT_A0,
		input wire iDATA_EXCEPT_FRACT_B0,
		//Output
		output wire oDATA_VALID,
		input wire iDATA_BUSY,
		output wire oDATA_SIGN,
		output wire [12:0] oDATA_EXP,
		output wire [60:0] oDATA_FRACT,
		output wire oDATA_EXCEPT_EXP_A0,
		output wire oDATA_EXCEPT_EXP_B0,
		output wire oDATA_EXCEPT_EXP_A1,
		output wire oDATA_EXCEPT_EXP_B1,
		output wire oDATA_EXCEPT_FRACT_A0,
		output wire oDATA_EXCEPT_FRACT_B0
	);

	/***************************************
	Fract
	***************************************/
	//Normalize
	wire [60:0] nom_fract = (iDATA_FRACT[121])? iDATA_FRACT[121:61] : iDATA_FRACT[120:60];
	wire nom_l = (iDATA_FRACT[121])? iDATA_FRACT[61] : iDATA_FRACT[60];
	wire nom_g = (iDATA_FRACT[121])? iDATA_FRACT[60] : iDATA_FRACT[59];
	wire nom_r = (iDATA_FRACT[121])? iDATA_FRACT[59] : |iDATA_FRACT[58:0];
	wire nom_s = (iDATA_FRACT[121])? |iDATA_FRACT[58:0] : 1'b0;
	wire nom_fract_all1 = &iDATA_FRACT[121:61];

	//Round
	wire round_inc_ena = nom_g && (nom_l || nom_r || nom_s);
	wire [60:0] result_fract = (nom_fract_all1 && round_inc_ena)? nom_fract + 61'h1 : nom_fract;

	/***************************************
	Exp
	***************************************/
	//Normalize_result + Round_result
	wire [12:0] result_exp = iDATA_EXP + {12'h0, iDATA_FRACT[121]} + {12'h0, round_inc_ena};


	/***************************************
	D-FF
	***************************************/
	reg b_valid;
	reg b_sign;
	reg [12:0] b_exp;
	reg [60:0] b_fract;
	reg b_except_exp_a0;
	reg b_except_exp_b0;
	reg b_except_exp_a1;
	reg b_except_exp_b1;
	reg b_except_fract_a0;
	reg b_except_fract_b0;

	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_valid <= 1'b0;
			b_sign <= 1'b0;
			b_exp <= 13'h0;
			b_fract <= 61'h0;
			b_except_exp_a0 <= 1'b0;
			b_except_exp_b0 <= 1'b0;
			b_except_exp_a1 <= 1'b0;
			b_except_exp_b1 <= 1'b0;
			b_except_fract_a0 <= 1'b0;
			b_except_fract_b0 <= 1'b0;
		end
		else if(iRESET_SYNC)begin
			b_valid <= 1'b0;
			b_sign <= 1'b0;
			b_exp <= 13'h0;
			b_fract <= 61'h0;
			b_except_exp_a0 <= 1'b0;
			b_except_exp_b0 <= 1'b0;
			b_except_exp_a1 <= 1'b0;
			b_except_exp_b1 <= 1'b0;
			b_except_fract_a0 <= 1'b0;
			b_except_fract_b0 <= 1'b0;
		end
		else begin
			if(!iDATA_BUSY)begin
				b_valid <= iDATA_VALID;
				b_sign <= iDATA_SIGN;
				b_exp <= result_exp;
				b_fract <= result_fract;
				b_except_exp_a0 <= iDATA_EXCEPT_EXP_A0;
				b_except_exp_b0 <= iDATA_EXCEPT_EXP_B0;
				b_except_exp_a1 <= iDATA_EXCEPT_EXP_A1;
				b_except_exp_b1 <= iDATA_EXCEPT_EXP_B1;
				b_except_fract_a0 <= iDATA_EXCEPT_FRACT_A0;
				b_except_fract_b0 <= iDATA_EXCEPT_FRACT_B0;
			end
		end
	end

	assign oDATA_BUSY = iDATA_BUSY;
	assign oDATA_VALID = b_valid;
	assign oDATA_SIGN = b_sign;
	assign oDATA_EXP = b_exp;
	assign oDATA_FRACT = b_fract;
	assign oDATA_EXCEPT_EXP_A0 = b_except_exp_a0;
	assign oDATA_EXCEPT_EXP_B0 = b_except_exp_b0;
	assign oDATA_EXCEPT_EXP_A1 = b_except_exp_a1;
	assign oDATA_EXCEPT_EXP_B1 = b_except_exp_b1;
	assign oDATA_EXCEPT_FRACT_A0 = b_except_fract_a0;
	assign oDATA_EXCEPT_FRACT_B0 = b_except_fract_b0;

endmodule

`default_nettype wire

