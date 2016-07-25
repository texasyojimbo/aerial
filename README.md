###########################################################
##
## AERIAL-1 High Altitude Ballooning Scripts
##
###########################################################

This directory contains all the scripts used on my Raspberry Pi Zero
for my high altitude ballooning project.

Files and descriptions to be included below.

/

	SYSTEM_CONFIG -- this is a text file that will describe all the changes made to Raspbian Jesse Lite as I work on this project.

/comms

	dorji.py 	-- utility functions for DORJI DRA818V

	handshake.py 	-- Handshake with DORJI DRA818V

	init_radio.sh 	-- wrapper for handshake.py

	scan.py 	-- Use scanning function of DRA818V to determine if channel is in use (e.g. before transmitting)

	tune.py 	-- Set transmit and receive channel string on DRA818V

	ptt.sh		-- Functions for keying the radio
