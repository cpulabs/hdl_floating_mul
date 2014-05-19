//System Verilog

`default_nettype none

module mul_float(
		input wire iCLOCK,
		input wire inRESET,
		input wire iRESET_SYNC,
		//Input
		input wire [31:0] iDATA_A,
		input wire [31:0] iDATA_B,
	);

	/***************************************
	Type 
	***************************************/
	typedef struct{
		wire sign;
		wire [7:0] exp;
		wire [22:0] fract;
	} ieee754_float;

	
	/***************************************
	Sub Module 
	***************************************/
	module d_latch #(
			parameter PL_N = 8;
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
	ieee754_float in_data_a, in_data_b;
	//Input Data
	in_data_a.sign = iDATA_A[31];
	in_data_a.exp = iDATA_A[30:23];
	in_data_a.fract = iDATA_A[22:0];
	in_data_b.sign = iDATA_B[31];
	in_data_b.exp = iDATA_B[30:23];
	in_data_b.fract = iDATA_B[22:0];

	/***************************************
	Sign(2-Latency)
	***************************************/
	wire cal_result_sign = in_data_a.sign ^ in_data_b.sign;
	wire dff0_result_sign_data;
	wire dff1_result_sign_data;
	wire dff0_result_sign_valid;
	wire dff1_result_sign_busy;
	d_latch #(1) SIGN_DFF0(.iCLOCK(iCLOCK), .inRESET(inRESET), .iRESET_SYNC(iRESET_SYNC), .iDATA_REQ(), .oDATA_BUSY(), .iDATA_DATA(cal_result_sign), .oDATA_VALID(dff0_result_sign_valid), .iDATA_BUSY(dff1_result_sign_busy), .oDATA_DATA(dff0_result_sign_data));
	d_latch #(1) SIGN_DFF1(.iCLOCK(iCLOCK), .inRESET(inRESET), .iRESET_SYNC(iRESET_SYNC), .iDATA_REQ(), .oDATA_BUSY(dff1_result_sign_busy), .iDATA_DATA(), .oDATA_VALID(), .iDATA_BUSY(), .oDATA_DATA());

	/***************************************
	Exponents(2-Latency)
	***************************************/
	wire [8:0] cal0_result_exp = in_data_a.exp + in_data_b.exp;
	wire [8:0] dff0_result_data;
	d_latch #(9) EXP_DFF0(.iCLOCK(iCLOCK), .inRESET(inRESET), .iRESET_SYNC(iRESET_SYNC), .iDATA_REQ(), .oDATA_BUSY(), .iDATA_DATA(cal0_result_exp), .oDATA_VALID(), .iDATA_BUSY(), .oDATA_DATA(dff0_result_data));
	wire [9:0] cal1_result_exp = {1'b0, dff0_result_data} - 10'd127;
	d_latch #(10) EXP_DFF1(.iCLOCK(iCLOCK), .inRESET(inRESET), .iRESET_SYNC(iRESET_SYNC), .iDATA_REQ(), .oDATA_BUSY(), .iDATA_DATA(cal1_result_exp), .oDATA_VALID(), .iDATA_BUSY(), .oDATA_DATA());

	/***************************************
	Fraction(2-Latency)
	***************************************/


endmodule


`default_nettype wire 

