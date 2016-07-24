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

def handshake( serial_device ):
	device = 'DORJI DRA818V'
	baudrate = 9600
	handshake_request = 'AT+DMOCONNECT\r\n'
	expected_response = '+DMOCONNECT:0\r\n'
	default_serial = '/dev/serial0'

	total = len(sys.argv)
	cmdargs = sys.argv

	if  total > 1:
		ttydev = str(serial_device)
	else:
		ttydev = default_serial

	print ("Attempting handshake with %s on: %s " % (device,ttydev))

	ser = serial.Serial(port=ttydev,baudrate=baudrate)

	ser.write(handshake_request)
	response = ser.readline()

	if str(response) == expected_response:
		print ("Success: %s " % str(response))
		exit(0)
	else:
		print ("Fail: %s " % str(response))
		exit(1)

handshake( "/dev/serial0" )
