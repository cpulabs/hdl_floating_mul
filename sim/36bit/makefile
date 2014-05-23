
default: riviera

modelsim_wave: 
	vlib work
	vlog -work work -sv tb/tb_36bit.sv
	vlog -work work -sv ../../src/36bit/*.sv
	#vlog -work work comp.v
	vsim -c -voptargs="+acc" tb_36bit -do "radix -hexadecimal; log -r /*; run -all; finish"

modelsim: 
	vlib work
	vlog -work work -sv tb/tb_36bit.sv
	vlog -work work -sv ../../src/36bit/*.sv
	#vlog -work work comp.v
	vsim -c tb_36bit -do "run -all; finish"

riviera: 
	alib -work work
	

	vsimsa -do -c tb_36bit -do "run -all; finish"

riviera_wave: 




