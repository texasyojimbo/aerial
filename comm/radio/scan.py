#!/usr/bin/env python

import sys
import serial
import getopt
from dorji import handshake
from dorji import scan

frequency = 144.39

try:
	opts, args = getopt.getopt(sys.argv[1:],"r:",["rx_freq="])
except getopt.GetoptError:
	print "scan.py -r <rx_freq>"
	exit(2)
for opt, arg in opts:
	if opt in ("-r", "--rx-freqs"):
		frequency = float(arg)

if handshake() == 0:
	exit(scan(frequency))
else:
	exit(1)
