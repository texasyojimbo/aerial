#!/bin/bash

OUT_PATH="/home/pi/aerial/data/nav/gps"
NMEA_FILE="$OUT_PATH/nmea.txt"
LAST_POS_FILE="$OUT_PATH/last_pos.txt"

if [ -f $NMEA_FILE ]
then
	LAST_GPGGA_LINE=$(grep --line-buffered "GPGGA" $NMEA_FILE | tail -n 1 )
else
	exit 1
fi

if [ -z "$LAST_GPGGA_LINE" ]
then
	exit 1
fi

#TIME=$(echo $LAST_GPGGA_LINE | awk -F, '{ print $2 }')
LAT=$(echo $LAST_GPGGA_LINE | awk -F, '{ print $3 }')
N_S=$(echo $LAST_GPGGA_LINE | awk -F, '{ print $4 }')
LON=$(echo $LAST_GPGGA_LINE | awk -F, '{ print $5 }')
E_W=$(echo $LAST_GPGGA_LINE | awk -F, '{ print $6 }')
ALT=$(echo $LAST_GPGGA_LINE | awk -F, '{ print $10 }')

LATPOS=""

if [ "$N_S" == "S" ]
then
	LATPOS="-"
fi

if [ "$E_W" == "W" ]
then
	LONPOS="-"
fi

if [ -z "$LAT" ]
then
	exit 1
fi

if [ -z "$LON" ]
then
	exit 1
fi

if [ -z "$ALT" ]
then
	exit 1
fi

#HHMMSS=${TIME:0:2}:${TIME:2:2}:${TIME:4:2}
LATDEG=${LAT:0:2}
LATMIN=${LAT:2}
LONDEG=${LON:0:3}
LONMIN=${LON:3}
LATDEC=$(echo "$LATDEG + ($LATMIN / 60)" | bc -l)
LONDEC=$(echo "$LONDEG + ($LONMIN / 60)" | bc -l)

echo $LATPOS$LATDEC $LONPOS$LONDEC $ALT > $LAST_POS_FILE

