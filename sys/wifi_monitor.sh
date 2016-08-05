#!/bin/bash

DIR='/home/pi/aerial/data/sys'
FILE_TRUE="$DIR/WIFI_HEARD"
LOG_FILE="$DIR/WIFI_LOG"

#rm $FILE_TRUE > /dev/null 2>&1

DATE=`date -Iseconds`
WIFI_TEST=`iwlist wlan0 scan | grep -B5 ESSID`
WIFI_EXIT=`echo $WIFI_TEST | echo $?`
echo $WIFI_EXIT
echo $DATE: $WIFI_TEST >> $LOG_FILE

if [ $WIFI_EXIT -eq 0 ]
	then 
		touch $FILE_TRUE
fi
