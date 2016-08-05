#!/bin/bash

PART='/'
PCENT_WARN='50'
PCENT_CRIT='90'
DIR='/home/pi/aerial/data/sys'
FILE_WARN="$DIR/DISK_WARN"
FILE_CRIT="$DIR/DISK_CRIT"
LOG_FILE="$DIR/DISK_LOG"

#rm $FILE_WARN $FILE_CRIT > /dev/null 2>&1

DATE=`date -Iseconds`
PCENT_USED=`df --output=pcent $PART | tail -1`
PCENT_USED=${PCENT_USED:1}
PCENT_USED=${PCENT_USED%\%}
echo $PCENT_USED
echo $DATE,$PCENT_USED >> $LOG_FILE

if [ $PCENT_USED -gt $PCENT_WARN ]
	then 
		touch $FILE_WARN
		if [ $PCENT_USED -gt $PCENT_CRIT ]
			then
				touch $FILE_CRIT
		fi
fi
