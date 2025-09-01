#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Turn on Receiver
# @raycast.mode silent
# @raycast.packageName Music

# Documentation:
# @raycast.description Turned on my Yamaha R-N800A Receiver

receiver_address="192.168.1.04"

# turn on receiver
curl --silent --output /dev/null "http://${receiver_address}/YamahaExtendedControl/v1/main/setPower?power=on"

# set input to USB DAC
curl --silent --output /dev/null "http://${receiver_address}/YamahaExtendedControl/v1/main/setInput?input=usb_dac"

curl --silent --output /dev/null "http://192.168.1.39/YamahaExtendedControl/v1/main/setInput?input=airplay"

echo "Turned on Yamaha R-N800A"
