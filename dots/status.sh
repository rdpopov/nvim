#!/bin/sh
battery="#[fg=#14191f,bg=#f02e6e]"$(upower -i /org/freedesktop/UPower/devices/battery_BAT1|awk 'NR>=19 && NR<=20 {if ($1 == "percentage:") print " ⭍" $2}')
date="#[fg=#14191f,bg=#63f2f1]"$(date +" "%d/%b)
time="#[fg=#14191F,bg=#62d196]"$(date +" "%H:%M)
cpu=$(ps -aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {printf "#[bg=#ffe6b3,fg=#14191f] 📻%.1f%",s/'$(nproc)'}')
ram=$(free|awk 'NR==2{printf "#[fg=#14191F,bg=#87dfeb] ɤ%.1f%",($3/$2)*100}')
storage=$(df / |awk 'NR==2{printf "#[fg=#14191F,bg=#d4bfff] 💿%.1f",$4/1000000}')
echo -n $battery $time $date $cpu $ram $storage
