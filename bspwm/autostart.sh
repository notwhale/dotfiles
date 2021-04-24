#! /bin/sh

run() { ! pgrep -x "$1" >/dev/null && "$@"; }


if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
    xrandr --output HDMI-A-0 --primary --left-of eDP
fi

xsetroot -cursor_name left_ptr &
setxkbmap -layout us,ru -option "grp:alt_space_toggle,grp_led:scroll,caps:ctrl_modifier" &
picom -b --config $HOME/.config/picom.conf &
# hsetroot -fill /usr/share/wall/ctld.png &
run nitrogen --restore &
run sxhkd -c $HOME/.config/bspwm/sxhkd/sxhkdrc &
if [ "$(which polybar)" != "polybar not found" ]; then
  $HOME/.config/bspwm/polybar/launch.sh &
  # (sleep 2; sh ~/.bin/phide.sh) &
fi
run tint2 -c $HOME/.config/tint2/tray.tint2rc &
run dunst &
if [ "$(which thunar)" != "thunar not found" ]; then
  thunar --daemon &
fi
# numlockx &
xsettingsd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
gnome-keyring-daemon --start --components=pkcs11 &

# ssh-agent
eval "$(ssh-agent -s)"

# greenclip daemon &

run nm-applet &
# run redshift-gtk &
run xfce4-power-manager &
# run caffeine &
run udiskie -t &
# run clipit &
run parcellite &
# run unclutter &
# run telegram-desktop &
run blueman-tray &
run yandex-disk-indicator &
