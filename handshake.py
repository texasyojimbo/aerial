#!/usr/bin/env python

import sys
import serial

device = 'DORJI DRA818V'
baudrate = 9600
handshake_request = 'AT+DMOCONNECT\r\n'
expected_response = '+DMOCONNECT:0\r\n'
default_serial = '/dev/serial0'


total = len(sys.argv)
cmdargs = sys.argv

if  total > 1:
	ttydev = str(cmdargs[1])
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
