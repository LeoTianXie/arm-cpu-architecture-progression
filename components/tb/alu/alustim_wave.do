onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label A -radix decimal -radixshowbase 0 /alustim/dut/A
add wave -noupdate -label B -radix decimal -radixshowbase 0 /alustim/dut/B
add wave -noupdate -label cntrl /alustim/dut/cntrl
add wave -noupdate -label result -radix decimal -radixshowbase 0 /alustim/dut/result
add wave -noupdate -label negative /alustim/dut/negative
add wave -noupdate -label zero /alustim/dut/zero
add wave -noupdate -label overflow /alustim/dut/overflow
add wave -noupdate -label carry_out /alustim/dut/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10148272727 ps} 0}
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
WaveRestoreZoom {9181312500 ps} {11832562500 ps}
