//System Verilog

`default_nettype none

module fmul_36bit(
		input wire iCLOCK,
		input wire inRESET,
		input wire iRESET_SYNC,
		//Input
		input wire iDATA_REQ,
		output wire oDATA_BUSY,
		input wire [35:0] iDATA_A,
		input wire [35:0] iDATA_B,
		//Output
		output wire oDATA_VALID,
		input wire iDATA_BUSY,
		output wire [35:0] oDATA
	);

	wire cal_2_norm_valid;
	wire norm_2_cal_busy;
	wire cal_2_norm_sign;
	wire [12:0] cal_2_norm_exp;
	wire [49:0] cal_2_norm_fract;
	wire cal_2_norm_except_exp_a0;
	wire cal_2_norm_except_exp_b0;
	wire cal_2_norm_except_exp_a1;
	wire cal_2_norm_except_exp_b1;
	wire cal_2_norm_except_fract_a0;
	wire cal_2_norm_except_fract_b0;

	wire norm_2_except_valid;
	wire except_2_norm_busy;
	wire norm_2_except_sign;
	wire [12:0] norm_2_except_exp;
	wire [48:0] norm_2_except_fract;
	wire norm_2_except_except_exp_a0;
	wire norm_2_except_except_exp_b0;
	wire norm_2_except_except_exp_a1;
	wire norm_2_except_except_exp_b1;
	wire norm_2_except_except_fract_a0;
	wire norm_2_except_except_fract_b0;

	/***************************************
	Floating Multiplier - 2 Latency
	***************************************/
	fmul_36bit_cal FMUL_CALC(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		//Input
		.iDATA_REQ(iDATA_REQ),
		.oDATA_BUSY(oDATA_BUSY),
		.iDATA_A(iDATA_A),
		.iDATA_B(iDATA_B),
		//Output
		.oDATA_VALID(cal_2_norm_valid),
		.iDATA_BUSY(norm_2_cal_busy),
		.oDATA_SIGN(cal_2_norm_sign),
		.oDATA_EXP(cal_2_norm_exp),
		.oDATA_FRACT(cal_2_norm_fract),
		.oDATA_EXCEPT_EXP_A0(cal_2_norm_except_exp_a0),
		.oDATA_EXCEPT_EXP_B0(cal_2_norm_except_exp_b0),
		.oDATA_EXCEPT_EXP_A1(cal_2_norm_except_exp_a1),
		.oDATA_EXCEPT_EXP_B1(cal_2_norm_except_exp_b1),
		.oDATA_EXCEPT_FRACT_A0(cal_2_norm_except_fract_a0),
		.oDATA_EXCEPT_FRACT_B0(cal_2_norm_except_fract_b0)
	);

	/***************************************
	Normalize & Round - 1 Latency
	***************************************/
	fmul_36bit_normalize_round_even FMUL_NOM_ROUND(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		//Input
		.iDATA_VALID(cal_2_norm_valid),
		.oDATA_BUSY(norm_2_cal_busy),
		.iDATA_SIGN(cal_2_norm_sign),
		.iDATA_EXP(cal_2_norm_exp),
		.iDATA_FRACT(cal_2_norm_fract),
		.iDATA_EXCEPT_EXP_A0(cal_2_norm_except_exp_a0),
		.iDATA_EXCEPT_EXP_B0(cal_2_norm_except_exp_b0),
		.iDATA_EXCEPT_EXP_A1(cal_2_norm_except_exp_a1),
		.iDATA_EXCEPT_EXP_B1(cal_2_norm_except_exp_b1),
		.iDATA_EXCEPT_FRACT_A0(cal_2_norm_except_fract_a0),
		.iDATA_EXCEPT_FRACT_B0(cal_2_norm_except_fract_b0),
		//Output
		.oDATA_VALID(norm_2_except_valid),
		.iDATA_BUSY(except_2_norm_busy),
		.oDATA_SIGN(norm_2_except_sign),
		.oDATA_EXP(norm_2_except_exp),
		.oDATA_FRACT(norm_2_except_fract),
		.oDATA_EXCEPT_EXP_A0(norm_2_except_except_exp_a0),
		.oDATA_EXCEPT_EXP_B0(norm_2_except_except_exp_b0),
		.oDATA_EXCEPT_EXP_A1(norm_2_except_except_exp_a1),
		.oDATA_EXCEPT_EXP_B1(norm_2_except_except_exp_b1),
		.oDATA_EXCEPT_FRACT_A0(norm_2_except_except_fract_a0),
		.oDATA_EXCEPT_FRACT_B0(norm_2_except_except_fract_b0)
	);

	/***************************************
	Exception - 1 Latency
	***************************************/
	fmul_36bit_exception  FMUL_EXCEPT(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		//Input
		.iDATA_VALID(norm_2_except_valid),
		.oDATA_BUSY(except_2_norm_busy),
		.iDATA_SIGN(norm_2_except_sign),
		.iDATA_EXP(norm_2_except_exp),
		.iDATA_FRACT(norm_2_except_fract),
		.iDATA_EXCEPT_EXP_A0(norm_2_except_except_exp_a0),
		.iDATA_EXCEPT_EXP_B0(norm_2_except_except_exp_b0),
		.iDATA_EXCEPT_EXP_A1(norm_2_except_except_exp_a1),
		.iDATA_EXCEPT_EXP_B1(norm_2_except_except_exp_b1),
		.iDATA_EXCEPT_FRACT_A0(norm_2_except_except_fract_a0),
		.iDATA_EXCEPT_FRACT_B0(norm_2_except_except_fract_b0),
		//Output
		.oDATA_VALID(oDATA_VALID),
		.iDATA_BUSY(iDATA_BUSY),
		.oDATA(oDATA)
	);

endmodule


`default_nettype wire

