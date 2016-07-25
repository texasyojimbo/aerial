#!/bin/bash

###############################
##
## ptt.sh 
## ------
## Author: ad5nl@arrl.net
## Date: July 2016
##
## Purpose: The purpose of this
## script is to trigger the PTT
## line for the DORJI DRA818V.
## This line is triggered by 
## pulling voltage on pin 5 to
## ground.This will be done by 
## echoing 0 (off) to GPIO17 
## (pin 11).
## 
## Usage: ptt.sh "[command]"
##
## where command is command 
## that will run while the PTT
## is down (ex. play wav file).
##
###############################

#################################
##
## gpio_toggle [gpio#] [command]
##
#################################
function gpio_toggle () {
	if [ -f /sys/class/gpio/gpio$1/value ]; then
		INIT_STATE=$(cat /sys/class/gpio/gpio$1/value)
		if [ $INIT_STATE == "1" ]; then
			echo 0 > /sys/class/gpio/gpio$1/value
			$2
			echo 1 > /sys/class/gpio/gpio$1/value
		else
			echo 1 > /sys/class/gpio/gpio$1/value
			$2
			echo 0 > /sys/class/gpio/gpio$1/value
		fi
		return 0
	else
		return 1
	fi
}

#################################
##
## ptt [command]
##
#################################
function ptt () {
	gpio_toggle 17 "$1"
}

#################################
##
## dit [gpio#]
##
#################################
function dit () {
	sleep 0.1 && gpio_toggle $1 "sleep 0.1"
}

#################################
##
## dah [gpio#]
##
#################################
function dah () {
	sleep 0.1 && gpio_toggle $1 "sleep 0.3" 
}

##################################
##
## sp 
## 
##################################
function sp () {
	sleep 0.6
}

###########################################
##
## key [gpio#] [message<a-z,0-9,.,?,space>] 
##
############################################
function key () {
	for (( i=0; i<${#2}; i++ )); do
		char="${2:$i:1}"
		char="${char,,}"
		case $char in
		"a")
			dit $1 && dah $1 && sp
			;;
		"b")
			dah $1 && dit $1 && dit $1 && dit $1 && sp
			;;
		"c")
			dah $1 && dit $1 && dah $1 && dit $1 && sp
			;;
		"d")
			dah $1 && dit $1 && dit $1 && sp
			;;
		"e")
			dit $1 && sp
			;;
		"f")
			dit $1 && dit $1 && dah $1 && dit $1 && sp
			;;
		"g")
			dah $1 && dah $1 && dit $1 && sp
			;;
		"h")
			dit $1 && dit $1 && dit $1 && dit $1 && sp
			;;
		"i")
			dit $1 && dit $1 && sp
			;;
		"j")
			dit $1 && dah $1 && dah $1 && dah $1 && sp
			;;
		"k")
			dah $1 && dit $1 && dah $1 && sp
			;;
		"l")
			dit $1 && dah $1 && dit $1 && dit $1 && sp
			;;
		"m")
			dah $1 && dah $1 && sp
			;;
		"n")
			dah $1 && dit $1 && sp
			;;
		"o")
			dah $1 && dah $1 && dah $1 && sp
			;;
		"p")
			dit $1 && dah $1 && dah $1 && dit $1 && sp
			;;
		"q")
			dah $1 && dah $1 && dit $1 && dah $1 && sp	
			;;
		"r")
			dit $1 && dah $1 && dit $1 && sp	
			;;
		"s")
			dit $1 && dit $1 && dit $1 && sp
			;;
		"t")
			dah $1
			;;
		"u")
			dit $1 && dit $1 && dah $1 && sp
			;;
		"v")
			dit $1 && dit $1 && dit $1 && dah $1 && sp
			;;	
		"w")
			dit $1 && dah $1 && dah $1 && sp
			;;
		"x")
			dah $1 && dit $1 && dit $1 && dah $1 && sp
			;;
		"y")
			dah $1 && dit $1 && dah $1 && dah $1 && sp	
			;;
		"z")
			dah $1 && dah $1 && dit $1 && dit $1 && sp
			;;	
		"1")
			dit $1 && dah $1 && dah $1 && dah $1 && dah $1 && sp
			;;
		"2")
			dit $1 && dit $1 && dah $1 && dah $1 && dah $1 && sp
			;;
		"3")
			dit $1 && dit $1 && dit $1 && dah $1 && dah $1 && sp
			;;
		"4")
			dit $1 && dit $1 && dit $1 && dit $1 && dah $1 && sp
			;;
		"5")
			dit $1 && dit $1 && dit $1 && dit $1 && dit $1 && sp
			;;
		"6")
			dah $1 && dit $1 && dit $1 && dit $1 && dit $1 && sp
			;;
		"7")
			dah $1 && dah $1 && dit $1 && dit $1 && dit $1 && sp
			;;
		"8")
			dah $1 && dah $1 && dah $1 && dit $1 && dit $1 && sp
			;;
		"9")
			dah $1 && dah $1 && dah $1 && dah $1 && dit $1 && sp
			;;
		"0")
			dah $1 && dah $1 && dah $1 && dah $1 && dah $1 && sp
			;;
		".")
			dit $1 && dah $1 && dit $1 && dah $1 && dit $1 && dah $1 && sp
			;;
		"?")
			dit $1 && dit $1 && dah $1 && dah $1 && dit $1 && dit $1&& sp
			;;
		" ")
			sp
			;;
		esac
	done
}

##################################################
##
## alternate [gpio#] [time_on] [time_off] [cycles]
##
##################################################
function alternate () {
	count=0
	while [ $count -lt $4 ]; do
		gpio_toggle $1 "sleep $2"
		sleep $3
		let count=count+1
	done
}

######################################
##
## Main 
##
######################################
ptt "$1"
