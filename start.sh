if [ $# -eq 0 ]; then
    echo "no vlaue given"
    stop_time="10000ms"
else
    stop_time=$1
fi


echo "Initiating compilation process"

ghdl -a --ieee=synopsys LedController.vhd
ghdl -a LedControllerTop.vhd
ghdl -e --ieee=synopsys LED_Controller_Top
ghdl -r --ieee=synopsys LED_Controller_Top --vcd=ledcontrollertop.vcd --stop-time=$stop_time

echo "Starting gtkwave for simulation"
gtkwave ledcontrollertop.vcd