onerror {quit -f}
vlib work
vlog -work work congAND.vo
vlog -work work congAND.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.congAND_vlg_vec_tst
vcd file -direction congAND.msim.vcd
vcd add -internal congAND_vlg_vec_tst/*
vcd add -internal congAND_vlg_vec_tst/i1/*
add wave /*
run -all
