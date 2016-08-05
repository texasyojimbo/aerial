#!/bin/bash

GET_NMEA_SH="/home/pi/aerial/nav/gps/getNMEA.sh"
GPS_DEVICE="/dev/ttyACM0"
LOG_PATH="/home/pi/aerial/data/nav/gps/"
CURRENT_LOG="$LOG_PATH/nmea.txt"
DATE=$(date +%Y%m%d_%H%M)
ARCHIVE_LOG="$LOG_PATH/archive/archive.$DATE.nmea.txt"

pkill -f $GET_NMEA_SH
pkill -f $GPS_DEVICE

if [ -f $CURRENT_LOG ]
then
	mv $CURRENT_LOG $ARCHIVE_LOG
fi

$($GET_NMEA_SH $GPS_DEVICE $CURRENT_LOG) &
