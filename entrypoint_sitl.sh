#######################################################################
## Container entrypoint and app launcher
## Maintainer: Chirag Makwana
## Usage: entrypoint_sitl.sh PARAM_FILE
#######################################################################

export PATH=/usr/lib/ccache:/ardupilot/Tools:$HOME/.local/bin:${PATH}
PARAM_FILE=$1


if [ [$1 == ""] ]
then 
    echo "File not provided loading default params";
    Tools/autotest/sim_vehicle.py -v ArduCopter -f gazebo-iris --wipe-eeprom -m --mav10 --console -I1  
else 
    Tools/autotest/sim_vehicle.py -v ArduCopter -f gazebo-iris --wipe-eeprom --add-param-file=$PARAM_FILE -m --mav10 --out=udp:$GROUNDCTRL_IP:$UDP_PORT --console -I1  
fi 