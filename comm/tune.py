#!/usr/bin/env python

import sys
import serial
import getopt
from dorji import handshake
from dorji import tune


gbx = 0
txf = 144.39
rxf = 0
txc = "0000"
sqv = 1
rxc = "0000"

try: 
	opts, args = getopt.getopt(sys.argv[1:],"g:t:r:c:s:C:",["gbw=","tfv=","rfv=","tx_ctcss=","sq=","rx_ctcss="])
except getopt.GetoptError:
	print "tune.py -g <gbw> -t <tfv> -r <rfv> -c <tx_ctcss> -C <rx_ctcss> -s <squelch>"
	exit(2)
for opt, arg in opts:
	if opt in ("-g", "--gbv"):
		gbx = int(arg)
	elif opt in ("-t", "--tfv"):
		txf = float(arg)
	elif opt in ("-r", "--rfv"):
		rxf = float(arg)
	elif opt in ("-c", "--tx_ctcss"):
		txc = arg
	elif opt in ("-C", "--rx_ctcss"):
		rxc = arg
	elif opt in ("-s", "--sq"):
		sqv = int(arg)

if rxf == 0:
	rxf = txf

if handshake() == 0:
	exit(tune(gbx,txf,rxf,txc,sqv,rxc))
else:
	exit(1)

