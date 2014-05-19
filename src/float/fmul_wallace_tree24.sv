`default_nettype none

module fmul_wallace_tree23(
		input wire [22:0] iCAL_DATA0,
		input wire [22:0] iCAL_DATA1,
		output reg [45-1:0] oCAL_DATA
	);

	/*********************************************************
	Type
	*********************************************************/
	typedef struct packed{
		wire c;
		wire d;
	} adder_type;

	/*********************************************************
	Sub Module
	*********************************************************/
	module local_m_fa(
			input wire iC,
			input wire iD0,
			input wire iD1,
			output wire oC,
			output wire oD
		);

		assign oD = iD0 ^ iD1 ^ iC;
		assign oC = iD0 && iD1 || (iD0 ^ iD1) && iC;

	endmodule

	module local_m_ha(
			input wire iD0,
			input wire iD1,
			output wire oC,
			output wire oD
		);

		assign oD = iD0 ^ iD1;
		assign oC = iD0 && iD1;

	endmodule

	/*********************************************************
	Tree(Test)
	*********************************************************/
	/**********************************
	Tree0
	**********************************/
	//Tree0-0
	adder_type [23:0] add_tree0_l0;
	assign add_tree0_l0[0].d = iCAL_DATA0[0] && iCAL_DATA1[0];
	assign add_tree0_l0[0].c = 1'h0;
	local_m_ha ADD0_C1(.iD0(iCAL_DATA0[1] && iCAL_DATA1[0]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[1]), .oC(add_tree0_l0[1].c), .oD(add_tree0_l0[1].d);
	local_m_fa ADD0_C2(.iC(iCAL_DATA0[2] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[2]), .oC(add_tree0_l0[2].c), .oD(add_tree0_l0[2].d);
	local_m_fa ADD0_C3(.iC(iCAL_DATA0[3] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[2]), .oC(add_tree0_l0[3].c), .oD(add_tree0_l0[3].d);
	local_m_fa ADD0_C4_R0(.iC(iCAL_DATA0[4] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[2]), .oC(add_tree0_l0[4].c), .oD(add_tree0_l0[4].d);
	local_m_fa ADD0_C5_R0(.iC(iCAL_DATA0[5] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[2]), .oC(add_tree0_l0[5].c), .oD(add_tree0_l0[5].d);
	local_m_fa ADD0_C6_R0(.iC(iCAL_DATA0[6] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[2]), .oC(add_tree0_l0[6].c), .oD(add_tree0_l0[6].d);
	local_m_fa ADD0_C7_R0(.iC(iCAL_DATA0[7] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[2]), .oC(add_tree0_l0[7].c), .oD(add_tree0_l0[7].d);
	local_m_fa ADD0_C8_R0(.iC(iCAL_DATA0[8] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[2]), .oC(add_tree0_l0[8].c), .oD(add_tree0_l0[8].d);
	local_m_fa ADD0_C9_R0(.iC(iCAL_DATA0[9] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[2]), .oC(add_tree0_l0[9].c), .oD(add_tree0_l0[9].d);
	local_m_fa ADD0_C10_R0(.iC(iCAL_DATA0[10] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[2]), .oC(add_tree0_l0[10].c), .oD(add_tree0_l0[10].d);
	local_m_fa ADD0_C11_R0(.iC(iCAL_DATA0[11] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[2]), .oC(add_tree0_l0[11].c), .oD(add_tree0_l0[11].d);
	local_m_fa ADD0_C12_R0(.iC(iCAL_DATA0[12] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[2]), .oC(add_tree0_l0[12].c), .oD(add_tree0_l0[12].d);
	local_m_fa ADD0_C13_R0(.iC(iCAL_DATA0[13] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[2]), .oC(add_tree0_l0[13].c), .oD(add_tree0_l0[13].d);
	local_m_fa ADD0_C14_R0(.iC(iCAL_DATA0[14] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[2]), .oC(add_tree0_l0[14].c), .oD(add_tree0_l0[14].d);
	local_m_fa ADD0_C15_R0(.iC(iCAL_DATA0[15] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[2]), .oC(add_tree0_l0[15].c), .oD(add_tree0_l0[15].d);
	local_m_fa ADD0_C16_R0(.iC(iCAL_DATA0[16] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[2]), .oC(add_tree0_l0[16].c), .oD(add_tree0_l0[16].d);
	local_m_fa ADD0_C17_R0(.iC(iCAL_DATA0[17] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[2]), .oC(add_tree0_l0[17].c), .oD(add_tree0_l0[17].d);
	local_m_fa ADD0_C18_R0(.iC(iCAL_DATA0[18] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[2]), .oC(add_tree0_l0[18].c), .oD(add_tree0_l0[18].d);
	local_m_fa ADD0_C19_R0(.iC(iCAL_DATA0[19] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[2]), .oC(add_tree0_l0[19].c), .oD(add_tree0_l0[19].d);
	local_m_fa ADD0_C20_R0(.iC(iCAL_DATA0[20] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[2]), .oC(add_tree0_l0[20].c), .oD(add_tree0_l0[20].d);
	local_m_fa ADD0_C21_R0(.iC(iCAL_DATA0[21] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[2]), .oC(add_tree0_l0[21].c), .oD(add_tree0_l0[21].d);
	local_m_fa ADD0_C22_R0(.iC(iCAL_DATA0[22] && iCAL_DATA1[0]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[2]), .oC(add_tree0_l0[22].c), .oD(add_tree0_l0[22].d);
	local_m_ha ADD0_C23_R0(.iD0(iCAL_DATA0[22] && iCAL_DATA1[1]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[2]), .oC(add_tree0_l0[23].c), .oD(add_tree0_l0[23].d);
	//Tree0-1
	adder_type [23:0] add_tree0_l1;
	assign add_tree0_l1[0].d = iCAL_DATA0[0] && iCAL_DATA1[3];
	assign add_tree0_l1[0].c = 1'h0;
	local_m_ha ADD0_C4_R1(.iD0(iCAL_DATA0[1] && iCAL_DATA1[3]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[4]), .oC(add_tree0_l1[1].c), .oD(add_tree0_l1[1].d);
	local_m_fa ADD0_C5_R1(.iC(iCAL_DATA0[2] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[5]), .oC(add_tree0_l1[2].c), .oD(add_tree0_l1[2].d);
	local_m_fa ADD0_C6_R1(.iC(iCAL_DATA0[3] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[5]), .oC(add_tree0_l1[3].c), .oD(add_tree0_l1[3].d);
	local_m_fa ADD0_C7_R1(.iC(iCAL_DATA0[4] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[5]), .oC(add_tree0_l1[4].c), .oD(add_tree0_l1[4].d);
	local_m_fa ADD0_C8_R1(.iC(iCAL_DATA0[5] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[5]), .oC(add_tree0_l1[5].c), .oD(add_tree0_l1[5].d);
	local_m_fa ADD0_C9_R1(.iC(iCAL_DATA0[6] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[5]), .oC(add_tree0_l1[6].c), .oD(add_tree0_l1[6].d);
	local_m_fa ADD0_C10_R1(.iC(iCAL_DATA0[7] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[5]), .oC(add_tree0_l1[7].c), .oD(add_tree0_l1[7].d);
	local_m_fa ADD0_C11_R1(.iC(iCAL_DATA0[8] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[5]), .oC(add_tree0_l1[8].c), .oD(add_tree0_l1[8].d);
	local_m_fa ADD0_C12_R1(.iC(iCAL_DATA0[9] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[5]), .oC(add_tree0_l1[9].c), .oD(add_tree0_l1[9].d);
	local_m_fa ADD0_C13_R1(.iC(iCAL_DATA0[10] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[5]), .oC(add_tree0_l1[10].c), .oD(add_tree0_l1[10].d);
	local_m_fa ADD0_C14_R1(.iC(iCAL_DATA0[11] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[5]), .oC(add_tree0_l1[11].c), .oD(add_tree0_l1[11].d);
	local_m_fa ADD0_C15_R1(.iC(iCAL_DATA0[12] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[5]), .oC(add_tree0_l1[12].c), .oD(add_tree0_l1[12].d);
	local_m_fa ADD0_C16_R1(.iC(iCAL_DATA0[13] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[5]), .oC(add_tree0_l1[13].c), .oD(add_tree0_l1[13].d);
	local_m_fa ADD0_C17_R1(.iC(iCAL_DATA0[14] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[5]), .oC(add_tree0_l1[14].c), .oD(add_tree0_l1[14].d);
	local_m_fa ADD0_C18_R1(.iC(iCAL_DATA0[15] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[5]), .oC(add_tree0_l1[15].c), .oD(add_tree0_l1[15].d);
	local_m_fa ADD0_C19_R1(.iC(iCAL_DATA0[16] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[5]), .oC(add_tree0_l1[16].c), .oD(add_tree0_l1[16].d);
	local_m_fa ADD0_C20_R1(.iC(iCAL_DATA0[17] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[5]), .oC(add_tree0_l1[17].c), .oD(add_tree0_l1[17].d);
	local_m_fa ADD0_C21_R1(.iC(iCAL_DATA0[18] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[5]), .oC(add_tree0_l1[18].c), .oD(add_tree0_l1[18].d);
	local_m_fa ADD0_C22_R1(.iC(iCAL_DATA0[19] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[5]), .oC(add_tree0_l1[19].c), .oD(add_tree0_l1[19].d);
	local_m_fa ADD0_C23_R1(.iC(iCAL_DATA0[20] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[5]), .oC(add_tree0_l1[20].c), .oD(add_tree0_l1[20].d);
	local_m_fa ADD0_C24_R1(.iC(iCAL_DATA0[21] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[5]), .oC(add_tree0_l1[21].c), .oD(add_tree0_l1[21].d);
	local_m_fa ADD0_C25_R1(.iC(iCAL_DATA0[22] && iCAL_DATA1[3]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[5]), .oC(add_tree0_l1[22].c), .oD(add_tree0_l1[22].d);
	local_m_ha ADD0_C26_R1(.iD0(iCAL_DATA0[22] && iCAL_DATA1[4]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[5]), .oC(add_tree0_l1[23].c), .oD(add_tree0_l1[23].d);
	//Tree0-2
	adder_type [23:0] add_tree0_l2;
	assign add_tree0_l2[0].d = iCAL_DATA0[0] && iCAL_DATA1[6];
	assign add_tree0_l2[0].c = 1'h0;
	local_m_ha ADD0_C7_R2(.iD0(iCAL_DATA0[1] && iCAL_DATA1[6]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[7]), .oC(add_tree0_l2[1].c), .oD(add_tree0_l2[1].d);
	local_m_fa ADD0_C8_R2(.iC(iCAL_DATA0[2] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[8]), .oC(add_tree0_l2[2].c), .oD(add_tree0_l2[2].d);
	local_m_fa ADD0_C9_R2(.iC(iCAL_DATA0[3] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[8]), .oC(add_tree0_l2[3].c), .oD(add_tree0_l2[3].d);
	local_m_fa ADD0_C10_R2(.iC(iCAL_DATA0[4] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[8]), .oC(add_tree0_l2[4].c), .oD(add_tree0_l2[4].d);
	local_m_fa ADD0_C11_R2(.iC(iCAL_DATA0[5] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[8]), .oC(add_tree0_l2[5].c), .oD(add_tree0_l2[5].d);
	local_m_fa ADD0_C12_R2(.iC(iCAL_DATA0[6] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[8]), .oC(add_tree0_l2[6].c), .oD(add_tree0_l2[6].d);
	local_m_fa ADD0_C13_R2(.iC(iCAL_DATA0[7] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[8]), .oC(add_tree0_l2[7].c), .oD(add_tree0_l2[7].d);
	local_m_fa ADD0_C14_R2(.iC(iCAL_DATA0[8] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[8]), .oC(add_tree0_l2[8].c), .oD(add_tree0_l2[8].d);
	local_m_fa ADD0_C15_R2(.iC(iCAL_DATA0[9] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[8]), .oC(add_tree0_l2[9].c), .oD(add_tree0_l2[9].d);
	local_m_fa ADD0_C16_R2(.iC(iCAL_DATA0[10] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[8]), .oC(add_tree0_l2[10].c), .oD(add_tree0_l2[10].d);
	local_m_fa ADD0_C17_R2(.iC(iCAL_DATA0[11] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[8]), .oC(add_tree0_l2[11].c), .oD(add_tree0_l2[11].d);
	local_m_fa ADD0_C18_R2(.iC(iCAL_DATA0[12] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[8]), .oC(add_tree0_l2[12].c), .oD(add_tree0_l2[12].d);
	local_m_fa ADD0_C19_R2(.iC(iCAL_DATA0[13] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[8]), .oC(add_tree0_l2[13].c), .oD(add_tree0_l2[13].d);
	local_m_fa ADD0_C20_R2(.iC(iCAL_DATA0[14] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[8]), .oC(add_tree0_l2[14].c), .oD(add_tree0_l2[14].d);
	local_m_fa ADD0_C21_R2(.iC(iCAL_DATA0[15] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[8]), .oC(add_tree0_l2[15].c), .oD(add_tree0_l2[15].d);
	local_m_fa ADD0_C22_R2(.iC(iCAL_DATA0[16] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[8]), .oC(add_tree0_l2[16].c), .oD(add_tree0_l2[16].d);
	local_m_fa ADD0_C23_R2(.iC(iCAL_DATA0[17] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[8]), .oC(add_tree0_l2[17].c), .oD(add_tree0_l2[17].d);
	local_m_fa ADD0_C24_R2(.iC(iCAL_DATA0[18] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[8]), .oC(add_tree0_l2[18].c), .oD(add_tree0_l2[18].d);
	local_m_fa ADD0_C25_R2(.iC(iCAL_DATA0[19] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[8]), .oC(add_tree0_l2[19].c), .oD(add_tree0_l2[19].d);
	local_m_fa ADD0_C26_R2(.iC(iCAL_DATA0[20] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[8]), .oC(add_tree0_l2[20].c), .oD(add_tree0_l2[20].d);
	local_m_fa ADD0_C27_R2(.iC(iCAL_DATA0[21] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[8]), .oC(add_tree0_l2[21].c), .oD(add_tree0_l2[21].d);
	local_m_fa ADD0_C28_R2(.iC(iCAL_DATA0[22] && iCAL_DATA1[6]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[8]), .oC(add_tree0_l2[22].c), .oD(add_tree0_l2[22].d);
	local_m_ha ADD0_C29_R2(.iD0(iCAL_DATA0[22] && iCAL_DATA1[7]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[8]), .oC(add_tree0_l2[23].c), .oD(add_tree0_l2[23].d);
	//Tree0-3
	adder_type [23:0] add_tree0_l3;
	assign add_tree0_l3[0].d = iCAL_DATA0[0] && iCAL_DATA1[9];
	assign add_tree0_l3[0].c = 1'h0;
	local_m_ha ADD0_C10_R3(.iD0(iCAL_DATA0[1] && iCAL_DATA1[9]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[10]), .oC(add_tree0_l3[1].c), .oD(add_tree0_l3[1].d);
	local_m_fa ADD0_C11_R3(.iC(iCAL_DATA0[2] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[11]), .oC(add_tree0_l3[2].c), .oD(add_tree0_l3[2].d);
	local_m_fa ADD0_C12_R3(.iC(iCAL_DATA0[3] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[11]), .oC(add_tree0_l3[3].c), .oD(add_tree0_l3[3].d);
	local_m_fa ADD0_C13_R3(.iC(iCAL_DATA0[4] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[11]), .oC(add_tree0_l3[4].c), .oD(add_tree0_l3[4].d);
	local_m_fa ADD0_C14_R3(.iC(iCAL_DATA0[5] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[11]), .oC(add_tree0_l3[5].c), .oD(add_tree0_l3[5].d);
	local_m_fa ADD0_C15_R3(.iC(iCAL_DATA0[6] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[11]), .oC(add_tree0_l3[6].c), .oD(add_tree0_l3[6].d);
	local_m_fa ADD0_C16_R3(.iC(iCAL_DATA0[7] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[11]), .oC(add_tree0_l3[7].c), .oD(add_tree0_l3[7].d);
	local_m_fa ADD0_C17_R3(.iC(iCAL_DATA0[8] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[11]), .oC(add_tree0_l3[8].c), .oD(add_tree0_l3[8].d);
	local_m_fa ADD0_C18_R3(.iC(iCAL_DATA0[9] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[11]), .oC(add_tree0_l3[9].c), .oD(add_tree0_l3[9].d);
	local_m_fa ADD0_C19_R3(.iC(iCAL_DATA0[10] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[11]), .oC(add_tree0_l3[10].c), .oD(add_tree0_l3[10].d);
	local_m_fa ADD0_C20_R3(.iC(iCAL_DATA0[11] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[11]), .oC(add_tree0_l3[11].c), .oD(add_tree0_l3[11].d);
	local_m_fa ADD0_C21_R3(.iC(iCAL_DATA0[12] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[11]), .oC(add_tree0_l3[12].c), .oD(add_tree0_l3[12].d);
	local_m_fa ADD0_C22_R3(.iC(iCAL_DATA0[13] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[11]), .oC(add_tree0_l3[13].c), .oD(add_tree0_l3[13].d);
	local_m_fa ADD0_C23_R3(.iC(iCAL_DATA0[14] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[11]), .oC(add_tree0_l3[14].c), .oD(add_tree0_l3[14].d);
	local_m_fa ADD0_C24_R3(.iC(iCAL_DATA0[15] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[11]), .oC(add_tree0_l3[15].c), .oD(add_tree0_l3[15].d);
	local_m_fa ADD0_C25_R3(.iC(iCAL_DATA0[16] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[11]), .oC(add_tree0_l3[16].c), .oD(add_tree0_l3[16].d);
	local_m_fa ADD0_C26_R3(.iC(iCAL_DATA0[17] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[11]), .oC(add_tree0_l3[17].c), .oD(add_tree0_l3[17].d);
	local_m_fa ADD0_C27_R3(.iC(iCAL_DATA0[18] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[11]), .oC(add_tree0_l3[18].c), .oD(add_tree0_l3[18].d);
	local_m_fa ADD0_C28_R3(.iC(iCAL_DATA0[19] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[11]), .oC(add_tree0_l3[19].c), .oD(add_tree0_l3[19].d);
	local_m_fa ADD0_C29_R3(.iC(iCAL_DATA0[20] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[11]), .oC(add_tree0_l3[20].c), .oD(add_tree0_l3[20].d);
	local_m_fa ADD0_C30_R3(.iC(iCAL_DATA0[21] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[11]), .oC(add_tree0_l3[21].c), .oD(add_tree0_l3[21].d);
	local_m_fa ADD0_C31_R3(.iC(iCAL_DATA0[22] && iCAL_DATA1[9]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[11]), .oC(add_tree0_l3[22].c), .oD(add_tree0_l3[22].d);
	local_m_ha ADD0_C32_R3(.iD0(iCAL_DATA0[22] && iCAL_DATA1[10]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[11]), .oC(add_tree0_l3[23].c), .oD(add_tree0_l3[23].d);
	//Tree0-4
	adder_type [23:0] add_tree0_l4;
	assign add_tree0_l4[0].d = iCAL_DATA0[0] && iCAL_DATA1[12];
	assign add_tree0_l4[0].c = 1'h0;
	local_m_ha ADD0_C13_R4(.iD0(iCAL_DATA0[1] && iCAL_DATA1[12]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[13]), .oC(add_tree0_l4[1].c), .oD(add_tree0_l4[1].d);
	local_m_fa ADD0_C14_R4(.iC(iCAL_DATA0[2] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[14]), .oC(add_tree0_l4[2].c), .oD(add_tree0_l4[2].d);
	local_m_fa ADD0_C15_R4(.iC(iCAL_DATA0[3] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[14]), .oC(add_tree0_l4[3].c), .oD(add_tree0_l4[3].d);
	local_m_fa ADD0_C16_R4(.iC(iCAL_DATA0[4] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[14]), .oC(add_tree0_l4[4].c), .oD(add_tree0_l4[4].d);
	local_m_fa ADD0_C17_R4(.iC(iCAL_DATA0[5] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[14]), .oC(add_tree0_l4[5].c), .oD(add_tree0_l4[5].d);
	local_m_fa ADD0_C18_R4(.iC(iCAL_DATA0[6] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[14]), .oC(add_tree0_l4[6].c), .oD(add_tree0_l4[6].d);
	local_m_fa ADD0_C19_R4(.iC(iCAL_DATA0[7] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[14]), .oC(add_tree0_l4[7].c), .oD(add_tree0_l4[7].d);
	local_m_fa ADD0_C20_R4(.iC(iCAL_DATA0[8] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[14]), .oC(add_tree0_l4[8].c), .oD(add_tree0_l4[8].d);
	local_m_fa ADD0_C21_R4(.iC(iCAL_DATA0[9] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[14]), .oC(add_tree0_l4[9].c), .oD(add_tree0_l4[9].d);
	local_m_fa ADD0_C22_R4(.iC(iCAL_DATA0[10] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[14]), .oC(add_tree0_l4[10].c), .oD(add_tree0_l4[10].d);
	local_m_fa ADD0_C23_R4(.iC(iCAL_DATA0[11] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[14]), .oC(add_tree0_l4[11].c), .oD(add_tree0_l4[11].d);
	local_m_fa ADD0_C24_R4(.iC(iCAL_DATA0[12] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[14]), .oC(add_tree0_l4[12].c), .oD(add_tree0_l4[12].d);
	local_m_fa ADD0_C25_R4(.iC(iCAL_DATA0[13] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[14]), .oC(add_tree0_l4[13].c), .oD(add_tree0_l4[13].d);
	local_m_fa ADD0_C26_R4(.iC(iCAL_DATA0[14] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[14]), .oC(add_tree0_l4[14].c), .oD(add_tree0_l4[14].d);
	local_m_fa ADD0_C27_R4(.iC(iCAL_DATA0[15] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[14]), .oC(add_tree0_l4[15].c), .oD(add_tree0_l4[15].d);
	local_m_fa ADD0_C28_R4(.iC(iCAL_DATA0[16] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[14]), .oC(add_tree0_l4[16].c), .oD(add_tree0_l4[16].d);
	local_m_fa ADD0_C29_R4(.iC(iCAL_DATA0[17] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[14]), .oC(add_tree0_l4[17].c), .oD(add_tree0_l4[17].d);
	local_m_fa ADD0_C30_R4(.iC(iCAL_DATA0[18] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[14]), .oC(add_tree0_l4[18].c), .oD(add_tree0_l4[18].d);
	local_m_fa ADD0_C31_R4(.iC(iCAL_DATA0[19] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[14]), .oC(add_tree0_l4[19].c), .oD(add_tree0_l4[19].d);
	local_m_fa ADD0_C32_R4(.iC(iCAL_DATA0[20] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[14]), .oC(add_tree0_l4[20].c), .oD(add_tree0_l4[20].d);
	local_m_fa ADD0_C33_R4(.iC(iCAL_DATA0[21] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[14]), .oC(add_tree0_l4[21].c), .oD(add_tree0_l4[21].d);
	local_m_fa ADD0_C34_R4(.iC(iCAL_DATA0[22] && iCAL_DATA1[12]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[14]), .oC(add_tree0_l4[22].c), .oD(add_tree0_l4[22].d);
	local_m_ha ADD0_C35_R4(.iD0(iCAL_DATA0[22] && iCAL_DATA1[13]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[14]), .oC(add_tree0_l4[23].c), .oD(add_tree0_l4[23].d);
	//Tree0-5
	adder_type [23:0] add_tree0_l5;
	assign add_tree0_l5[0].d = iCAL_DATA0[0] && iCAL_DATA1[15];
	assign add_tree0_l5[0].c = 1'h0;
	local_m_ha ADD0_C16_R5(.iD0(iCAL_DATA0[1] && iCAL_DATA1[15]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[16]), .oC(add_tree0_l5[1].c), .oD(add_tree0_l5[1].d);
	local_m_fa ADD0_C17_R5(.iC(iCAL_DATA0[2] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[17]), .oC(add_tree0_l5[2].c), .oD(add_tree0_l5[2].d);
	local_m_fa ADD0_C18_R5(.iC(iCAL_DATA0[3] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[17]), .oC(add_tree0_l5[3].c), .oD(add_tree0_l5[3].d);
	local_m_fa ADD0_C19_R5(.iC(iCAL_DATA0[4] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[17]), .oC(add_tree0_l5[4].c), .oD(add_tree0_l5[4].d);
	local_m_fa ADD0_C20_R5(.iC(iCAL_DATA0[5] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[17]), .oC(add_tree0_l5[5].c), .oD(add_tree0_l5[5].d);
	local_m_fa ADD0_C21_R5(.iC(iCAL_DATA0[6] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[17]), .oC(add_tree0_l5[6].c), .oD(add_tree0_l5[6].d);
	local_m_fa ADD0_C22_R5(.iC(iCAL_DATA0[7] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[17]), .oC(add_tree0_l5[7].c), .oD(add_tree0_l5[7].d);
	local_m_fa ADD0_C23_R5(.iC(iCAL_DATA0[8] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[17]), .oC(add_tree0_l5[8].c), .oD(add_tree0_l5[8].d);
	local_m_fa ADD0_C24_R5(.iC(iCAL_DATA0[9] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[17]), .oC(add_tree0_l5[9].c), .oD(add_tree0_l5[9].d);
	local_m_fa ADD0_C25_R5(.iC(iCAL_DATA0[10] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[17]), .oC(add_tree0_l5[10].c), .oD(add_tree0_l5[10].d);
	local_m_fa ADD0_C26_R5(.iC(iCAL_DATA0[11] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[17]), .oC(add_tree0_l5[11].c), .oD(add_tree0_l5[11].d);
	local_m_fa ADD0_C27_R5(.iC(iCAL_DATA0[12] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[17]), .oC(add_tree0_l5[12].c), .oD(add_tree0_l5[12].d);
	local_m_fa ADD0_C28_R5(.iC(iCAL_DATA0[13] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[17]), .oC(add_tree0_l5[13].c), .oD(add_tree0_l5[13].d);
	local_m_fa ADD0_C29_R5(.iC(iCAL_DATA0[14] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[17]), .oC(add_tree0_l5[14].c), .oD(add_tree0_l5[14].d);
	local_m_fa ADD0_C30_R5(.iC(iCAL_DATA0[15] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[17]), .oC(add_tree0_l5[15].c), .oD(add_tree0_l5[15].d);
	local_m_fa ADD0_C31_R5(.iC(iCAL_DATA0[16] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[17]), .oC(add_tree0_l5[16].c), .oD(add_tree0_l5[16].d);
	local_m_fa ADD0_C32_R5(.iC(iCAL_DATA0[17] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[17]), .oC(add_tree0_l5[17].c), .oD(add_tree0_l5[17].d);
	local_m_fa ADD0_C33_R5(.iC(iCAL_DATA0[18] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[17]), .oC(add_tree0_l5[18].c), .oD(add_tree0_l5[18].d);
	local_m_fa ADD0_C34_R5(.iC(iCAL_DATA0[19] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[17]), .oC(add_tree0_l5[19].c), .oD(add_tree0_l5[19].d);
	local_m_fa ADD0_C35_R5(.iC(iCAL_DATA0[20] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[17]), .oC(add_tree0_l5[20].c), .oD(add_tree0_l5[20].d);
	local_m_fa ADD0_C36_R5(.iC(iCAL_DATA0[21] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[17]), .oC(add_tree0_l5[21].c), .oD(add_tree0_l5[21].d);
	local_m_fa ADD0_C37_R5(.iC(iCAL_DATA0[22] && iCAL_DATA1[15]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[17]), .oC(add_tree0_l5[22].c), .oD(add_tree0_l5[22].d);
	local_m_ha ADD0_C38_R5(.iD0(iCAL_DATA0[22] && iCAL_DATA1[16]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[17]), .oC(add_tree0_l5[23].c), .oD(add_tree0_l5[23].d);
	//Tree0-6
	adder_type [22:0] add_tree0_l6;		//-1 last not 2 input
	assign add_tree0_l6[0].d = iCAL_DATA0[0] && iCAL_DATA1[18];
	assign add_tree0_l6[0].c = 1'h0;
	local_m_ha ADD0_C19_R6(.iD0(iCAL_DATA0[1] && iCAL_DATA1[18]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[19]), .oC(add_tree0_l6[1].c), .oD(add_tree0_l6[1].d);
	local_m_fa ADD0_C20_R6(.iC(iCAL_DATA0[2] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[2] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[20]), .oC(add_tree0_l6[2].c), .oD(add_tree0_l6[2].d);
	local_m_fa ADD0_C21_R6(.iC(iCAL_DATA0[3] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[3] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[20]), .oC(add_tree0_l6[3].c), .oD(add_tree0_l6[3].d);
	local_m_fa ADD0_C22_R6(.iC(iCAL_DATA0[4] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[4] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[20]), .oC(add_tree0_l6[4].c), .oD(add_tree0_l6[4].d);
	local_m_fa ADD0_C23_R6(.iC(iCAL_DATA0[5] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[5] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[20]), .oC(add_tree0_l6[5].c), .oD(add_tree0_l6[5].d);
	local_m_fa ADD0_C24_R6(.iC(iCAL_DATA0[6] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[6] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[20]), .oC(add_tree0_l6[6].c), .oD(add_tree0_l6[6].d);
	local_m_fa ADD0_C25_R6(.iC(iCAL_DATA0[7] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[7] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[20]), .oC(add_tree0_l6[7].c), .oD(add_tree0_l6[7].d);
	local_m_fa ADD0_C26_R6(.iC(iCAL_DATA0[8] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[8] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[20]), .oC(add_tree0_l6[8].c), .oD(add_tree0_l6[8].d);
	local_m_fa ADD0_C27_R6(.iC(iCAL_DATA0[9] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[9] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[20]), .oC(add_tree0_l6[9].c), .oD(add_tree0_l6[9].d);
	local_m_fa ADD0_C28_R6(.iC(iCAL_DATA0[10] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[10] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[20]), .oC(add_tree0_l6[10].c), .oD(add_tree0_l6[10].d);
	local_m_fa ADD0_C29_R6(.iC(iCAL_DATA0[11] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[11] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[20]), .oC(add_tree0_l6[11].c), .oD(add_tree0_l6[11].d);
	local_m_fa ADD0_C30_R6(.iC(iCAL_DATA0[12] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[12] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[20]), .oC(add_tree0_l6[12].c), .oD(add_tree0_l6[12].d);
	local_m_fa ADD0_C31_R6(.iC(iCAL_DATA0[13] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[13] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[20]), .oC(add_tree0_l6[13].c), .oD(add_tree0_l6[13].d);
	local_m_fa ADD0_C32_R6(.iC(iCAL_DATA0[14] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[14] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[20]), .oC(add_tree0_l6[14].c), .oD(add_tree0_l6[14].d);
	local_m_fa ADD0_C33_R6(.iC(iCAL_DATA0[15] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[15] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[20]), .oC(add_tree0_l6[15].c), .oD(add_tree0_l6[15].d);
	local_m_fa ADD0_C34_R6(.iC(iCAL_DATA0[16] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[16] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[20]), .oC(add_tree0_l6[16].c), .oD(add_tree0_l6[16].d);
	local_m_fa ADD0_C35_R6(.iC(iCAL_DATA0[17] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[17] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[20]), .oC(add_tree0_l6[17].c), .oD(add_tree0_l6[17].d);
	local_m_fa ADD0_C36_R6(.iC(iCAL_DATA0[18] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[18] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[20]), .oC(add_tree0_l6[18].c), .oD(add_tree0_l6[18].d);
	local_m_fa ADD0_C37_R6(.iC(iCAL_DATA0[19] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[19] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[20]), .oC(add_tree0_l6[19].c), .oD(add_tree0_l6[19].d);
	local_m_fa ADD0_C38_R6(.iC(iCAL_DATA0[20] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[20]), .oC(add_tree0_l6[20].c), .oD(add_tree0_l6[20].d);
	local_m_fa ADD0_C39_R6(.iC(iCAL_DATA0[21] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[20]), .oC(add_tree0_l6[21].c), .oD(add_tree0_l6[21].d);
	local_m_fa ADD0_C40_R6(.iC(iCAL_DATA0[22] && iCAL_DATA1[18]), .iD0(iCAL_DATA0[22] && iCAL_DATA1[19]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[20]), .oC(add_tree0_l6[22].c), .oD(add_tree0_l6[22].d);
	//Tree0-7
	adder_type [22:0] add_tree0_l7;
	assign add_tree0_l7[0].d = iCAL_DATA0[0] && iCAL_DATA1[21];
	assign add_tree0_l7[0].c = 1'h0;
	local_m_ha ADD0_C22_R7(.iD0(iCAL_DATA0[1] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[1] && iCAL_DATA1[22]), .oC(add_tree0_l7[1].c), .oD(add_tree0_l7[1].d);
	local_m_ha ADD0_C23_R7(.iD0(iCAL_DATA0[2] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[2] && iCAL_DATA1[22]), .oC(add_tree0_l7[2].c), .oD(add_tree0_l7[2].d);
	local_m_ha ADD0_C24_R7(.iD0(iCAL_DATA0[3] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[3] && iCAL_DATA1[22]), .oC(add_tree0_l7[3].c), .oD(add_tree0_l7[3].d);
	local_m_ha ADD0_C25_R7(.iD0(iCAL_DATA0[4] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[4] && iCAL_DATA1[22]), .oC(add_tree0_l7[4].c), .oD(add_tree0_l7[4].d);
	local_m_ha ADD0_C26_R7(.iD0(iCAL_DATA0[5] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[5] && iCAL_DATA1[22]), .oC(add_tree0_l7[5].c), .oD(add_tree0_l7[5].d);
	local_m_ha ADD0_C27_R7(.iD0(iCAL_DATA0[6] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[6] && iCAL_DATA1[22]), .oC(add_tree0_l7[6].c), .oD(add_tree0_l7[6].d);
	local_m_ha ADD0_C28_R7(.iD0(iCAL_DATA0[7] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[7] && iCAL_DATA1[22]), .oC(add_tree0_l7[7].c), .oD(add_tree0_l7[7].d);
	local_m_ha ADD0_C29_R7(.iD0(iCAL_DATA0[8] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[8] && iCAL_DATA1[22]), .oC(add_tree0_l7[8].c), .oD(add_tree0_l7[8].d);
	local_m_ha ADD0_C30_R7(.iD0(iCAL_DATA0[9] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[9] && iCAL_DATA1[22]), .oC(add_tree0_l7[9].c), .oD(add_tree0_l7[9].d);
	local_m_ha ADD0_C31_R7(.iD0(iCAL_DATA0[10] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[10] && iCAL_DATA1[22]), .oC(add_tree0_l7[10].c), .oD(add_tree0_l7[10].d);
	local_m_ha ADD0_C32_R7(.iD0(iCAL_DATA0[11] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[11] && iCAL_DATA1[22]), .oC(add_tree0_l7[11].c), .oD(add_tree0_l7[11].d);
	local_m_ha ADD0_C33_R7(.iD0(iCAL_DATA0[12] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[12] && iCAL_DATA1[22]), .oC(add_tree0_l7[12].c), .oD(add_tree0_l7[12].d);
	local_m_ha ADD0_C34_R7(.iD0(iCAL_DATA0[13] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[13] && iCAL_DATA1[22]), .oC(add_tree0_l7[13].c), .oD(add_tree0_l7[13].d);
	local_m_ha ADD0_C35_R7(.iD0(iCAL_DATA0[14] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[14] && iCAL_DATA1[22]), .oC(add_tree0_l7[14].c), .oD(add_tree0_l7[14].d);
	local_m_ha ADD0_C36_R7(.iD0(iCAL_DATA0[15] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[15] && iCAL_DATA1[22]), .oC(add_tree0_l7[15].c), .oD(add_tree0_l7[15].d);
	local_m_ha ADD0_C37_R7(.iD0(iCAL_DATA0[16] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[16] && iCAL_DATA1[22]), .oC(add_tree0_l7[16].c), .oD(add_tree0_l7[16].d);
	local_m_ha ADD0_C38_R7(.iD0(iCAL_DATA0[17] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[17] && iCAL_DATA1[22]), .oC(add_tree0_l7[17].c), .oD(add_tree0_l7[17].d);
	local_m_ha ADD0_C39_R7(.iD0(iCAL_DATA0[18] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[18] && iCAL_DATA1[22]), .oC(add_tree0_l7[18].c), .oD(add_tree0_l7[18].d);
	local_m_ha ADD0_C40_R7(.iD0(iCAL_DATA0[19] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[22]), .oC(add_tree0_l7[18].c), .oD(add_tree0_l7[19].d);
	//local_m_ha ADD0_C41_R7(.iD0(iCAL_DATA0[20] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[22]), .oC(add_tree0_l7[19].c), .oD(add_tree0_l7[20].d);
	//local_m_ha ADD0_C42_R7(.iD0(iCAL_DATA0[21] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[21] && iCAL_DATA1[22]), .oC(add_tree0_l7[20].c), .oD(add_tree0_l7[21].d);
	local_m_fa ADD0_C41_R7(.iC(iCAL_DATA0[21] && iCAL_DATA1[20]), .iD0(iCAL_DATA0[20] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[19] && iCAL_DATA1[22]), .oC(add_tree0_l7[20].c), .oD(add_tree0_l7[20].d);
	local_m_fa ADD0_C42_R7(.iC(iCAL_DATA0[22] && iCAL_DATA1[20]), .iD0(iCAL_DATA0[21] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[20] && iCAL_DATA1[22]), .oC(add_tree0_l7[21].c), .oD(add_tree0_l7[21].d);
	local_m_ha ADD0_C43_R7(.iD0(iCAL_DATA0[22] && iCAL_DATA1[21]), .iD1(iCAL_DATA0[22] && iCAL_DATA1[22]), .oC(add_tree0_l7[21].c), .oD(add_tree0_l7[22].d);

	/**********************************
	Tree1
	**********************************/








endmodule

`default_nettype wire

