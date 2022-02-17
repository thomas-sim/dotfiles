#!/bin/bash

SCREEN_NAME=eDP-1
# found with xinput -list
TOUCHSCREEN_ID=16
TOUCHPAD_ID=14

if [[ $(xrandr | grep left -o | wc -l) -eq 4 ]]; then # screen orientation = left
	xrandr -o normal
	xinput set-prop "$TOUCHSCREEN_ID" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
	xinput set-prop "$TOUCHPAD_ID" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
else
	xrandr -o left
	xinput set-prop "$TOUCHSCREEN_ID" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	xinput set-prop "$TOUCHPAD_ID" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
fi
