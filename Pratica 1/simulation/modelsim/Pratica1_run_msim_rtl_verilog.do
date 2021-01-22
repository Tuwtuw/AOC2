transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/School/AOC\ 2/Pratica\ 1 {E:/School/AOC 2/Pratica 1/ramlpm.v}
vlog -vlog01compat -work work +incdir+E:/School/AOC\ 2/Pratica\ 1 {E:/School/AOC 2/Pratica 1/Pratica1.v}

