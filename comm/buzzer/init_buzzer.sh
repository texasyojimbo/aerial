#!/bin/bash

########################################
##
## init_buzzer.sh
## -------------
## Author: ad5nl@arrl.net
## Date: August 2016
##
########################################     

COMM_DIR="/home/pi/aerial/comm"
GPIO=16

source $COMM_DIR/comm_functions.sh

init_gpio $GPIO out 0
gpio_toggle $GPIO "sleep 1"


