#!/bin/sh

# # Terminate already running bar instances
killall -q polybar

# # Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do usleep 100; done

# Launch bar1 and bar2
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# MONITORS=$MONITORS polybar main;

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi

# echo "Bars launched..."
