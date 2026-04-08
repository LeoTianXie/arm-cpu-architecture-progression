# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./mux2_1.sv"
vlog "./mux4_1.sv"
vlog "./mux8_1.sv"
vlog "./mux16_1.sv"
vlog "./mux32_1.sv"
vlog "./mux64x32_1.sv"
vlog "./enDecoder2_4.sv"
vlog "./enDecoder3_8.sv"
vlog "./enDecoder5_32.sv"
vlog "./D_FF.sv"
vlog "./D_FF_enable.sv"
vlog "./reg64.sv"
vlog "./regfile.sv"
vlog "./regstim.sv"
vlog "./alustim.sv"
vlog "./alu.sv"
vlog "./fullAdder.sv"
vlog "./adderSubtractor.sv"
vlog "./zeroChecker.sv"
vlog "./bitwiseAandB.sv"
vlog "./bitwiseAorB.sv"
vlog "./bitwiseAxorB.sv"
vlog "./mux64x8_1.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work alustim
# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do alustim_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
