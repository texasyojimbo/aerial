#!/bin/bash

GPS_DEV=$1
OUT_FILE=$2

grep --line-buffered -v -e "^$" $GPS_DEV | grep "$G" > $OUT_FILE 

