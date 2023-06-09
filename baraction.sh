#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU $cpu%"
}

## VOLUME
vol() {
    vol=`pamixer --get-volume-human`
    echo -e "VOL $vol"
}

## BATTERY
bat() {
    bat=`cat /sys/class/power_supply/BAT0/capacity`
    echo -e "BAT $bat%"
}

## DATE & TIME
date_time() {
  date_time="$(date '+%a %d %b %H:%M')"
  echo -e "$date_time"
}

SLEEP_SEC=0.25
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "$(cpu)  $(mem)  $(vol)  $(date_time)"
	sleep $SLEEP_SEC
done
