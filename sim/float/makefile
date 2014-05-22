
default: riviera

modelsim: 
	vlib work
	#vmap -work work
	vlog -work work -sv tb/tb_float.sv
	vlog -work work -sv ../../src/float/*.sv
	vsim -c tb_float -do "run -all; finish"

modelsim_wave: 

riviera: 
	alib -work work
	

	vsimsa -do -c tb_float -do "run -all; finish"

riviera_wave: 




