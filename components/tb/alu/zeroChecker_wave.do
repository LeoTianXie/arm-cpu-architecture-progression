onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label result -radix decimal -radixshowbase 0 /zeroChecker_testbench/dut/result
add wave -noupdate -label zero /zeroChecker_testbench/dut/zero
add wave -noupdate -label 1st /zeroChecker_testbench/dut/firstLayer
add wave -noupdate -label 2nd /zeroChecker_testbench/dut/secondLayer
add wave -noupdate -label 3rd /zeroChecker_testbench/dut/thirdLayer
add wave -noupdate -label 4th /zeroChecker_testbench/dut/fourthLayer
add wave -noupdate -label 5th /zeroChecker_testbench/dut/fifthLayer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 85
configure wave -valuecolwidth 202
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
WaveRestoreZoom {0 ps} {315 ns}
