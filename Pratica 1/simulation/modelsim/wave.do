onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Yellow /Pratica1/clock
add wave -noupdate -color Blue -radix decimal -radixenum numeric /Pratica1/data
add wave -noupdate -color Cyan /Pratica1/wraddress
add wave -noupdate -color White /Pratica1/wren
add wave -noupdate /Pratica1/rdaddress
add wave -noupdate -color Red -radix decimal /Pratica1/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 204
configure wave -valuecolwidth 109
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
WaveRestoreZoom {457 ps} {1020 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/Pratica1/clock 
wave create -driver freeze -pattern constant -value 0 -range 7 0 -starttime 0ps -endtime 1000ps sim:/Pratica1/data 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000101 -range 7 0 -starttime 0ps -endtime 100ps Edit:/Pratica1/data 
wave modify -driver freeze -pattern constant -value 00011000 -range 7 0 -starttime 200ps -endtime 300ps Edit:/Pratica1/data 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/Pratica1/wren 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/Pratica1/clock 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps Edit:/Pratica1/wren 
wave modify -driver freeze -pattern constant -value 1 -starttime 200ps -endtime 300ps Edit:/Pratica1/wren 
wave create -driver freeze -pattern constant -value 0 -range 4 0 -starttime 0ps -endtime 1000ps sim:/Pratica1/wraddress 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000 -range 4 0 -starttime 0ps -endtime 100ps Edit:/Pratica1/wraddress 
wave modify -driver freeze -pattern constant -value 00011 -range 4 0 -starttime 200ps -endtime 300ps Edit:/Pratica1/wraddress 
wave create -driver freeze -pattern constant -value 0 -range 4 0 -starttime 0ps -endtime 1000ps sim:/Pratica1/rdaddress 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00011 -range 4 0 -starttime 400ps -endtime 500ps Edit:/Pratica1/rdaddress 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/Pratica1/clock 
wave modify -driver freeze -pattern clock -initialvalue St1 -period 100ps -dutycycle 50 -starttime 25ps -endtime 1000ps Edit:/Pratica1/clock 
wave modify -driver freeze -pattern constant -value 00011 -range 4 0 -starttime 0ps -endtime 1000ps Edit:/Pratica1/rdaddress 
wave modify -driver freeze -pattern constant -value 0 -range 4 0 -starttime 0ps -endtime 1000ps Edit:/Pratica1/rdaddress 
wave modify -driver freeze -pattern constant -value 00011 -range 4 0 -starttime 400ps -endtime 500ps Edit:/Pratica1/rdaddress 
WaveCollapseAll -1
wave clipboard restore
