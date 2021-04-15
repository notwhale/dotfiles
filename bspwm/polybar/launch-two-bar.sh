#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c $HOME/.config/bspwm/polybar/config --reload top &

if [[ $(xrandr --query | grep "HDMI-A-0 connected") ]]; then
    polybar -c $HOME/.config/bspwm/polybar/config --reload top-external &
fi

# polybar top &
# polybar bottom &

echo "Bars launched..."
