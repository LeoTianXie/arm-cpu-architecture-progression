onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label q /D_FF_enable_testbench/dut/q
add wave -noupdate -label d /D_FF_enable_testbench/dut/d
add wave -noupdate -label reset /D_FF_enable_testbench/dut/reset
add wave -noupdate -label clk /D_FF_enable_testbench/dut/clk
add wave -noupdate -label enable /D_FF_enable_testbench/dut/enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {6300 ps}
