#!/bin/bash

WARN='50'
CRIT='90'
DIR='/home/pi/aerial/data/sys'
FILE_WARN="$DIR/MEM_WARN"
FILE_CRIT="$DIR/MEM_CRIT"
LOG_FILE="$DIR/MEM_LOG"

#rm $FILE_WARN $FILE_CRIT > /dev/null 2>&1

DATE=`date -Iseconds`
MEM_USED=`free -m | grep + | awk -F' ' '{ print $3 }'`
MEM_FREE=`free -m | grep + | awk -F' ' '{ print $4 }'`

echo $MEM_USED

echo $DATE,$MEM_USED >> $LOG_FILE

if [ $MEM_USED -gt $WARN ]
	then 
		touch $FILE_WARN
		if [ $MEM_USED -gt $CRIT ]
	 		then
				touch $FILE_CRIT
		fi
fi
