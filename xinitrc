dunst &
nitrogen --restore &
picom &
sxhkd &
xrandr --output HDMI-0 --mode 1920x1080 --rate 144 &

while true; do
   xsetroot -name " $( date +"%a %b %d, %I:%M %p" ) "
   sleep 5s    # Update time every minute
done &

exec dwm
