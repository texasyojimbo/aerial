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
## turn off the PTT and Sleep mode on
## the DRA818V, then to test UART by
## running handshake.py. This Python 
## script sends a handshake to the 
## DRA818V.
##
########################################     


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
