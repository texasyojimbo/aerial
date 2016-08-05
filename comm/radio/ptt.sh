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

COMM_DIR="/home/pi/aerial/comm"
PTT_GPIO=17

source $COMM_DIR/comm_functions.sh

#################################
##
## ptt [command]
##
#################################
function ptt () {
	gpio_toggle $PTT_GPIO "$1"
}

######################################
##
## Main 
##
######################################
ptt "$1"
