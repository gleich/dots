#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Turn off Receiver
# @raycast.mode silent
# @raycast.packageName Music

# Documentation:
# @raycast.description Turned off my Yamaha R-N800A Receiver

receiver_address="192.168.1.04"

# turn off receiver
curl --silent --output /dev/null "http://${receiver_address}/YamahaExtendedControl/v1/main/setPower?power=standby"

echo "Turned off Yamaha R-N800A"
