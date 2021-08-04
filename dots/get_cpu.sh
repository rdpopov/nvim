#!/bin/sh
echo -n $(ps -aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {printf "#[bg=#ffe6b3,fg=#14191f] Cpu %.1f%",s/'$(nproc)'}') \
        $(free|awk 'NR==2{printf "#[fg=#14191F,bg=#87dfeb] Ram %.1f/%.1f",$3/1000000,$2/1000000}') \
        $(df |awk 'NR==4{printf "#[fg=#14191F,bg=#d4bfff] %.1f Gb ",$4/1000000}')
