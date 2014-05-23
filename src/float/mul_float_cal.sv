//System Verilog
//2-Latency

`default_nettype none

module mul_float_cal(
		input wire iCLOCK,
		input wire inRESET,
		input wire iRESET_SYNC,
		//Input
		input wire iDATA_REQ,
		output wire oDATA_BUSY,
		input wire [31:0] iDATA_A,
		input wire [31:0] iDATA_B,
		//Output
		output wire oDATA_VALID,
		input wire iDATA_BUSY,
		output wire oDATA_SIGN,
		output wire [9:0] oDATA_EXP,
		output wire [47:0] oDATA_FRACT,
		output wire oDATA_EXCEPT_EXP_A0,
		output wire oDATA_EXCEPT_EXP_B0,
		output wire oDATA_EXCEPT_EXP_A1,
		output wire oDATA_EXCEPT_EXP_B1,
		output wire oDATA_EXCEPT_FRACT_A0,
		output wire oDATA_EXCEPT_FRACT_B0
	);

	/***************************************
	Sub Module
	***************************************/
	module d_latch #(
			parameter PL_N = 8
		)(
			input wire iCLOCK,
			input wire inRESET,
			input wire iRESET_SYNC,
			//Input
			input wire iDATA_REQ,
			output wire oDATA_BUSY,
			input wire [PL_N-1:0] iDATA_DATA,
			//Output
			output wire oDATA_VALID,
			input wire iDATA_BUSY,
			output wire [PL_N-1:0] oDATA_DATA
		);

		reg b_valid;
		reg [PL_N-1:0] b_data;

		always_ff@(posedge iCLOCK or negedge inRESET)begin
			if(!inRESET)begin
				b_valid <= 1'b0;
				b_data <= {PL_N{1'b0}};
			end
			else if(iRESET_SYNC)begin
				b_valid <= 1'b0;
				b_data <= {PL_N{1'b0}};
			end
			else begin
				if(!iDATA_BUSY)begin
					b_valid <= iDATA_REQ;
					b_data <= iDATA_DATA;
				end
			end
		end

		assign oDATA_BUSY = iDATA_BUSY;
		assign oDATA_VALID = b_valid;
		assign oDATA_DATA = b_data;
	endmodule

	/***************************************
	Wire
	***************************************/
	//Input Data
	wire in_data_a_sign = iDATA_A[31];
	wire [7:0] in_data_a_exp = iDATA_A[30:23];
	wire [23:0] in_data_a_fract = {1'b1, iDATA_A[22:0]};
	wire in_data_b_sign = iDATA_B[31];
	wire [7:0] in_data_b_exp = iDATA_B[30:23];
	wire [23:0] in_data_b_fract = {1'b1, iDATA_B[22:0]};

	wire busy_condition;
	wire enable_request_condition = iDATA_REQ && !busy_condition;

	wire stage1_req_condition;
	wire stage1_busy_condition;
	wire stage1_enable_request_condition =  stage1_req_condition && !stage1_busy_condition;
	wire stage1_out_valid;

	/***************************************
	Sign(2-Latency) - Pipeline Master
	***************************************/
	wire cal_result_sign = in_data_a_sign ^ in_data_b_sign;
	wire dff0_result_sign_data;
	wire dff1_result_sign_data;
	d_latch #(1) SIGN_DFF0(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(enable_request_condition),
		.oDATA_BUSY(busy_condition),
		.iDATA_DATA(cal_result_sign),
		.oDATA_VALID(stage1_req_condition),
		.iDATA_BUSY(stage1_busy_condition),
		.oDATA_DATA(dff0_result_sign_data)
	);
	d_latch #(1) SIGN_DFF1(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(stage1_enable_request_condition),
		.oDATA_BUSY(stage1_busy_condition),
		.iDATA_DATA(dff0_result_sign_data),
		.oDATA_VALID(stage1_out_valid),
		.iDATA_BUSY(iDATA_BUSY),
		.oDATA_DATA(dff1_result_sign_data)
	);

	/***************************************
	Exponents(2-Latency)
	***************************************/
	wire [8:0] cal0_result_exp = in_data_a_exp + in_data_b_exp;
	wire [8:0] dff0_result_exp_data;
	wire [9:0] dff1_result_exp_data;
	d_latch #(9) EXP_DFF0(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(enable_request_condition),
		.oDATA_BUSY(),
		.iDATA_DATA(cal0_result_exp),
		.oDATA_VALID(),
		.iDATA_BUSY(stage1_busy_condition),
		.oDATA_DATA(dff0_result_exp_data)
	);
	wire [9:0] cal1_result_exp = {1'b0, dff0_result_exp_data} - 10'd127;
	d_latch #(10) EXP_DFF1(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(stage1_enable_request_condition),
		.oDATA_BUSY(),
		.iDATA_DATA(cal1_result_exp),
		.oDATA_VALID(),
		.iDATA_BUSY(iDATA_BUSY),
		.oDATA_DATA(dff1_result_exp_data)
	);

	/***************************************
	Fraction(2-Latency)
	***************************************/
	//Use Primitive
	wire [47:0] cal0_result_fract = in_data_a_fract * (* multstyle = "dsp" *) in_data_b_fract;		//For Altera
	//wire [45:0] cal0_result_fract = in_data_a_fract * (* mult_style = "block" *) in_data_b_fract;		//For Xilinx
	wire [47:0] dff0_result_fract_data;
	d_latch #(48) FRACT_DFF0(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(enable_request_condition),
		.oDATA_BUSY(),
		.iDATA_DATA(cal0_result_fract),
		.oDATA_VALID(),
		.iDATA_BUSY(stage1_busy_condition),
		.oDATA_DATA(dff0_result_fract_data)
	);
	wire [47:0] dff1_result_fract_data;
	d_latch #(48) FRACT_DFF1(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(stage1_enable_request_condition),
		.oDATA_BUSY(),
		.iDATA_DATA(dff0_result_fract_data),
		.oDATA_VALID(),
		.iDATA_BUSY(iDATA_BUSY),
		.oDATA_DATA(dff1_result_fract_data)
	);


	/***************************************
	Exception(2-Latency)
	***************************************/
	wire cal0_result_except_exp_all_zelo_a = (iDATA_A[30:23] == 8'h0);
	wire cal0_result_except_exp_all_zelo_b = (iDATA_B[30:23] == 8'h0);
	wire cal0_result_except_exp_all_one_a = (iDATA_A[30:23] == 8'hFF);
	wire cal0_result_except_exp_all_one_b = (iDATA_B[30:23] == 8'hFF);
	wire cal0_result_except_fract_all_one_a = (iDATA_A[30:23] != 8'h00);
	wire cal0_result_except_fract_all_one_b = (iDATA_A[30:23] != 8'h00);
	wire [5:0] dff0_result_except_data;
	d_latch #(6) EXCEPT_DFF0(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(enable_request_condition),
		.oDATA_BUSY(),
		.iDATA_DATA(
			{
				cal0_result_except_exp_all_zelo_a,
				cal0_result_except_exp_all_zelo_b,
				cal0_result_except_exp_all_one_a,
				cal0_result_except_exp_all_one_b,
				cal0_result_except_fract_all_one_a,
				cal0_result_except_fract_all_one_b
			}
		),
		.oDATA_VALID(),
		.iDATA_BUSY(stage1_busy_condition),
		.oDATA_DATA(dff0_result_except_data)
	);
	wire [5:0] dff1_result_except_data;
	d_latch #(6) EXCEPT_DFF1(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		.iDATA_REQ(stage1_enable_request_condition),
		.oDATA_BUSY(),
		.iDATA_DATA(dff0_result_except_data),
		.oDATA_VALID(),
		.iDATA_BUSY(iDATA_BUSY),
		.oDATA_DATA(dff1_result_except_data)
	);
	/***************************************
	Output Assignment
	***************************************/
	assign oDATA_BUSY = busy_condition;
	
	assign oDATA_VALID = stage1_out_valid;
	assign oDATA_SIGN = dff1_result_sign_data;
	assign oDATA_EXP = dff1_result_exp_data;
	assign oDATA_FRACT = dff1_result_fract_data;
	assign oDATA_EXCEPT_EXP_A0 = dff1_result_except_data[5];
	assign oDATA_EXCEPT_EXP_B0 = dff1_result_except_data[4];
	assign oDATA_EXCEPT_EXP_A1 = dff1_result_except_data[3];
	assign oDATA_EXCEPT_EXP_B1 = dff1_result_except_data[2];
	assign oDATA_EXCEPT_FRACT_A0 = dff1_result_except_data[1];
	assign oDATA_EXCEPT_FRACT_B0 = dff1_result_except_data[0];

endmodule


`default_nettype wire

