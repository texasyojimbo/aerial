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

COMM_DIR="/home/pi/aerial/comm"
PTT_GPIO=17
SLP_GPIO=27

source $COMM_DIR/comm_functions.sh

init_gpio $PTT_GPIO out 1
init_gpio $SLP_GPIO out 1
