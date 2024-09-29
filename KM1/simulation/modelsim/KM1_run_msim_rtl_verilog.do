transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/KM1_1 {D:/KM1_1/par_posl_adder_param.sv}
vlog -sv -work work +incdir+D:/KM1_1 {D:/KM1_1/unit_latch.sv}
vlog -sv -work work +incdir+D:/KM1_1 {D:/KM1_1/register.sv}
vlog -sv -work work +incdir+D:/KM1_1 {D:/KM1_1/full_adder.sv}
vlog -sv -work work +incdir+D:/KM1_1 {D:/KM1_1/bit_8_adder.sv}
vlog -sv -work work +incdir+D:/KM1_1 {D:/KM1_1/par_posl_top.sv}

vlog -sv -work work +incdir+D:/KM1_1/output_files {D:/KM1_1/output_files/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
