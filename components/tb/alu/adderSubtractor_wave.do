onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label a -radix decimal -radixshowbase 0 /adderSubtractor_testbench/dut/a
add wave -noupdate -label b -radix decimal -radixshowbase 0 /adderSubtractor_testbench/dut/b
add wave -noupdate -label carry_in /adderSubtractor_testbench/dut/carry_in
add wave -noupdate -label result -radix decimal -radixshowbase 0 /adderSubtractor_testbench/dut/result
add wave -noupdate -label overflow /adderSubtractor_testbench/dut/overflow
add wave -noupdate -label carry_out /adderSubtractor_testbench/dut/carry_out
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
WaveRestoreZoom {0 ps} {735 ms}
