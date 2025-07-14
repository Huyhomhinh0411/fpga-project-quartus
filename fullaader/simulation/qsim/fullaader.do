onerror {quit -f}
vlib work
vlog -work work fullaader.vo
vlog -work work fullaader.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.fullaader_vlg_vec_tst
vcd file -direction fullaader.msim.vcd
vcd add -internal fullaader_vlg_vec_tst/*
vcd add -internal fullaader_vlg_vec_tst/i1/*
add wave /*
run -all
