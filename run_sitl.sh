export HOSTIP=$(hostname -I|cut -f1 -d ' ')
xhost + $HOSTIP
rm .env
{
        echo 'UID='$(id -u)
        echo 'GID='$(id -g)
        echo 'HOST_IP='$(hostname -I|cut -f1 -d ' ')
        echo PARAM_DIR=/home/chirag/catkin_ws/src/sald_drone/sald_drone_aim/params
        echo PARAM_FILE='sald_autopilot.param'
        echo GROUNDCTRL_IP=127.0.0.1
        echo UDP_PORT=14550
} >> .env
cat .env

docker-compose --env-file .env up --build ardupilot