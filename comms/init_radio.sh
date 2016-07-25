#!/bin/bash

########################################
##
## init_radio.sh
## -------------
## Author: ad5nl@arrl.net
## Date: July 2016
##
## Setup: connect Dorji DRA818V module
## to Raspberry Pi using these pins
##
## RASPBERRY PI       DRA818V
## -----------------------------
## 6 or 9 GND         10 Ground
## 8 TXD              16 RXD
## 10 RXD             17 TXD
##
## Purpose: The purpose of this is to 
## turn off the PTT and Sleep mode.
##
########################################     

########################################
##
## init_gpio [gpio#] [direction] [value]
##
########################################
function init_gpio () {
if [ ! -f /sys/class/gpio/gpio$1/value ]
then
	gpio export $1 $2
fi
echo $2 > /sys/class/gpio/gpio$1/direction
echo $3 > /sys/class/gpio/gpio$1/value
}

init_gpio 17 out 1
init_gpio 27 out 1
