
default: riviera

modelsim_wave: 
	vlib work
	vlog -work work -sv tb/tb_float.sv
	vlog -work work -sv ../../src/float/*.sv
	#vlog -work work comp.v
	vsim -c -voptargs="+acc" tb_float -do "radix -hexadecimal; log -r /*; run -all; finish"

modelsim: 
	vlib work
	vlog -work work -sv tb/tb_float.sv
	vlog -work work -sv ../../src/float/*.sv
	#vlog -work work comp.v
	vsim -c tb_float -do "run -all; finish"

riviera: 
	alib -work work
	

	vsimsa -do -c tb_float -do "run -all; finish"

riviera_wave: 




