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

def uart_transaction( device,ttydev,baudrate,request,expected_response ): 
	total = len(sys.argv)
	cmdargs = sys.argv
	print ("Attempting handshake with %s on: %s " % (device,ttydev))
	ser = serial.Serial(port=ttydev,baudrate=baudrate)
	ser.write(request)
	response = ser.readline()
	if expected_response in str(response):
		print ("Success: %s " % str(response))
		exit(0)
	else:
		print ("Fail: %s " % str(response))
		exit(1)

def handshake( serial_device ):
        device = 'DORJI DRA818V'
	baud = 9600
	serial = '/dev/serial0'
	uart_transaction( device,serial,baud,"AT+DMOCONNECT\r\n","+DMOCONNECT:0\r\n" )


handshake( "/dev/serial0" )
