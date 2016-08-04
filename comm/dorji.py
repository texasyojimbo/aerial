#!/usr/bin/env python

########################################
##
## dorji.py
## ------------
## Author: ad5nl@arrl.org
## Date: July 2016
## 
## Purpose: This contains utility
## functions for dealing with the DORJI
## DRA818V module.
##
########################################

import sys
import serial

device_label = "DORJI DRA818V"
serial_device = "/dev/serial0"
baudrate = 9600

def uart_transaction( transaction_name,request,expected_response,success,failure ): 
	print ("Attempting %s (%s) with %s on: %s  . . . " % (transaction_name,repr(request),device_label,serial_device)),
	ser = serial.Serial(port=serial_device,baudrate=baudrate)
	ser.write(request)
	response = ser.readline()
	if expected_response in str(response):
		print (" %s (%s). " % (str(success),repr(response)))
		return 0
	else:
		print (" %s (%s). " % (str(failure),repr(response)))
		return 1

def handshake( ):
        return uart_transaction( "handshake", "AT+DMOCONNECT\r\n","+DMOCONNECT:0\r\n","Success","Failure" )


def tune( gbw,tfv,rfv,tx_ctcss,sq,rx_ctcss ):
	gbw_range = [0,1]
	if gbw not in gbw_range:
		print("Error: GBW %s not in range [0,1]" % gbw)	
		exit(1)
	
	if tfv < 144 or tfv > 148:
		print("Error: TFV %s is out of range (144.0000 - 148.0000)" % tfv)
		exit(1)
	
	if rfv < 134 or rfv > 174:
		print("Error: RFV %s is out of range (134.0000 - 174.0000)" % rfv)
		exit(1)

	sq_range = [0,1,2,3,4,5,6,7,8]
	if sq not in sq_range:
		print("Error: SQ %s not in range [0...8]" % sq)
		exit(1)

	command_string = "AT+DMOSETGROUP=%s,%s,%s,%s,%s,%s\r\n" % (gbw,str(format(tfv,'.4f')),str(format(rfv,'.4f')),tx_ctcss,sq,rx_ctcss)
	return uart_transaction( "channel set", command_string, "+DMOSETGROUP:0\r\n","Success","Failure" )
	

def scan( frequency ):
	if frequency < 134 or frequency > 174:
		print("Error: frequency %s is out of range (134.0000 - 174.0000)" % frequency)

	command_string = "S+%s\r\n" % str(format(frequency,'.4f'))
	return uart_transaction( "scan frequency", command_string, "S=1\r\n", "Channel Clear", "Channel Busy or Error")
