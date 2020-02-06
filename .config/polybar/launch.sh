#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar bar1 >>/tmp/polybar1.log 2>&1 &
#polybar bar2 >>/tmp/polybar2.log 2>&1 &
#echo "Bars launched..."

#if type "xrandr" > /dev/null; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload bar1 &
#  done
#else
#  polybar --reload bar1 &
#fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload bar1 &
#    MONITOR=$m polybar --reload bar2 &
done
