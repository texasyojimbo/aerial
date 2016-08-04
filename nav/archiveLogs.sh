#!/bin/bash

ARCHIVE_PATH="/home/pi/aerial/data/nav/archive"
ARCHIVE_PATTERN="$ARCHIVE_PATH/archive*.nmea.txt"
DATE=$(date +%Y%m%d_%H%M)
TARBALL_FILE="$ARCHIVE_PATH/archive.$DATE.nmea.tgz"

tar -czvf $TARBALL_FILE $ARCHIVE_PATTERN > /dev/null 2>&1
rm $ARCHIVE_PATTERN > /dev/null 2>&1
