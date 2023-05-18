# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 2.50 -waveform {0 1.25} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {switch_clear}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {switch_clear}]
	
##Buttons
    #set_property PACKAGE_PIN U18 [get_ports btnC]                        
        #set_property IOSTANDARD LVCMOS33 [get_ports btnC]
    set_property PACKAGE_PIN T18 [get_ports push_clock]                        
        set_property IOSTANDARD LVCMOS33 [get_ports push_clock]
    #set_property PACKAGE_PIN W19 [get_ports btnL]                        
        #set_property IOSTANDARD LVCMOS33 [get_ports btnL]
    set_property PACKAGE_PIN T17 [get_ports push_reset]                        
        set_property IOSTANDARD LVCMOS33 [get_ports push_reset]
    #set_property PACKAGE_PIN U17 [get_ports btnD]                        
        #set_property IOSTANDARD LVCMOS33 [get_ports btnD]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {RegWriteW}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RegWriteW]
set_property PACKAGE_PIN E19 [get_ports {RegWriteM}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RegWriteM}]
set_property PACKAGE_PIN U19 [get_ports {RegWriteE}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RegWriteE}]
set_property PACKAGE_PIN V19 [get_ports {RegWriteD}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {RegWriteD}]

set_property PACKAGE_PIN N3 [get_ports {MemWriteM}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MemWriteM}]
set_property PACKAGE_PIN P1 [get_ports {MemWriteE}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MemWriteE}]
set_property PACKAGE_PIN L1 [get_ports {MemWriteD}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MemWriteD}]
	
	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN V7 [get_ports dp]							
	set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
	
	
	
	