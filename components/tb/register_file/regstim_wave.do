onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label ReadData1 -radix decimal -radixshowbase 0 /regstim/dut/ReadData1
add wave -noupdate -label ReadData2 -radix decimal -radixshowbase 0 /regstim/dut/ReadData2
add wave -noupdate -label WriteData -radix decimal -radixshowbase 0 /regstim/dut/WriteData
add wave -noupdate -label ReadRegister1 /regstim/dut/ReadRegister1
add wave -noupdate -label ReadRegister2 /regstim/dut/ReadRegister2
add wave -noupdate -label WriteRegister /regstim/dut/WriteRegister
add wave -noupdate -label RegWrite /regstim/dut/RegWrite
add wave -noupdate -label clk /regstim/dut/clk
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
WaveRestoreZoom {0 ps} {501375 ns}
