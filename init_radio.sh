#!/bin/bash
if [ ! -f /sys/class/gpio/gpio17/value ]
then
	echo 17 > /sys/class/gpio/export
fi
if [ ! -f /sys/class/gpio/gpio27/value ]
then 
	echo 27 > /sys/class/gpio/export
fi

echo out > /sys/class/gpio/gpio17/direction
echo out > /sys/class/gpio/gpio27/direction
echo 1 > /sys/class/gpio/gpio17/value
echo 1 > /sys/class/gpio/gpio27/value
sleep 1
/home/pi/handshake.py
