#!/bin/bash

LOAD_WARN='100'
LOAD_CRIT='500'

DIR='/home/pi/aerial/data/sys'
FILE_WARN="$DIR/LOAD_WARN"
FILE_CRIT="$DIR/LOAD_CRIT"
LOG_FILE="$DIR/LOAD_LOG"

#rm $FILE_WARN $FILE_CRIT > /dev/null 2>&1

DATE=`date -Iseconds`
LOAD_STRING=`uptime | cut -d: -f 5`
LOAD_STRING=${LOAD_STRING// /}
LOAD_1M=`echo $LOAD_STRING | cut -d, -f 1`
echo $LOAD_1M
echo $DATE,$LOAD_STRING >> $LOG_FILE

LOAD_1M=${LOAD_1M/./}

if [ $LOAD_1M -gt $LOAD_WARN ]
	then 
		touch $FILE_WARN
		if [ $LOAD_1M -gt $LOAD_CRIT ]
			then
				touch $FILE_CRIT
		fi
fi
