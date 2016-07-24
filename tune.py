#!/usr/bin/env python

import sys
import serial

device = 'DORJI DRA818V'
baudrate = 9600
handshake_request = 'AT+DMOCONNECT\r\n'
expected_response = '+DMOCONNECT:0\r\n'
expected_response2 = '+DMOSETGROUP:0\r\n'
default_serial = '/dev/serial0'

total = len(sys.argv)
cmdargs = sys.argv

if  total > 1:
	ttydev = str(cmdargs[1])
else:
	ttydev = default_serial

if total > 2:
	command_params = str(cmdargs[2])
else:
	command_params = '0,144.3900,144.3900,0000,4,0000\r\n'

command = "AT+DMOSETGROUP=%s" % command_params
command = command + "\r\n"

print ("Attempting handshake with %s on: %s " % (device,ttydev))

ser = serial.Serial(port=ttydev,baudrate=baudrate)

ser.write(handshake_request)
response = ser.readline()

if str(response) == expected_response:
	print ("Success: %s " % str(response))
	print ("Attempting to set string: %s" % command_params)
	ser.write(command)
	response2 = ser.readline()
	if str(response2) == expected_response2:
		print ("Success: %s " % str(response2))
		exit(0)
	else:
		print ("Failed: $s " % str(response2))
		exit(1)
else:
	print ("Fail: %s " % str(response))
	exit(1)
