###########################################################
##
## AERIAL-1 High Altitude Ballooning Scripts
##
###########################################################

This directory contains all the scripts used on my Raspberry Pi Zero
for my high altitude ballooning project.

Files and descriptions to be included below.

/	Root (/home/pi/aerial)

	SYSTEM_CONFIG -- this is a text file that will describe all the changes made to Raspbian Jesse Lite as I work on this project.


/comm	Communication subsystems (VHF Radio, WiFi, Buzzers, Blinkers)

	dorji.py 	-- utility functions for DORJI DRA818V

	handshake.py 	-- Handshake with DORJI DRA818V

	init_radio.sh 	-- wrapper for handshake.py

	scan.py 	-- Use scanning function of DRA818V to determine if channel is in use (e.g. before transmitting)

	tune.py 	-- Set transmit and receive channel string on DRA818V

	ptt.sh		-- Functions for keying the radio


/data	Data store 

	/comm
	
	/nav	

	/sensor

	/sys


/nav	Navigation subsystems (GPS, IMU)

	getNMEA.sh	-- gets NMEA string from USB GPS dongle and directs to log file

	gpsLogger.sh	-- Wrapper for getNMEA.sh, controls logging of NMEA data

	getPos.sh	-- Extract position from GPGGA sentences in NMEA log

	archiveLogs.sh	-- Tarballs old NMEA logs


/sensor	Sensors and Cameras

	/cam		-- Cameras

	/wx		-- Weather sensors (thermometers, barometer, hygrometer, UV light)
