#!/bin/sh
battery=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1|awk 'NR>=19 && NR<=20 {if ($1 == "percentage:") print "#[bg=#1e1e1e,fg=#f02e6e] ⭍" $2}')
date="#[bg=#1e1e1e,fg=#63f2f1]"$(date +" "%d/%b)
time="#[bg=#1e1e1e,fg=#62d196]"$(date +" "%H:%M)
cpu=$(ps -aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {printf "#[fg=#ffe6b3,bg=#1e1e1e] 📻%.1f%",s/'$(nproc)'}')
ram=$(free|awk 'NR==2{printf "#[bg=#1e1e1e,fg=#87dfeb] ɤ%.1f%",($3/$2)*100}')
storage=$(df / |awk 'NR==2{printf "#[bg=#1e1e1e,fg=#d4bfff] 💿%.1f",$4/1000000}')
echo -n $battery$time$date$cpu$ram$storage
