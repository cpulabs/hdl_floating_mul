
default: riviera

modelsim_wave: 
	vlib work
	vlog -work work -sv tb/tb_72bit.sv
	vlog -work work -sv ../../src/72bit/*.sv
	#vlog -work work comp.v
	vsim -c -voptargs="+acc" tb_72bit -do "radix -hexadecimal; log -r /*; run -all; finish"

modelsim: 
	vlib work
	vlog -work work -sv tb/tb_72bit.sv
	vlog -work work -sv ../../src/72bit/*.sv
	#vlog -work work comp.v
	vsim -c tb_72bit -do "run -all; finish"

riviera: 
	alib -work work
	

	vsimsa -do -c tb_72bit -do "run -all; finish"

riviera_wave: 




