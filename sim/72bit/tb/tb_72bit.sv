`default_nettype none


module tb_72bit;

	parameter P_CYCLE = 20;

	reg iCLOCK;
	reg inRESET;
	reg iRESET_SYNC;
	reg iDATA_REQ;
	wire oDATA_BUSY;
	reg [71:0] iDATA_A;
	reg [71:0] iDATA_B;
	wire oDATA_VALID;
	reg iDATA_BUSY;
	wire [71:0] oDATA;



	/***************************************
	Expect Gen
	***************************************/
	fmul_72bit TARGET(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iRESET_SYNC(iRESET_SYNC),
		//Input
		.iDATA_REQ(iDATA_REQ),
		.oDATA_BUSY(oDATA_BUSY),
		.iDATA_A(iDATA_A),
		.iDATA_B(iDATA_B),
		//Output
		.oDATA_VALID(oDATA_VALID),
		.iDATA_BUSY(iDATA_BUSY),
		.oDATA(oDATA)
	);

	always#(P_CYCLE/2)begin
		iCLOCK = !iCLOCK;
	end

	task tsk_data_req;
		input [71:0] tsk_data_a;
		input [71:0] tsk_data_b;
		begin
			iDATA_REQ = 1'b1;
			iDATA_A = tsk_data_a;
			iDATA_B = tsk_data_b;
			while(oDATA_BUSY)begin
				#(P_CYCLE);
			end
			#(P_CYCLE);
			iDATA_REQ = 1'h0;
			#(P_CYCLE);
		end
	endtask


	/***************************************
	Request Queue
	***************************************/
	reg [71:0] expect_fifo[$];

	task tsk_fifo_push;
		input [71:0] tsk_data_write;
		begin
			expect_fifo.push_front(tsk_data_write);
		end
	endtask

	task tsk_fifo_pop;
		output [71:0] tsk_data_read;
		begin
			tsk_data_read = expect_fifo.pop_back();
		end
	endtask

	integer req_counter;
	integer get_counter;

	initial begin
		#(0);
		iCLOCK = 1'b0;
		inRESET = 1'b0;
		iRESET_SYNC = 1'h0;
		iDATA_REQ = 1'h0;
		iDATA_A = 72'h0;
		iDATA_B = 72'h0;
		iDATA_BUSY = 1'h0;
		#(1);
		inRESET = 1'b1;
		req_counter = 0;
		get_counter = 0;

		#(P_CYCLE*5);
		tsk_data_req(72'h3ff000000000000000, 72'h3ff000000000000000);	//1, 1
		tsk_fifo_push(72'h3ff000000000000000);

		tsk_data_req(72'h3ff000000000000000, 72'h400000000000000000);	//1, 2
		tsk_fifo_push(72'h400000000000000000);

		tsk_data_req(72'h3ff000000000000000, 72'h3fe000000000000000);	//1, 0.5
		tsk_fifo_push(72'h3fe000000000000000);

		tsk_data_req(72'h3ff000000000000000, 72'h3fe800000000000000);	//1, 0.75
		tsk_fifo_push(72'h3fe800000000000000);

		tsk_data_req(72'h3fe000000000000000, 72'h400000000000000000);	//0.5, 2
		tsk_fifo_push(72'h3ff000000000000000);





/*
		tsk_data_req(32'h7f800000, 32'h3e200000);	//1, 0.1562
		//tsk_fifo_push(expect_data);
		tsk_fifo_push(32'h7f800000);

		tsk_data_req(32'h7f800000, 32'hc2ed4000);	//1, -118.625
		//tsk_fifo_push(expect_data);
		tsk_fifo_push(32'hff800000);

		tsk_data_req(32'hc2ed4000, 32'hc2ed4000);	//-118.625, -118.625
		//tsk_fifo_push(expect_data);
		tsk_fifo_push(32'h465bdf90);

		tsk_data_req(32'h3e200000, 32'h3e200000);	//0.1562, 0.1562
		//tsk_fifo_push(expect_data);
		tsk_fifo_push(32'h3cc80000);

		tsk_data_req(32'h3e200000, 32'hc2ed4000);	//0.1562, -118.625
		//tsk_fifo_push(expect_data);
		tsk_fifo_push(32'hc1944800);
*/
	end

	//Assertion
	reg [71:0] fifo_data_cuur;
	always@(posedge iCLOCK or negedge inRESET)begin
		if(inRESET && !iRESET_SYNC)begin
			if(!iDATA_BUSY && oDATA_VALID)begin
				tsk_fifo_pop(fifo_data_cuur);
				if(fifo_data_cuur == oDATA)begin
					$display("[INF]Expect=%x, Result=%x | Compale OK!", fifo_data_cuur, oDATA);
				end
				else begin
					$display("[ERR]Expect=%x, Result=%x | Compale NG!", fifo_data_cuur, oDATA);
					$finish;
				end
			end
		end
	end

	always@(posedge iCLOCK or negedge inRESET)begin
		if(inRESET && !iRESET_SYNC && !oDATA_BUSY && iDATA_REQ)begin
			req_counter = req_counter + 1;
		end
		if(inRESET && !iRESET_SYNC && !iDATA_BUSY && oDATA_VALID)begin
			get_counter = get_counter + 1;
		end
	end

	always@(posedge iCLOCK)begin
		if(get_counter != 0 && get_counter == req_counter)begin
			$display("Simulation Finish");
			$finish;
		end
	end

endmodule

`default_nettype wire

