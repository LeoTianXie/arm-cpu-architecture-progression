onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label i /mux32_1_testbench/dut/i
add wave -noupdate -label sel /mux32_1_testbench/dut/sel
add wave -noupdate -label out /mux32_1_testbench/dut/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {515938 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 193
configure wave -valuecolwidth 200
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
WaveRestoreZoom {0 ps} {3675 ns}
