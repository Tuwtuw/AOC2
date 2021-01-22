onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Yellow /Pratica1_Part2/clock
add wave -noupdate -radix hexadecimal /Pratica1_Part2/rdaddress
add wave -noupdate -color Red -radix decimal /Pratica1_Part2/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
configure wave -valuecolwidth 60
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {615 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/Pratica1/wren 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/Pratica1/wren 
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/Pratica1_Part2/clock 
wave create -driver freeze -pattern constant -value 0 -range 7 0 -starttime 0ps -endtime 1000ps sim:/Pratica1_Part2/data 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/Pratica1_Part2/wren 
wave create -driver freeze -pattern constant -value 0 -range 4 0 -starttime 0ps -endtime 1000ps sim:/Pratica1_Part2/wraddress 
wave create -driver freeze -pattern constant -value 0 -range 4 0 -starttime 0ps -endtime 1000ps sim:/Pratica1_Part2/rdaddress 
wave create -driver freeze -pattern clock -initialvalue Pu1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/Pratica1_Part2/clock 
wave modify -driver freeze -pattern clock -initialvalue Pu1 -period 100ps -dutycycle 50 -starttime 25ps -endtime 1000ps Edit:/Pratica1_Part2/clock 
wave create -driver freeze -pattern counter -startvalue 00000 -endvalue 11111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 4 0 -starttime 0ps -endtime 3200ps sim:/Pratica1_Part2/rdaddress 
WaveExpandAll -1
wave modify -driver freeze -pattern clock -initialvalue Pu1 -period 100ps -dutycycle 50 -starttime 25ps -endtime 3200ps Edit:/Pratica1_Part2/clock 
WaveCollapseAll -1
wave clipboard restore
