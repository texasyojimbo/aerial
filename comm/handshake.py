#!/usr/bin/env python

########################################
##
## handshake.py
## ------------
## Author: ad5nl@arrl.org
## Date: July 2016
## 
## Purpose: This handshakes with the
## DORJI DRA818V module using the 
## Raspberry Pi /dev/serial0 UART 
## interface. Connect pins 8 and 10 on
## the Pi to pins 16 and 17 on the 
## radio.
##
########################################

import sys
import serial
from dorji import uart_transaction
from dorji import handshake

exit(handshake())
