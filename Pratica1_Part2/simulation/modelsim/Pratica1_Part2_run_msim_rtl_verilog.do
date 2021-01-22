transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/School/AOC\ 2/Pratica1_Part2 {E:/School/AOC 2/Pratica1_Part2/Pratica1_Part2.v}
vlog -vlog01compat -work work +incdir+E:/School/AOC\ 2/Pratica1_Part2 {E:/School/AOC 2/Pratica1_Part2/ramlpm.v}

