#!/bin/bash

USB_SND=$(aplay -l | grep USB | awk -F" " '{print $2}' | awk -F: '{print $1}')
export AUDIODEV="hw:$USB_SND,0"
play $1
