dunst &
nitrogen --restore &
sxhkd &

while true; do
   xsetroot -name " $( date +"%a %b %d, %I:%M %p" ) "
   sleep 5s    # Update time every minute
done &

exec dwm
