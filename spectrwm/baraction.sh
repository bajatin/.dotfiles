#!/bin/bash
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  # hdd="$(df -h | awk 'NR==4{print $3, $5}')"
hdd="$(df -h /home | grep /dev | awk '{print $3 " / "$2}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
used="$(free | grep Mem: | awk '{print $3}')"
total="$(free | grep Mem: | awk '{print $2}')"

#totalh="$(free -h | grep Mem: | awk '{print $2}' | sed 's/Gi/G/')"

ram="MEM: $(( 200 * $used/$total - 100 * $used/$total ))%"

echo $ram
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
	vol="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $2 }')"
	echo -e "$vol"
}
## BATTERY
bat() {
batstat="$(cat /sys/class/power_supply/BAT0/status)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $batstat = 'Charging' ]; then
    batstat=""
    elif [[ $battery -ge 5 ]] && [[ $battery -le 19 ]]; then
    batstat=""
    elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
    batstat=""
    elif [[ $battery -ge 40 ]] && [[ $battery -le 59 ]]; then
    batstat=""
    elif [[ $battery -ge 60 ]] && [[ $battery -le 79 ]]; then
    batstat=""
    elif [[ $battery -ge 80 ]] && [[ $battery -le 95 ]]; then
    batstat=""
    elif [[ $battery -ge 96 ]] && [[ $battery -le 100 ]]; then
    batstat=""
fi

echo "$batstat $battery %"
}
SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the
# echo output too long to display correctly.
SLEEP_SEC=2
      #loops forever outputting a line every SLEEP_SEC secs
      while :; do
    echo "+@fg=1; $(cpu)+@fg=0;|+@fg=2;  $(mem)|+@fg=3;  $(hdd)|+@fg=4;  $(vol)+@fg=0;| $(bat)|"
		sleep $SLEEP_SEC
		done
