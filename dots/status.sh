#!/bin/sh

date_battery="#[fg=#14191f,bg=#f02e6e] "$([[ $HAS_BATTERY == "0" ]] &&  date +%H:%M ||  upower -i /org/freedesktop/UPower/devices/battery_BAT1|awk 'NR>=19 && NR<=20 {if ($1 == "percentage:") print "B " $2}')
date="#[fg=#14191F,bg=#62d196]"$(date +" "%H:%M)
cpu=$(ps -aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {printf "#[bg=#ffe6b3,fg=#14191f] Cpu %.1f%",s/'$(nproc)'}')
ram=$(free|awk 'NR==2{printf "#[fg=#14191F,bg=#87dfeb] Ram %.1f/%.1f",$3/1000000,$2/1000000}')
storage=$(df / |awk 'NR==2{printf "#[fg=#14191F,bg=#d4bfff] %.1f Gb ",$4/1000000}')

echo -n $date_battery $date $cpu $ram $storage
