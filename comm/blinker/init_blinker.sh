#!/bin/bash

########################################
##
## init_blinker.sh
## -------------
## Author: ad5nl@arrl.net
## Date: August 2016
##
########################################     

COMM_DIR="/home/pi/aerial/comm"
GPIO=12

source $COMM_DIR/comm_functions.sh

init_gpio $GPIO out 0
gpio_toggle $GPIO "sleep 1"


